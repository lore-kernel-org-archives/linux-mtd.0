Received: from mail-yw0-x235.google.com ([2607:f8b0:4002:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b89wL-00052B-9s
 for linux-mtd@lists.infradead.org; Wed, 01 Jun 2016 17:28:21 +0000
Received: by mail-yw0-x235.google.com with SMTP id o16so25206975ywd.2
 for <linux-mtd@lists.infradead.org>; Wed, 01 Jun 2016 10:28:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160601192223.02861d9e@bbrezillon>
References: <1461961285-24159-1-git-send-email-kdasu.kdev@gmail.com>
 <20160530104213.79ff4a28@bbrezillon>
 <CAKekbesoPajRAE1d=df1bWM=YF2MmMnC8-UHEmEkYuV1y+PFhg@mail.gmail.com>
 <20160601171440.GA30704@google.com> <20160601192223.02861d9e@bbrezillon>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Wed, 1 Jun 2016 13:27:20 -0400
Message-ID: <CAKekbeuTZ8X-_=xb1D_bynjGJ3mdPdsE6m9Pn5BvKBcSmdOmxg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: brcmnand: Add check for erased page bitflips
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-mtd@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

>> I'm quite sure you can't make use of NAND_ECC_GENERIC_ERASED_CHECK
>> unless you do a substantial rewrite; brcmnand doesn't use any of the
>> nand_base ecc.read_{page,subpage} callbacks.
>>
>> > If that works as expected I will get rid of this duplication and send
>> > a revised change which shall make use of the
>> > NAND_ECC_GENERIC_ERASED_CHECK option.
>>
>> I suspect he was just suggesting calling the
>> nand_check_erased_ecc_chunk() helper instead of doing your own
>> bitmap_weight() calls.
>
> Exactly.
>
>

Ok got it. Yes I did realize that using the option is not straight
forward as far as brcmnand driver is concerned.

Thanks
Kamal
