Received: from mail-pf0-x22f.google.com ([2607:f8b0:400e:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1am5uG-0003DH-Et
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 20:43:00 +0000
Received: by mail-pf0-x22f.google.com with SMTP id 4so98630959pfd.0
 for <linux-mtd@lists.infradead.org>; Fri, 01 Apr 2016 13:42:39 -0700 (PDT)
Date: Fri, 1 Apr 2016 13:42:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 boris brezillon <boris.brezillon@free-electrons.com>,
 Marek =?utf-8?B?VmHFoXV0?= <marex@denx.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v2 2/2] doc: dt: mtd: add a DT property to enable the use
 of 4byte-address op codes
Message-ID: <20160401204236.GE3645@localhost>
References: <cover.1458657802.git.cyrille.pitchen@atmel.com>
 <b6dff3f629497025be74207227b94807b64e0e9c.1458657802.git.cyrille.pitchen@atmel.com>
 <CAL_JsqKUMhPwxrhz50D8+UAaVPT_+=xJLm6A6fVy6RgpyOnq8w@mail.gmail.com>
 <56F2B18A.3020107@atmel.com> <56F54ED2.3030609@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56F54ED2.3030609@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 25, 2016 at 03:44:34PM +0100, Cyrille Pitchen wrote:
> Hi all,
> 
> Since the framework is named spi-nor, what about spi-nor-4byte-opcodes?
> Is it okay for everyone?
> 
> It would follow the same pattern as spi-max-frequency which applies to all SPI
> devices.

"spi-nor-" as a prefix seems better, thanks.

I'm still not confident we've settled the discussion on the need for
this property. I really don't like having a mixture of ways to specify
the same thing, so if we can avoid it in any way (e.g., by just being
more specific about device names), then I'd probably prefer that.

Brian
