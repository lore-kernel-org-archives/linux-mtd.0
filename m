Received: from mail-ve0-x22e.google.com ([2607:f8b0:400c:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4GcO-0001lX-49
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 20:34:05 +0000
Received: by mail-ve0-f174.google.com with SMTP id d10so191549vea.5
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 13:33:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130731015329.GA2133@gmail.com>
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
Date: Tue, 30 Jul 2013 13:33:42 -0700
Message-ID: <CAN8TOE8KUrSznErsvNRLAw2YswtB=L+idUG4TbYZEWZM8F2ubg@mail.gmail.com>
Subject: Re: No pull for mtd?
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <dedekind1@gmail.com>, torvalds@linux-foundation.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 30, 2013 at 6:53 PM, Huang Shijie <shijie8@gmail.com> wrote:
> On Tue, Jul 30, 2013 at 02:04:08PM +0300, Artem Bityutskiy wrote:
>> On Sat, 2013-07-20 at 08:22 -0400, Huang Shijie wrote:
>> > I really envy the other maillist, you can get response in several
>> > days.
>>
>> Well, yes. MTD is a small and (IMHO) a veeery slowly dying subsystem.
> I am not sure it is dying, but there are still so many patches pending
> in the maillist.

Dying or not (it certainly doesn't have its youthful vigor ATM), I
agree with Huang that the current response time is not sufficient for
the current level of contribution.

>> Brian was one of those who did great job in MTD overall, especially in
>> the NAND framework. He reviewed others patches. But even Brian got
>> silent lately.
> I think he feels frastrated too. :)

Slowness certainly helps divert my attention to other things (for
instance, I'll send a patch series, then forget about it for a while,
due to no review/response). But on the flipside, I will admit that I
have not always been proactive on reviewing others' work. But that can
change, especially if there's an incentive that my review will
actually mean quicker acceptance and progress.

Brian
