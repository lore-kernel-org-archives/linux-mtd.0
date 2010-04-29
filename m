Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O7QLJ-0004nY-1L
	for linux-mtd@lists.infradead.org; Thu, 29 Apr 2010 09:47:37 +0000
Subject: Re: [PATCH] mtd/ubi: recognize empty flash with errors as empty
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20100426082855.GA18811@Chamillionaire.breakpoint.cc>
References: <20100423172819.GA29224@Chamillionaire.breakpoint.cc>
	<1272108241.11751.1635.camel@localhost.localdomain>
	<20100425210938.GA15192@Chamillionaire.breakpoint.cc>
	<1272257990.17386.2.camel@localhost>
	<20100426082855.GA18811@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 29 Apr 2010 12:42:29 +0300
Message-ID: <1272534149.7750.85.camel@localhost>
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

On Mon, 2010-04-26 at 10:28 +0200, Sebastian Andrzej Siewior wrote:
> * Artem Bityutskiy | 2010-04-26 07:59:50 [+0300]:
> 
> >On Sun, 2010-04-25 at 23:09 +0200, Sebastian Andrzej Siewior wrote:
> >> * Artem Bityutskiy | 2010-04-24 14:24:01 [+0300]:
> >> 
> >> >Thanks, pushed to ubi-2.6.git / master with the following minor tweak,
> >> >please check:
> >> >
> >> >diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
> >> >index 7529d46..48e570c 100644
> >> >--- a/drivers/mtd/ubi/scan.c
> >> >+++ b/drivers/mtd/ubi/scan.c
> >> >@@ -756,12 +756,12 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
> >> >                bitflips = 1;
> >> >        }
> >> > 
> >> >-       if (err != UBI_IO_BAD_EC_HDR)
> >> >-               si->is_empty = 0;
> >> >-
> >> >        if (!ec_corr) {
> >> >                int image_seq;
> >> > 
> >> >+               /* There is an EC header, so the flash is not empty */
> >> >+               si->is_empty = 0;
> >> >+
> >> >                /* Make sure UBI version is OK */
> >> >                if (ech->version != UBI_VERSION) {
> >> >                        ubi_err("this UBI version is %d, image version is %d",
> >> >
> >> 
> >> I guess that's okay. What are the chances that you can't read the EC
> >> header but you can somehow read the VID header. 
> >
> >When the VID header sits in the next NAND page, there are some changes,
> >but I never observed such a situation in practice.
> >
> >> AND if there is a valid
> >> VID header then there is more, and si->is_empty will be set later on,
> >> right?
> >
> >Yes, AFAICS.
> 
> Oh. UBI_IO_BAD_EC_HDR / UBI_IO_BAD_VID_HDR is returned when
> - the page page can not be read
> - the page contains non-ubi information

Bear in mind that it is difficult to distinguish between non-UBI
information and just very corrupted headers, so ATM, in case of CRC
error, UBI assumes this is a corrupted header, although this could
non-UBI stuff.

> So I think the latter case is now broken. In fact I just copied some
> random things into my mtd partition and after attach & mkvol they were
> gone with no error.

You mean UBI just attached your device? What would you expect it to do
when it sees that part of eraseblocks contain corrupted headers? ATM, it
just formats those eraseblocks. What would be your expectation?

> So in case we want to support something other than UBI then we should
> probably add another error code in order to distinguish between read
> error and not a vald EC / VID header.

If you feed UBI flash with no valid UBI headers, it will be refused, I
think.

I actually do not really see what is the use-case or scenario you want
UBI to handle better.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
