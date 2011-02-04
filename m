Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PlOwd-0003Si-03
	for linux-mtd@lists.infradead.org; Fri, 04 Feb 2011 16:55:39 +0000
In-Reply-To: <4D4C2D1D.5040302@keymile.com>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net><OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>
	<25631ED7-C6A0-44B1-B33D-F48DC48C812E@prograde.net>	<OF695F4526.1DB1C212-ONC125782B.00602EFA-C125782B.006F0621@transmode.se>
	<626D0191-85FC-41E2-94C7-CBFF9D9629BE@prograde.net>
	<OFAEC8E64A.F4C40EA8-ONC125782C.002A10F5-C125782C.002D0641@transmode.se>
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>
	<4D4AD9ED.8060104@keymile.com> <4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>
	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@tr
	<4D4C2D1D.5040302@keymile.com>
Subject: Re: Numonyx NOR and chip->mutex bug?
To: stefan.bigler@keymile.com
Message-ID: <OF9ADE2396.33B1CC34-ONC125782D.005CD31A-C125782D.005CFAD8@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Fri, 4 Feb 2011 17:55:35 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, Holger brunck <holger.brunck@keymile.com>,
	Michael Cashwell <mboards@prograde.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Stefan Bigler <stefan.bigler@keymile.com> wrote on 2011/02/04 17:45:17:
>
> Hi Jocke
>
> I tested your proposal to remove the unlock/lock for the
> INVALIDATE_CACHED_RANGE() and without the addtional test
> for unequal states, it worked in my environment.

Great, I have this patch now. Perhaps the both of you can test this
over the weekend?

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e89f2d0..b2665ad 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1245,6 +1245,17 @@ static int inval_cache_and_wait_for_operation(
 	sleep_time = chip_op_time / 2;

 	for (;;) {
+		while (chip->state != chip_state) {
+			/* Someone's suspended the operation: sleep */
+			DECLARE_WAITQUEUE(wait, current);
+			set_current_state(TASK_UNINTERRUPTIBLE);
+			add_wait_queue(&chip->wq, &wait);
+			mutex_unlock(&chip->mutex);
+			schedule();
+			remove_wait_queue(&chip->wq, &wait);
+			mutex_lock(&chip->mutex);
+		}
+
 		status = map_read(map, cmd_adr);
 		if (map_word_andequal(map, status, status_OK, status_OK))
 			break;
@@ -1273,16 +1284,6 @@ static int inval_cache_and_wait_for_operation(
 		}
 		mutex_lock(&chip->mutex);

-		while (chip->state != chip_state) {
-			/* Someone's suspended the operation: sleep */
-			DECLARE_WAITQUEUE(wait, current);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			add_wait_queue(&chip->wq, &wait);
-			mutex_unlock(&chip->mutex);
-			schedule();
-			remove_wait_queue(&chip->wq, &wait);
-			mutex_lock(&chip->mutex);
-		}
 		if (chip->erase_suspended && chip_state == FL_ERASING)  {
 			/* Erase suspend occured while sleep: reset timeout */
 			timeo = reset_timeo;
