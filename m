Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Soy40-0003J3-7k
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2012 14:38:50 +0000
Received: by bkcji2 with SMTP id ji2so1077532bkc.36
 for <linux-mtd@lists.infradead.org>; Wed, 11 Jul 2012 07:38:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201207091013.29597.marex@denx.de>
References: <1341555027-17462-1-git-send-email-marex@denx.de>
 <1341555027-17462-3-git-send-email-marex@denx.de>
 <201207091013.29597.marex@denx.de>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 11 Jul 2012 16:38:21 +0200
Message-ID: <CAMjpGUc-vcmJx5+uwTndUHReGSxnxvg6y4Jtax1cBPdy8VEeEw@mail.gmail.com>
Subject: Re: [PATCH 3/3] [RFC] mtd: m25p80: Make fast read configurable via DT
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 9, 2012 at 10:13 AM, Marek Vasut <marex@denx.de> wrote:
> > Add DT property "m25p,fast-read" that signalises the particular
> > chip supports "fast read" opcode.
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> > Cc: David Woodhouse <david.woodhouse@intel.com>
> > ---
> >  drivers/mtd/devices/m25p80.c |   32 +++++++++++++++++++-------------
> >  1 file changed, 19 insertions(+), 13 deletions(-)
> >
> > NOTE: I'm not sure where to document this property, as m25p80 is
> >       a simple DT device. Any hints please?
> >
>    ^--- bump?

did you see Stefan's suggestion ?
-mike
