Received: from ug-out-1314.google.com ([66.249.92.169])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FuufG-0001Zy-Jn
	for linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 13:14:35 -0400
Received: by ug-out-1314.google.com with SMTP id q2so1492232uge
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Jun 2006 10:14:19 -0700 (PDT)
Message-ID: <625fc13d0606261008y1852d970v9d192ae897ac1d0a@mail.gmail.com>
Date: Mon, 26 Jun 2006 12:08:04 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Steve Finney" <saf76@earthlink.net>
Subject: Re: Cannot erase nand flash
In-Reply-To: <26260868.1151341349996.JavaMail.root@elwamui-sweet.atl.sa.earthlink.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <26260868.1151341349996.JavaMail.root@elwamui-sweet.atl.sa.earthlink.net>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/26/06, Steve Finney <saf76@earthlink.net> wrote:
>
> >Date: Mon, 26 Jun 2006 10:52:43 +0200
> >From: peter.hosten@rwth-aachen.de
>
> > Unfortunately the mtd-util
> >(flash_eraseall, mtd_debug) is not able to erase the NAND-Flash. I get the
> >error  "./flash_eraseall: /dev/mtd3: MTD Erase failure: Input/output error"
> >(see below)
>
> >I also dumped the NAND Flash ( see below); may it be possible that it does
> >not work because of the OBB data ( OOB Data: 00 00 00 00 00 00 00 00 00 00
> >00 00 00 00 00 00) ?
>
> I have seen that error with some versions of mtd-utils when the partition contains a
> bad block, and your dumped OOB would be interpreted as a bad block
> (no 0xFF in byte 5). But, in fact, the flash may have been successfully erased, and Linux
> works reasonably well with bad blocks, so you may be able to just ignore
> the "error".

The tool could be made to check each block to see if it's bad first
before erasing.  Then it would print a nice informative:

Block %d is bad, skipping

instead of the misleading error you get now.

josh
