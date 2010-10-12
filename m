Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5anr-0004JR-Fb
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 09:05:48 +0000
Received: by ewy7 with SMTP id 7so786997ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 02:05:46 -0700 (PDT)
Subject: Re: [RFC] mtd: add MEMSETGOODBLOCK ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Povey <jon.povey@racelogic.co.uk>
In-Reply-To: <1286335318-17542-1-git-send-email-jon.povey@racelogic.co.uk>
References: <1286335318-17542-1-git-send-email-jon.povey@racelogic.co.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Oct 2010 12:02:57 +0300
Message-ID: <1286874177.2164.14.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org,
	Brian Norris <norris@broadcom.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-10-06 at 12:21 +0900, Jon Povey wrote:
> Adds the MEMSETGOODBLOCK ioctl, inverse operation of MEMSETBADBLOCK for
> times when you really are sure that a block is good, but was marked bad
> in error.
> 
> WARNING: This ioctl should not be casually used, you can't magically
> fix unreliable blocks, and causing the system to try and use them may
> cause you problems. Manufacturer-marked bad blocks may be forgotten
> and impossible to find again later. Be careful.
> 
> This ioctl is for situations where you know what you are doing, for
> example your bootloader has to be written with a different OOB layout
> and scanned as bad when the BBT was generated, but you know it's good
> and want to rewrite it from Linux.
> 
> Signed-off-by: Jon Povey <jon.povey@racelogic.co.uk>
> ---
> This is a request for comment on this approach to bad blocks, this patch
> only considers the nand driver and only versions with a BBT on flash.
> 
> This works for me on davinci DM355 with 2K page NAND flash.
> 
>  drivers/mtd/mtdchar.c        |   13 +++++++++
>  drivers/mtd/mtdpart.c        |   18 ++++++++++++
>  drivers/mtd/nand/nand_base.c |   60 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/mtd.h      |    1 +
>  include/linux/mtd/nand.h     |    2 +
>  include/mtd/mtd-abi.h        |    1 +
>  6 files changed, 95 insertions(+), 0 deletions(-)

Briefly looked - you do not have any locking. You should have some
nand_get_device() calls.

Also, did you investigate whether it is possible to distinguish between
factory-marked bad eraseblocks and user-marked bad eraseblocks?

Also, if this patch to go in, I'd really like to see some Reviewed-by
and Tested by. Or some good list of setups where you tested this
yourself and how you did this. Is this possible?

Let's CC Mike who was interested in this and Brian who was doing great
job in the BBT area recently and could review this patch.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
