Received: from mycroft.westnet.com ([216.187.52.7])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K6zOE-0004lX-5L
	for linux-mtd@lists.infradead.org; Fri, 13 Jun 2008 02:51:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <18513.57523.963418.72893@stoffel.org>
Date: Thu, 12 Jun 2008 22:51:31 -0400
From: "John Stoffel" <john@stoffel.org>
To: Jean Delvare <khali@linux-fr.org>
Subject: Re: 2.6.26-rc5: CFI: Found no ck804xrom @ffc00000 device at
	location zero
In-Reply-To: <20080612222523.7ae0e8eb@hyperion.delvare>
References: <20080612182308.GA1091@ldl.fc.hp.com>
	<18513.27708.452410.527696@stoffel.org>
	<20080612222523.7ae0e8eb@hyperion.delvare>
Cc: David Woodhouse <dwmw2@infradead.org>, John Stoffel <john@stoffel.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Jean> On Thu, 12 Jun 2008 14:34:36 -0400, John Stoffel wrote:
>> I'm running a AMD X2 box with 4gb of RAM, Ubuntu 8.04 x86_64.  I just
>> rebooted the system and I notice the following repeated messages
>> (errors? warnings?) in my dmesg output.  I think this is from my
>> nForce ethernet chips, but I'm not sure.
>> 
>> [   13.268005] ck804xrom ck804xrom_init_one(): Unable to register resource 0x00000000ff000000-0x00000000ffffffff - kernel bug?
>> [   13.336752] i2c-adapter i2c-0: nForce2 SMBus adapter at 0x1c00
>> [   13.336786] i2c-adapter i2c-1: nForce2 SMBus adapter at 0x1c40
>> [   13.376771] CFI: Found no ck804xrom @ffc00000 device at location zero
>> [   13.398810] JEDEC: Found no ck804xrom @ffc00000 device at location zero
>> (...)

Jean> Definitely not related to i2c.

THanks for the help and quick reply.  I really should have done more
grepping on the source myself.  

Jean> Apparently the messages are coming from
Jean> drivers/mtd/chips/gen_probe.c.  So I doubt it is related to
Jean> networking either...

Heh.  What the heck am I doing with mtd?  *grin*  I must have left it
in when I migrated to my new system here.  

Jean> They are debugging messages, but printk(KERN_DEBUG ...) is used
Jean> where pr_debug(...) should be. The following (untested) patch
Jean> should fix it:

Jean> Subject: [MTD] No debug message when debugging is disabled

Jean> Use pr_debug(...) instead of printk(KERN_DEBUG ...) so that the message
Jean> is only printed when debugging is enabled.

I'm doing a test compile now and a reboot later on this evening and
I'll let you know how it goes.

John


Jean> Signed-off-by: Jean Delvare <khali@linux-fr.org>
Jean> ---
Jean>  drivers/mtd/chips/gen_probe.c |    4 ++--
Jean>  1 file changed, 2 insertions(+), 2 deletions(-)

Jean> --- linux-2.6.26-rc5.orig/drivers/mtd/chips/gen_probe.c	2008-04-17 04:49:44.000000000 +0200
Jean> +++ linux-2.6.26-rc5/drivers/mtd/chips/gen_probe.c	2008-06-12 22:20:12.000000000 +0200
Jean> @@ -71,8 +71,8 @@ static struct cfi_private *genprobe_iden
Jean>  	   interleave and device type, etc. */
Jean>  	if (!genprobe_new_chip(map, cp, &cfi)) {
Jean>  		/* The probe didn't like it */
Jean> -		printk(KERN_DEBUG "%s: Found no %s device at location zero\n",
Jean> -		       cp->name, map->name);
Jean> +		pr_debug("%s: Found no %s device at location zero\n",
Jean> +			 cp->name, map->name);
Jean>  		return NULL;
Jean>  	}
 


Jean> -- 
Jean> Jean Delvare
