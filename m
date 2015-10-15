Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmY9c-0005gq-TX
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2015 02:20:29 +0000
Received: by vkha6 with SMTP id a6so41251042vkh.2
 for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2015 19:20:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <561ED48D.5010002@nod.at>
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
Date: Wed, 14 Oct 2015 21:20:07 -0500
Message-ID: <CA+EcR22oTADfz0Mo=E45_QEKK0Y47PAc2X15Hp-aEj+XC7v3gQ@mail.gmail.com>
Subject: Re: UBIFS corruptions on NOR-Flash
From: Han Xu <xhnjupt@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Roshni Shah <roshni.shah@timesys.com>,
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

I didn't test UBI on our board since we mount 4M SPI-NOR on board
which is not large enough to test UBI.

On Wed, Oct 14, 2015 at 5:17 PM, Richard Weinberger <richard@nod.at> wrote:
> Hi!
>
> Am 14.10.2015 um 16:33 schrieb Roshni Shah:
>> Hi Han, Richard,
>>
>> Any other ideas / tests that I could perform to help narrow down the
>> issue further? I really appreciate you taking the time.
>
> I don't have this hardware, so I cannot say much.
>
> Does the dump of the corrupted data make sense?
> IOW are only a few bits flipped or is it completely
> garbage?
>
> Han, have you ever tested this driver with UBI?
> As I said UBI uses vmalloc'ed buffers. Maybe the driver
> is "UBI unfriendly" and needs tamed.
>
> Thanks,
> //richard
