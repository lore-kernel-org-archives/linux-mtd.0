Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YZSqZ-00073h-S6
 for linux-mtd@lists.infradead.org; Sat, 21 Mar 2015 23:30:28 +0000
Received: by iedm5 with SMTP id m5so13342530ied.3
 for <linux-mtd@lists.infradead.org>; Sat, 21 Mar 2015 16:30:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150320191258.GW32500@ld-irv-0074>
References: <1426111046-29900-1-git-send-email-computersforpeace@gmail.com>
 <20150312105824.GD30145@leverpostej>
 <20150320191258.GW32500@ld-irv-0074>
Date: Sun, 22 Mar 2015 00:30:05 +0100
Message-ID: <CACna6ryvD2Dn2eQPMvoJ+1Yt75=w1J6OR=tvOSZsMsBgD2O4yg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: devicetree: m25p80: add "nor-jedec"
 binding
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 20 March 2015 at 20:12, Brian Norris <computersforpeace@gmail.com> wrote:
> Yes, and that is an eventual goal I suppose, but the current list is
> excessive and is most likely not currently relied on by any one. So I
> don't just want to C&P the entire list into this binding immediately.
>
> I guess my plan looks like this:
>
> 1. add "nor-jedec" binding, to provide lowest common denominator binding
> (this series)
>
> 2. stop adding to the m25p_ids[] table unless necessary (enabled by this
> series)
>
> 3. gauge whether we can remove certain entries from m25p_ids[] (e.g., if
> they were only used in platform_data, not DT; or if they were very
> recently added just to synchronize with spi-nor.c)

Why we can't remove (slowly) all entries from m25p_ids that don't need
any extra handling?

If we'll have DT with
"spansion,m25p80", "nor-jedec"
and then m25p80.c will handle both: "m25p80" and "nor-jedec" without
any difference, what's the point of keeping "m25p80" entry?
