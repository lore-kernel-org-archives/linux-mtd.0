Received: from post2.inre.asu.edu ([129.219.110.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170UFs-00077j-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2002 22:24:48 +0100
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.1 #40111)
 id <0GV300801CT88O@asu.edu> for linux-mtd@lists.infradead.org; Wed,
 24 Apr 2002 14:24:44 -0700 (MST)
Date: Wed, 24 Apr 2002 14:24:48 -0700
From: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: Booting from a DiskOnChip2000
In-reply-to: <3CC6A4D2.C230215@darkwater.ch>
To: Thomas Preisig <preisig@darkwater.ch>
Cc: linux-mtd@lists.infradead.org
Message-id: <1019683488.5962.11.camel@russ>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7bit
References: <3CC6A4D2.C230215@darkwater.ch>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 2002-04-24 at 05:28, Thomas Preisig wrote:
> Hi
> 
> I use a DiskOnChip 2000 and an Allwell Settopbox. I compiled the 2.4.18
> Linuxkernel with the MTD drivers.
> Mounting the DOC into the /mnt directory is no problem but now I've
> tried to install lilo on the DOC. I used a patched lilo version 21 from
> M-System. If I run lilo I get the message: Sorry don't know how to
> handle device 0x5d01.

use grub from CVS, works great. I have fsys_cramfs if anyone is
interested, I sent it to the grub people a while back, but haven't got
any replies
