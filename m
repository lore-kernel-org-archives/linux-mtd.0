Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3yPO-0003qW-Ib
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2018 06:30:08 +0000
Received: by mail-it0-x242.google.com with SMTP id h143-v6so1514042ita.4
 for <linux-mtd@lists.infradead.org>; Wed, 04 Apr 2018 23:29:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180404215623.2bf07406@bbrezillon>
References: <20180402142656.26815-1-robert.jarzmik@free.fr>
 <CAPDyKFot9dAST2jQL5s8E4U=bCHxkio=uwpqPd6S0N4FWJRB-w@mail.gmail.com>
 <874lkq4urd.fsf@belgarion.home> <20180404215623.2bf07406@bbrezillon>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Apr 2018 08:29:53 +0200
Message-ID: <CAPDyKFoFz_HgYPOMGuOTpehrTR3DtWE3uZbcnVwUwVhDy02Mow@mail.gmail.com>
Subject: Re: [PATCH 00/15] ARM: pxa: switch to DMA slave maps
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tejun Heo <tj@kernel.org>,
 Vinod Koul <vinod.koul@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Nicolas Pitre <nico@fluxnic.net>, Samuel Ortiz <samuel@sortiz.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-ide@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, driverdevel <devel@driverdev.osuosl.org>,
 alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4 April 2018 at 21:56, Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> On Wed, 04 Apr 2018 21:49:26 +0200
> Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>
>> Ulf Hansson <ulf.hansson@linaro.org> writes:
>>
>> > On 2 April 2018 at 16:26, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>> >> Hi,
>> >>
>> >> This serie is aimed at removing the dmaengine slave compat use, and transfer
>> >> knowledge of the DMA requestors into architecture code.
>> >> As this looks like a patch bomb, each maintainer expressing for his tree either
>> >> an Ack or "I want to take through my tree" will be spared in the next iterations
>> >> of this serie.
>> >
>> > Perhaps an option is to send this hole series as PR for 3.17 rc1, that
>> > would removed some churns and make this faster/easier? Well, if you
>> > receive the needed acks of course.
>> For 3.17-rc1 it looks a bit optimistic with the review time ... If I have all
>
> Especially since 3.17-rc1 has been released more than 3 years ago :-),
> but I guess you meant 4.17-rc1.

Yeah, I realize that I was a bit lost in time yesterday. Even more
people have been having fun about it (me too). :-)

Kind regards
Uffe
