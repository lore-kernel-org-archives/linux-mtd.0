Received: from wa-out-1112.google.com ([209.85.146.176])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JFtPp-0005h5-QW
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 15:46:04 +0000
Received: by wa-out-1112.google.com with SMTP id v33so1736139wah.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Jan 2008 07:45:55 -0800 (PST)
Message-ID: <8bf247760801180745k6f8337d5p751d91b21bd3728d@mail.gmail.com>
Date: Fri, 18 Jan 2008 21:15:54 +0530
From: Ram <vshrirama@gmail.com>
To: llandre <r&d2@dave-tech.it>
Subject: Re: Micron NAND support in linux MTD
In-Reply-To: <47907CDF.30802@dave-tech.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <47907CDF.30802@dave-tech.it>
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
   The location of the "bad block indicator" within the spare area
depends on the
    manufacturer. It could vary from chip to chip.

   it could also depend on the page size as well.

   Usually, for a large page size nand, It could be located at the
first byte of the OOB.
   For a small it could be at 6th byte.

  The way you send some commands to the large page size nand device is
somewhat different
  from the small page size nand device. I think you may not be using
the driver for a large page  nand device.

  Most of the stuff (driver) for the large page nand devices is
generic. The way you wait for nand busy changes.

  Check the way your reading the flash information from the chip id
and additional infomation.
  The way youre mtd_info structure is getting initialised. You could
be missing something here.

Hope this helps.

Regards,
sriram




On Jan 18, 2008 3:48 PM, llandre <r&d2@dave-tech.it> wrote:
> Hi,
>
> I found on MTD mailing list your patch that adds Micron manufacturer ID:
> http://article.gmane.org/gmane.linux.drivers.mtd/17694
>
> I'm going to use NAND Micron devices for a new project however I still
> have a doubt about how MTD/JFFS2 handle bad blocks. To detect blocks
> marked as bad it checks the 6th location of OOB area of first page, thus
> it seems it is not able to handle Micron devices properly. In fact these
> devices stores bad block marker in the first location of OOB of first or
> second page (for example see page 50 of MT29F1GxxABB data sheet). Am I
> misreading the datasheet? Could you help me to clear this point?
>
>
> Thanks in advance,
> llandre
>
> DAVE Electronics System House - R&D Department
> web:   http://www.dave-tech.it
> email: r&d2@dave-tech.it
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
