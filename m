Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R32qY-0006k0-75
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2011 09:30:34 +0000
Received: by gyg13 with SMTP id 13so3356173gyg.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Sep 2011 02:30:32 -0700 (PDT)
Subject: Re: mtd-utils: ubiformat: writing images on flash with badblocks.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Mon, 12 Sep 2011 12:33:01 +0300
In-Reply-To: <Pine.LNX.4.64.1109120840020.8150@lnxricardw.se.axis.com>
References: <CAMjE+nUOxOm4bBWKp1xAcVDjP-Pepd_GuJ=DcQ4jUcsohn-K=g@mail.gmail.com>
	<1315738766.18731.9.camel@sauron>
	<Pine.LNX.4.64.1109120840020.8150@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315819985.18731.72.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Anton Olofsson <anol.martinsson@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-09-12 at 08:41 +0200, Ricard Wanderlof wrote:
> > On Sun, 11 Sep 2011, Artem Bityutskiy wrote:
> > 
> > This issue was reported and analyzed by
> > Anton Olofsson <anol.martinsson@gmail.com>:
> > 
> > when ubiformat encounters a write error while flashing the UBI image (which may
> > come from a file of from stdout), it correctly marks the faulty eraseblock as
> > bad and skips it. However, it also incorrectly drops the data buffer which was
> > supposed to be written, and reads next block of data.
> 
> I'm just curious, how come this has gone unnoticed for so long? One would 
> think that someone would have tried to flash an image to a chip with bad 
> blocks a long time ago?

No, bad blocks are handled fine. This is about the situation when an
eraseblock is good, then we write to it, and we get an error, then we
torture it, and the test fails, and we (ubiformat) mark it as bad. This
is very rare situation indeed.

-- 
Best Regards,
Artem Bityutskiy
