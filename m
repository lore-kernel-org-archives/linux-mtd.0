Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsHmz-0002ez-Ld
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 17:46:42 +0000
Received: by wera10 with SMTP id a10so316009wer.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 09:46:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAGiDA6Jw52CGM6KT5EANaGb8xxQQEH0Lf5ms24NGZLeMtqgjGA@mail.gmail.com>
References: <1327997163-9354-1-git-send-email-computersforpeace@gmail.com>
 <CAGiDA6Jw52CGM6KT5EANaGb8xxQQEH0Lf5ms24NGZLeMtqgjGA@mail.gmail.com>
Date: Tue, 31 Jan 2012 09:46:40 -0800
Message-ID: <CAN8TOE-Yt445aXE_sA9xo8ycV4EQB=5OtwL6yyfPBGusYd93CA@mail.gmail.com>
Subject: Re: [RFC/PATCH] mtd: m25p80: set writebufsize
From: Brian Norris <computersforpeace@gmail.com>
To: "Shawn J. Goff" <shawn7400@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
 agust@denx.de, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 31, 2012 at 6:08 AM, Shawn J. Goff <shawn7400@gmail.com> wrote:
> Yes, I ran into this problem myself and fixed it in a similar way.

I'm wondering now: how do we guarantee that we're picking the
*correct* writebufsize and not just one that *works*? It's only used
by UBI, I think, so it depends on UBI's needs.

> Even after adding this fix, it turned out that I still couldn't boot
> from a UBI volume because SPI comes up after UBI, so the UBI tries to
> attach, but there is no MTD device to attach to.

Well, the boot order problem is a different issue :)

Brian
