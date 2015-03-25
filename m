Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YaZby-0006ry-Lp
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 00:55:59 +0000
Received: by padcy3 with SMTP id cy3so10436145pad.3
 for <linux-mtd@lists.infradead.org>; Tue, 24 Mar 2015 17:55:37 -0700 (PDT)
Date: Tue, 24 Mar 2015 17:55:34 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
Message-ID: <20150325005534.GC2677@norris-Latitude-E6410>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
 <20150312105824.GD30145@leverpostej>
 <20150320191258.GW32500@ld-irv-0074>
 <CACna6ryvD2Dn2eQPMvoJ+1Yt75=w1J6OR=tvOSZsMsBgD2O4yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6ryvD2Dn2eQPMvoJ+1Yt75=w1J6OR=tvOSZsMsBgD2O4yg@mail.gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Mar 22, 2015 at 12:30:05AM +0100, Rafał Miłecki wrote:
> On 20 March 2015 at 20:12, Brian Norris <computersforpeace@gmail.com> wrote:
> > Yes, and that is an eventual goal I suppose, but the current list is
> > excessive and is most likely not currently relied on by any one. So I
> > don't just want to C&P the entire list into this binding immediately.
> >
> > I guess my plan looks like this:
> >
> > 1. add "nor-jedec" binding, to provide lowest common denominator binding
> > (this series)
> >
> > 2. stop adding to the m25p_ids[] table unless necessary (enabled by this
> > series)
> >
> > 3. gauge whether we can remove certain entries from m25p_ids[] (e.g., if
> > they were only used in platform_data, not DT; or if they were very
> > recently added just to synchronize with spi-nor.c)
> 
> Why we can't remove (slowly) all entries from m25p_ids that don't need
> any extra handling?
> 
> If we'll have DT with
> "spansion,m25p80", "nor-jedec"
> and then m25p80.c will handle both: "m25p80" and "nor-jedec" without
> any difference, what's the point of keeping "m25p80" entry?

ABI stability. A lot of DTBs might be using m25p80 already, and they
aren't supposed to have to update just because SW decided to drop them.
But see [1] for the official word on ABI stability. I think that leaves
room for removing most/all of these eventually.

Brian

[1] Documentation/devicetree/bindings/ABI.txt
