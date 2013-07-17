Received: from mail-ve0-x235.google.com ([2607:f8b0:400c:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uzb72-0003PS-Lu
 for linux-mtd@lists.infradead.org; Wed, 17 Jul 2013 23:26:25 +0000
Received: by mail-ve0-f181.google.com with SMTP id db10so2000324veb.12
 for <linux-mtd@lists.infradead.org>; Wed, 17 Jul 2013 16:26:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1374102799.21468.3.camel@shinybook.infradead.org>
References: <20130712124728.GB31726@localhost>
 <CAN8TOE-y0HvZYWqwoPEZhReVVP_iY6t5p1N0ZMJXPQqwuK5ozQ@mail.gmail.com>
 <51E64B40.1030408@freescale.com>
 <CAF4G-tLsOO_F-Mhn=+5vS2kkJuoeLJwrTdCR90DVuQQ+xn40aw@mail.gmail.com>
 <CAN8TOE_osCKY86W2O5mLxSSahyiW2peFwDhCFuSQ+ewGHeXNKw@mail.gmail.com>
 <1374102799.21468.3.camel@shinybook.infradead.org>
Date: Wed, 17 Jul 2013 16:26:03 -0700
Message-ID: <CAN8TOE9CX7fcDRQzee=Xg5TYkYYOs3__vWzy3r0Ofg0aCsgxSg@mail.gmail.com>
Subject: Re: No pull for mtd?
From: Brian Norris <computersforpeace@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Andrew Morton <akpm@linux-foundation.org>, torvalds@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 17, 2013 at 4:13 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Wed, 2013-07-17 at 16:02 -0700, Brian Norris wrote:
>> On Wed, Jul 17, 2013 at 6:20 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> > As of pull requests, dwmw2 sends them, not me. He
>> > didn't send it this time though.
>>
>> Hence my questions (now directed entirely at David): "Any reason for
>> this miss? Can we get a guarantee a pull for 3.12 at least?"
>>
>> And an added question: if not, shall we move for a change/addition in
>> maintainership? This is the second merge window missed in the last
>> year (we missed v3.6-rc1).
>
> Apologies. Artem usually does a very good job of lining things up for
> me, and I then apply a little more 'editorial control' before sending
> the result on to Linus.
>
> This time it fell through the cracks because Artem was away and didn't
> hassle me like he usually does, and I've been contending with the
> distraction of a 12-week-old baby.

Is there any hassling the rest of us can do in the future to avoid
this situation? Ezequiel gave a timely reminder via email (2 or 3 days
left in the merge window). We can shout louder and earlier, but it's
hard to tell if we're shouting into an empty forest sometimes.

Brian
