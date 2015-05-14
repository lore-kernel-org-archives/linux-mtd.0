Received: from mail-pa0-f46.google.com ([209.85.220.46])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsjYq-0001Ft-FW
 for linux-mtd@lists.infradead.org; Thu, 14 May 2015 03:11:48 +0000
Received: by pacwv17 with SMTP id wv17so69884075pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 13 May 2015 20:11:27 -0700 (PDT)
Date: Thu, 14 May 2015 11:11:00 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx: add "nor-jedec" flash compatible binding
Message-ID: <20150514031059.GB6850@dragon>
References: <1431066065-19644-1-git-send-email-zajec5@gmail.com>
 <20150511132052.GH9347@dragon>
 <CACna6ryDk2TTsXnVMbaica2T8-4Xo2tU40Ov6sq3FVkx_p=zhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6ryDk2TTsXnVMbaica2T8-4Xo2tU40Ov6sq3FVkx_p=zhw@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 12, 2015 at 06:54:22AM +0200, Rafał Miłecki wrote:
> On 11 May 2015 at 15:20, Shawn Guo <shawn.guo@linaro.org> wrote:
> > On Fri, May 08, 2015 at 08:21:05AM +0200, Rafał Miłecki wrote:
> >> Starting with commits
> >> 8ff16cf ("Documentation: devicetree: m25p80: add "nor-jedec" binding")
> >> 1103b85 ("mtd: m25p80: bind to "nor-jedec" ID, for auto-detection")
> >> we have "nor-jedec" binding indicating support for JEDEC identification.
> >>
> >> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> >
> > Applied, thanks.
> 
> Thanks, unfortunately after some discussion started by tegra patch, it
> may happen we will rename it to jedec,spi-nor :( If that happens, I'll
> care to provide another patch. Sorry for the problem.

Patch dropped.
