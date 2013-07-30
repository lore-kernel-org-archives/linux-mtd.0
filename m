Received: from mail-ve0-x234.google.com ([2607:f8b0:400c:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4Gnr-000235-Rn
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 20:45:56 +0000
Received: by mail-ve0-f180.google.com with SMTP id pb11so3347098veb.11
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 13:45:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130731022357.GA6910@gmail.com>
References: <CAF4G-tLsOO_F-Mhn=+5vS2kkJuoeLJwrTdCR90DVuQQ+xn40aw@mail.gmail.com>
 <CAN8TOE_osCKY86W2O5mLxSSahyiW2peFwDhCFuSQ+ewGHeXNKw@mail.gmail.com>
 <1374102799.21468.3.camel@shinybook.infradead.org>
 <CAN8TOE9CX7fcDRQzee=Xg5TYkYYOs3__vWzy3r0Ofg0aCsgxSg@mail.gmail.com>
 <1374109439.21468.67.camel@shinybook.infradead.org>
 <CAN8TOE_y=mDY4frFB9kmedhGnNhf4pQwqH1q+fAcDAE_RNwO+A@mail.gmail.com>
 <20130720122231.GB4410@gmail.com>
 <1375182248.14869.127.camel@sauron.fi.intel.com>
 <20130731015329.GA2133@gmail.com>
 <1375193034.14869.158.camel@sauron.fi.intel.com>
 <20130731022357.GA6910@gmail.com>
Date: Tue, 30 Jul 2013 13:45:34 -0700
Message-ID: <CAN8TOE8cXsLJoRT-bEmRaKzEGA3rFxHsfE_cs3KA+FBrCDTY=Q@mail.gmail.com>
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

Hi Huang,

On Tue, Jul 30, 2013 at 7:24 PM, Huang Shijie <shijie8@gmail.com> wrote:
> On Tue, Jul 30, 2013 at 05:03:54PM +0300, Artem Bityutskiy wrote:
>> I'll change my practice and will start processing patches which have
>> acks from others first.
>>
> For the common code, such as mtd/bbt code, we can give the acks.
> But for the specific drivers, it's better that you merge them yourself.

I have the same issue sometimes (regarding "specific drivers"); it's
actually easier for me (and more rewarding) to review work on the
common subsystem portions than it is to understand (and review) the
exact behavior of a particular driver/hardware. But then again, I
don't expect that Artem has much more hands-on experience with, say, a
pxa3xx or a TI OMAP NAND than you or I do. So we can give general
design and code quality recommendations/reviews even for drivers that
are not "our own."

(At the same time, it's possible I will do some work to get myself
more variety of test boards so I can test a broader range of the
MTD/NAND subsystem.)

Brian
