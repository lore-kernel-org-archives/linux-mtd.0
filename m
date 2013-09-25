Received: from mail-qe0-f49.google.com ([209.85.128.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOvmP-0005qr-95
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 20:33:49 +0000
Received: by mail-qe0-f49.google.com with SMTP id s14so158912qeb.8
 for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2013 13:33:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130925200539.GH23337@ld-irv-0074.broadcom.com>
References: <1378986619-26765-1-git-send-email-pekon@ti.com>
 <1378986619-26765-2-git-send-email-pekon@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA15ED7@DBDE04.ent.ti.com>
 <20130925134619.GG10746@radagast>
 <20130925175527.GA23337@ld-irv-0074.broadcom.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA16884@DBDE04.ent.ti.com>
 <20130925200539.GH23337@ld-irv-0074.broadcom.com>
Date: Wed, 25 Sep 2013 13:33:27 -0700
Message-ID: <CAOesGMif301iBe9zxHudkC_G9SzPPy1Mj4XYvQ-MY8nmx4wO+A@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] ARM: OMAP2+: cleaned-up DT support of various ECC
 schemes
From: Olof Johansson <olof@lixom.net>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 25, 2013 at 1:05 PM, Brian Norris
<computersforpeace@gmail.com> wrote:

> Olof has given good advice on your DT binding and has (slowly) been
> responding to other requests for DT review that make it to his list. I
> see that he hasn't followed up on your changes (this v6), so pinging him
> (as you did) is probably the correct approach. But please do recognize
> that the DT list is very high volume, so it's hard to get good timely
> responses there.

I am not a DT mainainer, but sometimes when I see a binding that
appears to be wrong I speak up. In this case, the binding was one of
those.

That doesn't mean you should necessarily rely on me for the rest of
the review, there are several dedicated maintainers right now that
should be able to spread the load across them, and it is their ack you
should seek on the binding, not mine.

That being said: this latest version looks good to me. See how much
simpler the binding got when you stopped trying to describe driver
behavior and focused on describing hardware? That's the way we want it
to look like.


So, I have no more objections to it, and I hope you can get a quick
review from a DT maintainer on the rest of the binding.


-Olof
