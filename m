Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nIJc-0006iR-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 13:34:24 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Henrik Nordstrom <hno@marasystems.com>
To: mateo@posta.star.si, mark@lakeshoremicro.com, dwmw2@infradead.org
Subject: Re: DOC 2000 and GRUB
Date: Fri, 6 Sep 2002 14:34:17 +0200
Cc: Russ.Dill@asu.edu, linux-mtd@lists.infradead.org
References: <20020906112553.896FB394E@sitemail.everyone.net>
In-Reply-To: <20020906112553.896FB394E@sitemail.everyone.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200209061434.17881.hno@marasystems.com>
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

Mateo Anderson wrote:

> Steps:
> 1) Boot DOS and use DFORMAT 5.x to format the DOC, with
>    the appropriate space for the GRUB firmware (check the
>    size of the stage1 file).

DFORMAT 5.x automatically allocates the needed space. You only need to care 
about space if you want to reserve additional space in the binary boot flash 
partition to allow for upgrades to a bigger GRUB firmware in the future.

> 2) Boot to Linux, use the doc_loadbios to load the GRUB
>    firmware (or use DFORMAT - what parameters??).

Use DFORMAT. doc_loadbios is for "advanced users" who have read the 
documentation shipped with the M-Sys 5.X tools and knows the current 
limitations of the doc_loadbios command and it's bad interactions with the 
nftl Linux driver..

Note: DFORMAT can also be used to upgrade the boot firmware without destroying 
the NFTL disk flash partition, provided the new boot firmware fits in the 
reserved binary flash partition that is..

> 3) Format the /dev/nftla.

This would be

3) Partition /dev/nftla using Linux fdisk.

The NFTL is already formatted by DFORMAT, and a single DOS partition covering 
the whole flash have been created and formatted.

> 4) Copy everything to the /dev/nftla1.
> 5) Boot from DOC.
>
> Is this correct?

More or less.

Regards
Henrik
