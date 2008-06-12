Received: from zone0.gcu-squad.org ([212.85.147.21]
	helo=services.gcu-squad.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K6tMa-00074y-Gw
	for linux-mtd@lists.infradead.org; Thu, 12 Jun 2008 20:25:40 +0000
Date: Thu, 12 Jun 2008 22:25:23 +0200
From: Jean Delvare <khali@linux-fr.org>
To: "John Stoffel" <john@stoffel.org>
Subject: Re: 2.6.26-rc5: CFI: Found no ck804xrom @ffc00000 device at
	location zero
Message-ID: <20080612222523.7ae0e8eb@hyperion.delvare>
In-Reply-To: <18513.27708.452410.527696@stoffel.org>
References: <20080612182308.GA1091@ldl.fc.hp.com>
	<18513.27708.452410.527696@stoffel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi John,

On Thu, 12 Jun 2008 14:34:36 -0400, John Stoffel wrote:
> I'm running a AMD X2 box with 4gb of RAM, Ubuntu 8.04 x86_64.  I just
> rebooted the system and I notice the following repeated messages
> (errors? warnings?) in my dmesg output.  I think this is from my
> nForce ethernet chips, but I'm not sure.
> 
> [   13.268005] ck804xrom ck804xrom_init_one(): Unable to register resource 0x00000000ff000000-0x00000000ffffffff - kernel bug?
> [   13.336752] i2c-adapter i2c-0: nForce2 SMBus adapter at 0x1c00
> [   13.336786] i2c-adapter i2c-1: nForce2 SMBus adapter at 0x1c40
> [   13.376771] CFI: Found no ck804xrom @ffc00000 device at location zero
> [   13.398810] JEDEC: Found no ck804xrom @ffc00000 device at location zero
> (...)

Definitely not related to i2c.

Apparently the messages are coming from drivers/mtd/chips/gen_probe.c.
So I doubt it is related to networking either...

They are debugging messages, but printk(KERN_DEBUG ...) is used where
pr_debug(...) should be. The following (untested) patch should fix it:

Subject: [MTD] No debug message when debugging is disabled

Use pr_debug(...) instead of printk(KERN_DEBUG ...) so that the message
is only printed when debugging is enabled.

Signed-off-by: Jean Delvare <khali@linux-fr.org>
---
 drivers/mtd/chips/gen_probe.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-2.6.26-rc5.orig/drivers/mtd/chips/gen_probe.c	2008-04-17 04:49:44.000000000 +0200
+++ linux-2.6.26-rc5/drivers/mtd/chips/gen_probe.c	2008-06-12 22:20:12.000000000 +0200
@@ -71,8 +71,8 @@ static struct cfi_private *genprobe_iden
 	   interleave and device type, etc. */
 	if (!genprobe_new_chip(map, cp, &cfi)) {
 		/* The probe didn't like it */
-		printk(KERN_DEBUG "%s: Found no %s device at location zero\n",
-		       cp->name, map->name);
+		pr_debug("%s: Found no %s device at location zero\n",
+			 cp->name, map->name);
 		return NULL;
 	}
 


-- 
Jean Delvare
