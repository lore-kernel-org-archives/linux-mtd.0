Date: Mon, 15 Oct 2007 15:57:16 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: Recursion in CFI driver. Is it really necessary to have.
In-Reply-To: <alpine.LFD.0.9999.0710121112450.19446@xanadu.home>
Message-ID: <Pine.LNX.4.64.0710151552170.1863@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0710121547550.21455@pentafluge.infradead.org>
	<alpine.LFD.0.9999.0710121112450.19446@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>
> Wow.  That's certainly bad.
>
> It's been a while that I wrote that code, but looking at it now I just
> can't see how that could happen.  It is like if it was recursing on
> itself, but the code explicitly guards against that.  See:
>
> 		if (contender && contender != chip) {
> 			[...]
> 			ret = get_chip(map, contender, contender->start, mode);
>
> So from that point, 'chip' and 'contender' must be equal when get_chip()
> is called again, and therefore recursion should stop there.
>
I think it has a hole here. The issue takes place if we have three or more processes wishing to own chip. 
Assume we have three processes Process 1, Process 2, and Process 3 (a looser process).
Process 1: get_chip CHIP1
 	     contender = CHIP1;
 	     Own chip.

Process 2: get_chip CHIP2
 		contender == CHIP1;
 		get_chip CHIP1 to suspend it.
 	     	Own chip CHIP1.
 		Suspend
 		Own CHIP2.
 		contender = CHIP2;

Process 3: get_chip CHIP3
 		contender == CHIP2;
 		get_chip CHIP2 to suspend it.
 		Can't suspend -> wait
Process 1: 
Process 2: 
Process 1:	do operations and finish with "contender = CHIP1"

Process 3: get_chip CHIP2
 		contender == CHIP1;
 		get_chip CHIP1 to suspend it.
 		Can't suspend -> wait
Process 2: 
Process 1: 
Process 2:	do operations and finish with "contender = CHIP2"

Process 3: get_chip CHIP1
 		contender == CHIP2;
 		get_chip CHIP2 to suspend it.
 		Can't suspend -> wait

Etc.
Process 3 is asking for contender chip which is changing. It causes growing of recursion level.

The most important here, that from point of silicon state machine design view there is no need to have recursion deeper than "level 1".

I've made the patch which heals the deadlock problem. Could you please look at this?

Signed-off-by: Alexey Korolev <akorolev at infradead.org>
=========================================================
diff -aur a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2007-09-25 14:51:06.000000000 +0400
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2007-10-15 18:42:42.000000000 +0400
@@ -86,6 +86,7 @@
  			size_t len);

  static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode);
+static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long adr, int mode);
  static void put_chip(struct map_info *map, struct flchip *chip, unsigned long adr);
  #include "fwh_lock.h"

@@ -644,14 +645,9 @@

  static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
  {
-	DECLARE_WAITQUEUE(wait, current);
+	int ret;
  	struct cfi_private *cfi = map->fldrv_priv;
-	map_word status, status_OK = CMD(0x80), status_PWS = CMD(0x01);
-	unsigned long timeo;
-	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;

- resettime:
-	timeo = jiffies + HZ;
   retry:
  	if (chip->priv && (mode == FL_WRITING || mode == FL_ERASING || mode == FL_OTP_WRITE)) {
  		/*
@@ -686,18 +682,22 @@
  			 * it'll happily send us to sleep.  In any case, when
  			 * get_chip returns success we're clear to go ahead.
  			 */
-			int ret = spin_trylock(contender->mutex);
+			ret = spin_trylock(contender->mutex);
  			spin_unlock(&shared->lock);
  			if (!ret)
  				goto retry;
  			spin_unlock(chip->mutex);
-			ret = get_chip(map, contender, contender->start, mode);
+			ret = chip_ready(map, contender, contender->start, mode);
  			spin_lock(chip->mutex);
+
+			if (ret == -EAGAIN) {
+				spin_unlock(contender->mutex);
+				goto retry;
+			}
  			if (ret) {
  				spin_unlock(contender->mutex);
  				return ret;
  			}
-			timeo = jiffies + HZ;
  			spin_lock(&shared->lock);
  			spin_unlock(contender->mutex);
  		}
@@ -709,6 +709,23 @@
  		spin_unlock(&shared->lock);
  	}

+	ret = chip_ready(map, chip, adr, mode);
+	if (ret == -EAGAIN)
+		goto retry;
+
+
+	return ret;
+}
+
+static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
+{
+
+	DECLARE_WAITQUEUE(wait, current);
+	struct cfi_private *cfi = map->fldrv_priv;
+	map_word status, status_OK = CMD(0x80), status_PWS = CMD(0x01);
+	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
+	unsigned long timeo = jiffies + HZ;
+
  	switch (chip->state) {

  	case FL_STATUS:
@@ -731,7 +748,7 @@
  			cfi_udelay(1);
  			spin_lock(chip->mutex);
  			/* Someone else might have been playing with it. */
-			goto retry;
+			return -EAGAIN;
  		}

  	case FL_READY:
@@ -806,7 +823,7 @@
  		schedule();
  		remove_wait_queue(&chip->wq, &wait);
  		spin_lock(chip->mutex);
-		goto resettime;
+		return -EAGAIN;
  	}
  }

=========================================================
