Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjUCe-0006uW-R6
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2013 12:49:37 +0000
Received: by mail-ie0-f180.google.com with SMTP id b11so10442527iee.11
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jun 2013 05:49:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKGbVbux-d6xfmSahryTwDokRT0SaZUqgD3oHUQ8rP+tMyy1_A@mail.gmail.com>
References: <CAKGbVbtp4FBauCFNGSPTQSk_Dz4ELa7Gn31UByTMaFSk_vF1eg@mail.gmail.com>
 <CACQ1gAis_qrt_7RTROw-Hbueiy0XKYwtyR56w2DkajVKvwwwHA@mail.gmail.com>
 <CAKGbVbux-d6xfmSahryTwDokRT0SaZUqgD3oHUQ8rP+tMyy1_A@mail.gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 3 Jun 2013 14:48:55 +0200
Message-ID: <CACQ1gAhN=svvZMnq7xySgZvcmVk=pvrFNFsxY_ghxkQz-E3rAQ@mail.gmail.com>
Subject: Re: UBI torture_peb() bad block detection problem
To: Qiang Yu <yuq825@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
 Ivan Djelic <ivan.djelic@parrot.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/5/31 Qiang Yu <yuq825@gmail.com>:
> Here is my driver, and it can now be used with UBI+UBIFS.
> https://github.com/yuq/sunxi-nfc-mtd

I had a look at your driver, it seems that you forgot to set ecc.strenght.
take a look at this driver for instance: drivers/mtd/nand/jz4740_nand.c
the chip->ecc.strength is set to the max correctable bitflips.
The ecc.correct function returns the actual number of bitflips that
happened during reading.
And as Artem said, the mtd layer returns an error only if ret_code >=
mtd->bitflip_threshold ? -EUCLEAN : 0;
(and bitflip_threshold is == ecc.strenght in nand)

Richard.
