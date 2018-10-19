Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDVZa-0003lP-3E
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 14:16:24 +0000
Received: by mail-wm1-f67.google.com with SMTP id 185-v6so3878048wmt.2
 for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2018 07:16:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e7687ded-bf95-5b76-a56b-99dc27434b8c@suse.de>
References: <20181015141059.26579-1-linus.walleij@linaro.org>
 <d25e02de-e1be-0fb7-237b-3e53d56c6f64@kernel.dk>
 <307F6078-0A77-4AAA-BE1A-55C2ACC328CC@linaro.org>
 <ab70f1dd-6943-9642-aafa-71840fd44f07@kernel.dk>
 <689F28AA-92B5-48B5-BBE7-0B589F163228@linaro.org>
 <7375c004-ac6e-c692-4282-46de554285d5@kernel.dk>
 <20181017100526.GB23493@quack2.suse.cz>
 <d1d082f3-d681-02ed-5bbe-5eb011d6b0da@acm.org>
 <CAHhmqcSb45qePdKsidQcEk7bNeZC5h6Oew-qH=LA7dsQL_uhSg@mail.gmail.com>
 <CACRpkdZZ6RU0aJpUqRn1ndyob1_COhaEs6B9QVRWfa+a60n+Lg@mail.gmail.com>
 <CAHhmqcQinFN9ez5MTRquY0FPaYO2BmOKMn0avy84QPWLK1g2Gg@mail.gmail.com>
 <e7687ded-bf95-5b76-a56b-99dc27434b8c@suse.de>
From: Bryan Gurney <bgurney@redhat.com>
Date: Fri, 19 Oct 2018 10:16:05 -0400
Message-ID: <CAHhmqcRft76_FRaHdZrSvG_kvp8hYTehO73PHdoKg4RZB+Utkg@mail.gmail.com>
Subject: Re: [PATCH v2] block: BFQ default for single queue devices
To: Johannes Thumshirn <jthumshirn@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bart Van Assche <bvanassche@acm.org>,
 Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-block <linux-block@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
 Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>,
 Adrian Hunter <adrian.hunter@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>,
 Mark Brown <broonie@kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 19, 2018 at 9:44 AM, Johannes Thumshirn <jthumshirn@suse.de> wrote:
> On 19/10/18 15:36, Bryan Gurney wrote:
>> I like this idea.  I don't have enough experience to write this patch
>> myself, but I imagine something like adding "bool is_zoned_aware" to
>> "struct elevator_type", and setting that true only for the schedulers
>> that are currently zoned-device aware (which is currently deadline on
>> single queue, mq-deadline on blk-mq).
>
> I don't think this is needed currently as a) Jens is working on getting
> rid of the legacy path,

Once the legacy schedulers are gone, the default (prior to Linus'
proposed patch) will be mq-deadline, which is zoned-device-aware.  So
the default scheduler will be "safer" for zoned devices.

However, it will still be possible for users (or distro defaults) to
select a non-zoned-aware scheduler, such as "none", "kyber", or "bfq"
(prior to this patch).  So there would still be a window for users to
encounter the same problems I found when aborted commands start
occurring during otherwise normal filesystem or storage activity, by
drivers that are otherwise compliant with the handling characteristics
of zoned block devices.

> which leaves us with mq-deadline only and Linus'
> patch has:
>
> +       if (blk_queue_is_zoned(q))
> +               policy = "mq-deadline";
>
> Which chooses mq-deadline on a zoned device.
>
> So nothing to worry about here now.
>
> All this only given Linus' patch actually gets merged.

I hope it does get merged.  I keep forgetting to save my "zoned
devices use deadline" udev rule on my SMR drive test machine in
between reinstalls.


Thanks,

Bryan
