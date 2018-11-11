Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLo3x-0002Fz-Ge
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 11:37:58 +0000
Received: by mail-lf1-x141.google.com with SMTP id z13so4239903lfe.11
 for <linux-mtd@lists.infradead.org>; Sun, 11 Nov 2018 03:37:47 -0800 (PST)
MIME-Version: 1.0
References: <20181110211413.15707-1-linus.walleij@linaro.org>
 <20181111081632.56f1b2fe@bbrezillon>
In-Reply-To: <20181111081632.56f1b2fe@bbrezillon>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 11 Nov 2018 12:37:33 +0100
Message-ID: <CACRpkdbkXe9KTXKxW+XZf2ckt1VdqSMRGOyRrWbEgpK9pKYAGg@mail.gmail.com>
Subject: Re: [PATCH 3/3 v3] mtd: partitions: Add OF support to RedBoot
 partitions
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Mark Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 11, 2018 at 8:16 AM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> > ChangeLog v2->v3:
> > - Fix copy/paste bug identified by the build robot.
> > ChangeLog v1->v2:
> > - Rebased on linux-mtd-next for v4.21
>
> Looks like the comments I made on v1 have not been taken into account,
> or replied to.

Sorry, my bad :(

> Those are all minor things I can fix when applying the patch. Let me
> know if you're okay with the changes I suggest, and I'll take care of
> that.

Of course you can do that, I have full confidence in you Boris!
Please go ahead.

Yours,
Linus Walleij
