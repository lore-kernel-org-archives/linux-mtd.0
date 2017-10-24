Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6tKM-00056P-Ll
 for linux-mtd@lists.infradead.org; Tue, 24 Oct 2017 07:08:44 +0000
Received: by mail-wm0-x244.google.com with SMTP id r196so1106014wmf.2
 for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2017 00:08:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171023121240.GE29656@lahna.fi.intel.com>
References: <1503648771-17514-1-git-send-email-bmeng.cn@gmail.com>
 <3af38787-4542-7a2b-36be-56c11b1b81f2@wedev4u.fr>
 <CAK8P3a3kdJiug1MaUaTzQxqayGuEGQvox-RX+NOtw0EFO7nkag@mail.gmail.com>
 <CAEUhbmXmw9uGwnAQBd2bRYvGfmCAyJFAswp33Y5LvJREB7pjmA@mail.gmail.com>
 <20171023121240.GE29656@lahna.fi.intel.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 24 Oct 2017 15:08:20 +0800
Message-ID: <CAEUhbmXfN1VG8n=z4Ck-UCFqG8oT2ffaxb410v+j6OiibV2_ag@mail.gmail.com>
Subject: Re: [PATCH] spi-nor: intel-spi: Fix Kconfig dependency to LPC_ICH
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mika,

On Mon, Oct 23, 2017 at 8:12 PM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Sun, Oct 15, 2017 at 09:38:57PM +0800, Bin Meng wrote:
>> > Also, the 'depends on EXPERT' statement looks misplaced,
>> > enabling EXPERT should only be there to allow you to turn
>> > extra things *off*, not to hide device drivers.
>> >
>>
>> I will leave this to Mika to comment the "EXPERT" usage. If we remove
>> this, I think that should be another patch and the documentation of
>> this driver should be updated too.
>
> Yeah, I guess we can remove that EXPERT dependency. It was added there
> exactly because I did not want ordinary users playing with the device
> and inadvertently overwrite their BIOSes (if it is not protected). I
> also agree it should be a separate patch. Do you want to do that or
> should I?

Thanks. I can prepare a patch to remove EXPERT.

Regards,
Bin
