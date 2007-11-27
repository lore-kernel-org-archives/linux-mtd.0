Received: from rn-out-0910.google.com ([64.233.170.184]
	helo=rn-out-0102.google.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Iwyva-0000mF-Sv
	for linux-mtd@lists.infradead.org; Tue, 27 Nov 2007 11:48:40 +0000
Received: by rn-out-0102.google.com with SMTP id e25so566245rng
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Nov 2007 03:48:33 -0800 (PST)
Message-ID: <9c9fda240711270348q7798ddd5jfb7bf763b3497500@mail.gmail.com>
Date: Tue, 27 Nov 2007 20:48:33 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [RFC][PATCH][JFFS2] JFFS2 support for NOP 1
In-Reply-To: <20071127095518.GA29456@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20071127073616.GA22556@party>
	<20071127095518.GA29456@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
> > index f71dac4..80334d7 100644
> > --- a/include/mtd/mtd-abi.h
> > +++ b/include/mtd/mtd-abi.h
> > @@ -30,12 +30,14 @@ struct mtd_oob_buf {
> >  #define MTD_BIT_WRITEABLE    0x800   /* Single bits can be flipped */
> >  #define MTD_NO_ERASE         0x1000  /* No erase necessary */
> >  #define MTD_STUPID_LOCK              0x2000  /* Always locked after reset */
> > +#define MTD_MULTI_LEVEL_CHIP 0x4000  /* Multi Level Chip */
> >
> >  // Some common devices / combinations of capabilities
> >  #define MTD_CAP_ROM          0
> >  #define MTD_CAP_RAM          (MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
> >  #define MTD_CAP_NORFLASH     (MTD_WRITEABLE | MTD_BIT_WRITEABLE)
> >  #define MTD_CAP_NANDFLASH    (MTD_WRITEABLE)
> > +#define MTD_CAP_MLC_NANDFLASH        (MTD_WRITEABLE | MTD_MULTI_LEVEL_CHIP)
>
> NAK.  This does not describe the limitations of your chip, but a random
> name.  In fact, the limitations appear to be identical to
> (MTD_NORFLASH & !MTD_BIT_WRITEABLE).
>
> Maybe something like ALLOW_SEPERATE_OOB_WRITE with reversed logic?
>

However MTD_NORFLASH doesn't have the write buffer. It means it can be
write one more.
Maybe you only think the non-oob case. But MLC NAND should have the
write buffer for NOP 1 limitation.

In summary,
NOR: no oob, no problem to write bytes.
SLC NAND: has oob, NOP is allowed at least 2 and more.
MCL NAND:  has oob, but NOP is 1.

Thank you,
Kyungmin Park
