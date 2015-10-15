Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zmd8J-0002yP-4H
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 07:39:27 +0000
Received: by oies66 with SMTP id s66so1892548oie.1
 for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2015 00:39:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+EcR22oTADfz0Mo=E45_QEKK0Y47PAc2X15Hp-aEj+XC7v3gQ@mail.gmail.com>
References: <loom.20150918T183854-37@post.gmane.org>
 <CAFLxGvwJjy=6GLXJm=2frruO9vKqqPG_6yYxSH7HLLr47x9apg@mail.gmail.com>
 <CA+-FG628WkbiqnzT9tp4Li=SP2qHPM+Nn+KLHjQWqHN-f==+vg@mail.gmail.com>
 <55FC6BCB.1030901@nod.at>
 <CA+-FG62MN2FBLKecGJJ6YHqPDyrgrx8BkCAZGezoKbADOCm_0g@mail.gmail.com>
 <55FC6F56.4050107@nod.at>
 <CA+-FG62nCCaK_GEGSqBJ4ROvqgVPZdsh7pyEsnq2C0AXZrnkjw@mail.gmail.com>
 <55FC8712.5040905@nod.at>
 <CA+EcR23BLTvQgD36bAAiT3yULYSpE0zMiXpRm0kDGQeLOTho8w@mail.gmail.com>
 <56058D7B.3050005@nod.at>
 <CA+EcR22DEGWr8v-iMDQBf=NNL3+6SsOBDX6mX5y_O9en4FaPyQ@mail.gmail.com>
 <CA+-FG62yDf2hbEgo6At92pwPOWbXjTSwQ-WrJjX2z2z-VBYZ=Q@mail.gmail.com>
 <CA+-FG61mEsrOu_WGUuCm-xgKM4afxSrw2JyQUwCi8BPJU3gkQQ@mail.gmail.com>
 <561ED48D.5010002@nod.at>
 <CA+EcR22oTADfz0Mo=E45_QEKK0Y47PAc2X15Hp-aEj+XC7v3gQ@mail.gmail.com>
Date: Thu, 15 Oct 2015 09:39:05 +0200
Message-ID: <CAFLxGvxJ0QuSuTfNZc2fDhJMd5u=LpmRKLg9KydNp2gLZ-t4AQ@mail.gmail.com>
Subject: Re: UBIFS corruptions on NOR-Flash
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Han Xu <xhnjupt@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Roshni Shah <roshni.shah@timesys.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 15, 2015 at 4:20 AM, Han Xu <xhnjupt@gmail.com> wrote:
> I didn't test UBI on our board since we mount 4M SPI-NOR on board
> which is not large enough to test UBI.

So, the driver is completely untested wrt. UBI.
Maybe UBI uncovers an issue. Wouldn't be
the first time...

-- 
Thanks,
//richard
