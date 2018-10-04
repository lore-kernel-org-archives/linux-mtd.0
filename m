Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7yt4-0006sZ-SU
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2018 08:21:37 +0000
Received: by mail-it1-x144.google.com with SMTP id h6-v6so1288478ith.0
 for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2018 01:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20181002124329.21248-1-linus.walleij@linaro.org>
 <05fdbe23-ec01-895f-e67e-abff85c1ece2@kernel.dk>
 <B5321A64-8A1A-42FF-A337-F4524BDA179B@linaro.org>
 <1538550325.14984.108.camel@gmail.com>
 <CACRpkdaLZXGKMQGJPH02p2QPkxUDA03Y=cu_wBR_+rFaLWTw7g@mail.gmail.com>
 <BN3PR0401MB164003C967C45F2681F503A7E7E90@BN3PR0401MB1640.namprd04.prod.outlook.com>
 <CACRpkdbHiq9bstRzyg-fJfXKnXr8wD1YzAooLAwQKM0OzP=HVA@mail.gmail.com>
 <1E24731C-13E1-41CC-A96A-ABDAA6175849@linaro.org>
 <CAHhmqcRbz+UsgDsHzJzKDWqZ_JMNp1UYq3M2rAf1vqfmO+wRyg@mail.gmail.com>
In-Reply-To: <CAHhmqcRbz+UsgDsHzJzKDWqZ_JMNp1UYq3M2rAf1vqfmO+wRyg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Oct 2018 10:21:11 +0200
Message-ID: <CACRpkdbHD4fNq0jz_JBuake7piJwRJmiK_JtsMXkiWVWxnis8A@mail.gmail.com>
Subject: Re: [PATCH] block: BFQ default for single queue devices
To: bgurney@redhat.com
Cc: Paolo Valente <paolo.valente@linaro.org>, Damien.LeMoal@wdc.com,
 Artem Bityutskiy <dedekind1@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-block <linux-block@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
 Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>,
 Adrian Hunter <adrian.hunter@intel.com>, Jan Kara <jack@suse.cz>,
 aherrmann@suse.com,
 mgorman@suse.com, Chunyan Zhang <zhang.chunyan@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 bfq-iosched@googlegroups.com,
 oleksandr@natalenko.name, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 3, 2018 at 7:34 PM Bryan Gurney <bgurney@redhat.com> wrote:

> Right now, users of host-managed SMR drives should be using "deadline"
> or "mq-deadline", to avoid out-of-order writes in sequential-only
> zones.
>
> I'm running into a situation right now on a test system (Fedora 28,
> 4.18.7 kernel) where I copied test data onto an F2FS filesystem, but I
> accidentally forgot to add my "udev rule" file:

This should be fixed after
d5038a13eca7 scsi: core: switch to scsi-mq by default
right?

Since mq use mq-deadline by default.

I'm making sure to preserve mq-deadline on zoned devices
in my v2 of this patch.

Yours,
Linus Walleij
