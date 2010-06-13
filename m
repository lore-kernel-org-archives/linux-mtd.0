Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ONj3K-0007yK-1d
	for linux-mtd@lists.infradead.org; Sun, 13 Jun 2010 09:00:27 +0000
Subject: Re: Mtd_debug patch
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stephen Beaver <beavers@anx.com>
In-Reply-To: <C825AD54.2A59A%beavers@anx.com>
References: <C825AD54.2A59A%beavers@anx.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 13 Jun 2010 11:57:49 +0300
Message-ID: <1276419469.19028.176.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stephen,

On Fri, 2010-05-28 at 17:26 -0400, Stephen Beaver wrote:
> The attached patch to the current version of mtd_debug (grabbed
> on5/28/2010) adds two new capabilities:
> 
> usage: mtd_debug info   <device>
>        mtd_debug read   <device> <offset> <len> <dest-filename>
>        mtd_debug write  <device> <offset> <len> <source-filename>
>       mtd_debug verify <device> <offset> <cmp-filename>
>       mtd_debug erase  <device> <offset> <len>
>       mtd_debug blank  <device> <offset> <len>
> 
> mtd_debug blank ... checks that an area of flash memory if blank (all
> 0xFFs) ie it verifies that an erase succeeded.
> mtd_debug verify ... checks that the contents of the flash memory
> match the specified file. Ie it verifies that a write succeeded.
> 
> These functions allow things like:
> 
> #!/bin/sh
> 
> mtd_debug erase /dev/mtd1 0 0x200000
> mtd_debug write /dev/mtd1 0 0x150000 uImage
> if ( mtd_debug verifiy /dev/mtd1 0 uImage ) ; then
>    reboot
> else
>    # Better try again, or we will die
> fi

Looks like a useful feature, but I cannot apply your patch because it is
not applicable to the latest mtd-utils.git. Also, your patch has many
trailing white-spaces. Could you please re-send it in inlined form - it
will make it easier to review it and reply to you (it it difficult to
comment attached patches).

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
