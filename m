Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4AmU-000089-Bd
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 14:20:07 +0000
Received: by mail-pa0-f53.google.com with SMTP id lb1so7267422pab.12
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2013 07:19:44 -0700 (PDT)
Date: Tue, 30 Jul 2013 22:24:00 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: No pull for mtd?
Message-ID: <20130731022357.GA6910@gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375193034.14869.158.camel@sauron.fi.intel.com>
Cc: torvalds@linux-foundation.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 30, 2013 at 05:03:54PM +0300, Artem Bityutskiy wrote:
> 
> I'll change my practice and will start processing patches which have
> acks from others first.
> 
For the common code, such as mtd/bbt code, we can give the acks.
But for the specific drivers, it's better that you merge them yourself.

Best Regards
Huang Shijie
