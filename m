Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9Q9e-0002Ca-QX
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2018 07:40:40 +0000
Received: by mail-lj1-x241.google.com with SMTP id z21-v6so16914299ljz.0
 for <linux-mtd@lists.infradead.org>; Mon, 08 Oct 2018 00:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20181004142942.11887-1-ricardo.ribalda@gmail.com>
 <20181004142942.11887-2-ricardo.ribalda@gmail.com>
 <20181005002125.12fd229f@bbrezillon>
 <CAPybu_26HST5xGfhE6MoVTRZok_gfDqN=ZOAesuEMVskdrCpLA@mail.gmail.com>
 <20181005090811.6b7e9957@bbrezillon>
 <CAPybu_38xH2Cv+eONQmEJ1i6k=oiQM=WrcwOFR29LbtRvWfKXA@mail.gmail.com>
 <20181005103730.57d52e3c@bbrezillon>
 <CAPybu_1RMcro3xLNW5mbybYdObCTq=QwXgk+RT6hcmRGTh6s7A@mail.gmail.com>
 <20181005121235.7e64b64a@bbrezillon>
 <CAPybu_0TbeN+-F6zwN8XOMuY1EpgE6GRi=ExDx6O3Yun9kXjYQ@mail.gmail.com>
 <20181005141057.0f1b0a9b@bbrezillon>
 <CAPybu_0OZR==4k5nxVRZ-1NjPEXLQsun7QhnYds8dPndreUjcQ@mail.gmail.com>
 <20181005165234.468d2397@bbrezillon>
 <CAPybu_1cd9aJN9mC9m36Gd_fhU5UnfLH9EtU0h8BvJCZchOV_A@mail.gmail.com>
 <20181005182931.172b8f1c@bbrezillon>
 <CAPybu_01Bn5qmv91Pc-DExCAMheJyGYxiSvmGDUGiSxBA+S0DQ@mail.gmail.com>
 <20181005213203.247c369f@bbrezillon>
In-Reply-To: <20181005213203.247c369f@bbrezillon>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 8 Oct 2018 09:40:09 +0200
Message-ID: <CAPybu_3PS_19mGqHfdrD3oSRbUreBj1ABddMFdt5zOHmSg7=_g@mail.gmail.com>
Subject: Re: [PATCH v10 10/10] mtd: maps: gpio-addr-flash: Add support for
 device-tree devices
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris
On Fri, Oct 5, 2018 at 9:32 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> On Fri, 5 Oct 2018 20:12:43 +0200
> Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com> wrote:
>
> >
> > I think I know what might be the issue. on cfi_cmdset_002.c
> > cfi_amdstd_reset can be called in parrallel to cfi_amdstd_destroy.
> >
> > maybe we should call
> > unregister_reboot_notifier(&mtd->reboot_notifier);
> > before
> > cfi_amdstd_reset(mtd)
> >
> > need to try that on real hw with some strategical printfs :P. But that
> > will ahve to wait til Monday
>
> No problem, nothing urgent here. Have a nice weekend.

Just updated my kernel version (4.14.53 ->  4.14.69) with you last
github and I do not see the crash anymore. So I guess we are good to
go.

Thanks!


-- 
Ricardo Ribalda
