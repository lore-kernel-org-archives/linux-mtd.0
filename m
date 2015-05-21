Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvKrN-0000Mf-MI
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 07:25:42 +0000
Received: by igbsb11 with SMTP id sb11so2214933igb.0
 for <linux-mtd@lists.infradead.org>; Thu, 21 May 2015 00:25:19 -0700 (PDT)
Date: Thu, 21 May 2015 00:25:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] Documentation: dt: mtd: replace "nor-jedec" binding with
 "jedec,spi-nor"
Message-ID: <20150521072515.GC11112@norris-Latitude-E6410>
References: <1431624773-4165-1-git-send-email-computersforpeace@gmail.com>
 <20150515195541.GL11598@ld-irv-0074>
 <20150518104501.GD3551@leverpostej>
 <20150518183442.GR11598@ld-irv-0074>
 <CAMuHMdUCj2AXk_0mAgRfAStrveHPi=Rp2g-b177zO_ode8NaCw@mail.gmail.com>
 <20150519013415.GV11598@ld-irv-0074>
 <CACna6rzpxoXEJbeRyxaR0wiPpWc_MmgvnqoW-dSw4fF-=EMM_g@mail.gmail.com>
 <20150520213546.GN11598@ld-irv-0074>
 <CACna6rxq5zOR=7LT2vdbioWp3nD0eBeELJ_d9pPk7VwTWhmStg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rxq5zOR=7LT2vdbioWp3nD0eBeELJ_d9pPk7VwTWhmStg@mail.gmail.com>
Cc: Marek Vasut <marex@denx.de>, Stephen Warren <swarren@wwwdotorg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(trim CC a bit, as this is no longer a DT binding question)

On Thu, May 21, 2015 at 09:12:25AM +0200, Rafał Miłecki wrote:
> On 20 May 2015 at 23:35, Brian Norris <computersforpeace@gmail.com> wrote:
> > On Tue, May 19, 2015 at 09:27:50AM +0200, Rafał Miłecki wrote:
> >> On 19 May 2015 at 03:34, Brian Norris <computersforpeace@gmail.com> wrote:
> >> > So how about the following patch? It seems like we'll need to be able to
> >> > ignore useless 'modalias' values in cases like this:
> >> >
> >> >         // modalias = "shinynewdevice"
> >> >         compatible = "myvendor,shinynewdevice", "jedec,spi-nor";
> >> >
> >> > and also if somebody leaves off the entire shinynewdevice string:
> >> >
> >> >         // modalias = "spi-nor"
> >> >         compatible = "jedec,spi-nor";
> >> >
> >> > So we rework the spi-nor library to not reject "bad" names, and just
> >> > fall back to autodetection, and we add the .of_match_table to properly
> >> > catch all "jedec,spi-nor".
> >>
> >> That's nice but what about platforms using platform data instead of
> >> DT? I would like to use some kind of "spi-nor" (with some prefix
> >> *maybe*) for them too.
> >
> > For platform devices, you might as well just use the name of the driver,
> > which is 'm25p80'. Isn't that how most platform devices are matched with
> > drivers?
> 
> Yes and I think it's ugly because it keeps causing the warning about
> read flash model not matching specified one (m25p80).

Sure, I agree.

> Are you
> seriously not going to allow platform stuff *clearly* request flash
> model detection (JEDEC RDID OP)? Just because they don't use DT?

No, this isn't about "allowing" anything. It's just that my primary
concern was to get the DT binding straightened out properly. Linus'
current tree now has the proper binding, but the m25p80.c code doesn't
quite bind properly. It will work if "jedec,spi-nor" is the first
entry in the compatible property (and so it becomes the 'modalias', but
not second, third, etc. So my patch fixes that properly.

Now, the secondary concern is that you want platform devices to specify
something generic, and that doesn't yield a "found X, expected Y"
message. I'm perfectly fine with fixing that too, if you have a patch
for it. What do you propose?

Brian
