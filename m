Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDQEV-0003vh-3u
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 08:36:11 +0000
Received: by mail-lf1-x144.google.com with SMTP id x24-v6so8870085lfe.5
 for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2018 01:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20181015141059.26579-1-linus.walleij@linaro.org>
 <18744e21b9f5aa4b3ab721a007a3e9a2@natalenko.name>
In-Reply-To: <18744e21b9f5aa4b3ab721a007a3e9a2@natalenko.name>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 19 Oct 2018 10:33:47 +0200
Message-ID: <CACRpkdZgethKLu3P4taLfzqjGULyoP-T7bhUUpRKtjDRteNnxA@mail.gmail.com>
Subject: Re: [PATCH v2] block: BFQ default for single queue devices
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: linux-block <linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
 linux-mmc <linux-mmc@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Pavel Machek <pavel@ucw.cz>, Paolo Valente <paolo.valente@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>,
 Adrian Hunter <adrian.hunter@intel.com>, Bart Van Assche <bvanassche@acm.org>,
 Jan Kara <jack@suse.cz>,
 Artem Bityutskiy <dedekind1@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, Johannes Thumshirn <jthumshirn@suse.de>,
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

On Mon, Oct 15, 2018 at 4:32 PM Oleksandr Natalenko
<oleksandr@natalenko.name> wrote:
> On 15.10.2018 16:10, Linus Walleij wrote:

> > +     /*
> > +      * Zoned devices must use a deadline scheduler because currently
> > +      * that is the only scheduler respecting zoned writes.
> > +      */
> > +     if (blk_queue_is_zoned(q))
> > +             policy = "mq-deadline";
> > +     else if (IS_ENABLED(CONFIG_IOSCHED_BFQ))
> > +             policy = "bfq";
> > +     else
> > +             policy = "mq-deadline";
>
> If more rules will be needed in the future, shall we just add extra ifs,
> or it would be better to craft some struct/table now + policy search
> helper?

Let's do it when it happens. Premature optimization is the root
of all evil ;)

Yours,
Linus Walleij
