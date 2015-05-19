Received: from mail-ig0-x22a.google.com ([2607:f8b0:4001:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yubwi-0002Wy-Rn
 for linux-mtd@lists.infradead.org; Tue, 19 May 2015 07:28:13 +0000
Received: by igbpi8 with SMTP id pi8so99244176igb.0
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2015 00:27:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150519013415.GV11598@ld-irv-0074>
References: <1431624773-4165-1-git-send-email-computersforpeace@gmail.com>
 <20150515195541.GL11598@ld-irv-0074>
 <20150518104501.GD3551@leverpostej>
 <20150518183442.GR11598@ld-irv-0074>
 <CAMuHMdUCj2AXk_0mAgRfAStrveHPi=Rp2g-b177zO_ode8NaCw@mail.gmail.com>
 <20150519013415.GV11598@ld-irv-0074>
Date: Tue, 19 May 2015 09:27:50 +0200
Message-ID: <CACna6rzpxoXEJbeRyxaR0wiPpWc_MmgvnqoW-dSw4fF-=EMM_g@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dt: mtd: replace "nor-jedec" binding with
 "jedec, spi-nor"
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Marek Vasut <marex@denx.de>, Pawel Moll <Pawel.Moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Stephen Warren <swarren@wwwdotorg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Kumar Gala <galak@codeaurora.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19 May 2015 at 03:34, Brian Norris <computersforpeace@gmail.com> wrote:
> So how about the following patch? It seems like we'll need to be able to
> ignore useless 'modalias' values in cases like this:
>
>         // modalias = "shinynewdevice"
>         compatible = "myvendor,shinynewdevice", "jedec,spi-nor";
>
> and also if somebody leaves off the entire shinynewdevice string:
>
>         // modalias = "spi-nor"
>         compatible = "jedec,spi-nor";
>
> So we rework the spi-nor library to not reject "bad" names, and just
> fall back to autodetection, and we add the .of_match_table to properly
> catch all "jedec,spi-nor".

That's nice but what about platforms using platform data instead of
DT? I would like to use some kind of "spi-nor" (with some prefix
*maybe*) for them too.
