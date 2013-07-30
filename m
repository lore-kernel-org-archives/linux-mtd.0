Received: from mail-ve0-x22a.google.com ([2607:f8b0:400c:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4H20-0002by-MZ
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 21:00:33 +0000
Received: by mail-ve0-f170.google.com with SMTP id 15so2023928vea.1
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 14:00:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1375198006.14869.165.camel@sauron.fi.intel.com>
References: <CAN8TOE-y0HvZYWqwoPEZhReVVP_iY6t5p1N0ZMJXPQqwuK5ozQ@mail.gmail.com>
 <51E64B40.1030408@freescale.com>
 <CAF4G-tLsOO_F-Mhn=+5vS2kkJuoeLJwrTdCR90DVuQQ+xn40aw@mail.gmail.com>
 <CAN8TOE_osCKY86W2O5mLxSSahyiW2peFwDhCFuSQ+ewGHeXNKw@mail.gmail.com>
 <1374102799.21468.3.camel@shinybook.infradead.org>
 <CAN8TOE9CX7fcDRQzee=Xg5TYkYYOs3__vWzy3r0Ofg0aCsgxSg@mail.gmail.com>
 <1374109439.21468.67.camel@shinybook.infradead.org>
 <CAN8TOE_y=mDY4frFB9kmedhGnNhf4pQwqH1q+fAcDAE_RNwO+A@mail.gmail.com>
 <20130720122231.GB4410@gmail.com>
 <1375182248.14869.127.camel@sauron.fi.intel.com>
 <20130731015329.GA2133@gmail.com>
 <1375193034.14869.158.camel@sauron.fi.intel.com>
 <1375198006.14869.165.camel@sauron.fi.intel.com>
Date: Tue, 30 Jul 2013 14:00:11 -0700
Message-ID: <CAN8TOE-1-oizhmN+E3yoBupvAs3cRN=gvjruTb85hyQPApws6w@mail.gmail.com>
Subject: Re: No pull for mtd?
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <shijie8@gmail.com>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Andrew Morton <akpm@linux-foundation.org>, torvalds@linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 30, 2013 at 8:26 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2013-07-30 at 17:03 +0300, Artem Bityutskiy wrote:
>> I am fine with giving Brian Norris write rights to the. I trust his
>> expertise and I like the way communicates and works in the MTD mailing
>> list.
>
> Sorry, I was typing while being in a meeting. Here is the corrected
> version.
>
> I am fine with giving Brian Norris write access rights to the l2 tree. I
> trust his expertise and I like the way he communicates and works on the
> MTD mailing list.

Thanks for the confidence. I am willing to accept responsibility for
NAND and am open to assisting on other parts of MTD as well. I'll need
an infradead account, of course.

There may still be kinks to work out; e.g., how do we coordinate
rebasing and patch ordering of l2-mtd -- I commented on this earlier,
in response to David. I would prefer to minimize rebasing, but mainly,
I just want to be on the same page as you, Artem, so that we don't
duplicate or conflict in our patch integration efforts.

Brian
