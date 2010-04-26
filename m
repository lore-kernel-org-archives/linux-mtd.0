Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6GU4-00021Z-Mf
	for linux-mtd@lists.infradead.org; Mon, 26 Apr 2010 05:03:53 +0000
Subject: Re: [PATCH] mtd/ubi: recognize empty flash with errors as empty
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20100425210938.GA15192@Chamillionaire.breakpoint.cc>
References: <20100423172819.GA29224@Chamillionaire.breakpoint.cc>
	<1272108241.11751.1635.camel@localhost.localdomain>
	<20100425210938.GA15192@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Apr 2010 07:59:50 +0300
Message-ID: <1272257990.17386.2.camel@localhost>
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

On Sun, 2010-04-25 at 23:09 +0200, Sebastian Andrzej Siewior wrote:
> * Artem Bityutskiy | 2010-04-24 14:24:01 [+0300]:
> 
> >Thanks, pushed to ubi-2.6.git / master with the following minor tweak,
> >please check:
> >
> >diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
> >index 7529d46..48e570c 100644
> >--- a/drivers/mtd/ubi/scan.c
> >+++ b/drivers/mtd/ubi/scan.c
> >@@ -756,12 +756,12 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
> >                bitflips = 1;
> >        }
> > 
> >-       if (err != UBI_IO_BAD_EC_HDR)
> >-               si->is_empty = 0;
> >-
> >        if (!ec_corr) {
> >                int image_seq;
> > 
> >+               /* There is an EC header, so the flash is not empty */
> >+               si->is_empty = 0;
> >+
> >                /* Make sure UBI version is OK */
> >                if (ech->version != UBI_VERSION) {
> >                        ubi_err("this UBI version is %d, image version is %d",
> >
> 
> I guess that's okay. What are the chances that you can't read the EC
> header but you can somehow read the VID header. 

When the VID header sits in the next NAND page, there are some changes,
but I never observed such a situation in practice.

> AND if there is a valid
> VID header then there is more, and si->is_empty will be set later on,
> right?

Yes, AFAICS.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
