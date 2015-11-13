Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZxKDO-0004cd-Js
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2015 19:40:55 +0000
Received: by pacej9 with SMTP id ej9so2211862pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2015 11:40:34 -0800 (PST)
Date: Fri, 13 Nov 2015 11:40:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Mark Brown <broonie@kernel.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-mtd@lists.infradead.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: spi: OF module autoloading is still broken (was: Re: m25p80: Commit
 "allow arbitrary OF matching for "jedec,spi-nor"" breaks module autoloading)
Message-ID: <20151113194031.GI8456@google.com>
References: <56104E88.3040807@gmail.com>
 <20151112185926.GC8456@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151112185926.GC8456@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Changing subject line, because apparently some people ignore mail if it
doesn't have 'SPI' in the subject line)

On Thu, Nov 12, 2015 at 10:59:26AM -0800, Brian Norris wrote:
> + others
> 
> On Sat, Oct 03, 2015 at 11:54:16PM +0200, Heiner Kallweit wrote:
> > Seems like commit 43163022927b6e7d202a7e6f939c3f392465494d
> > (allow arbitrary OF matching for "jedec,spi-nor") broke autoloading
> > of the m25p80 module.
> > MODALIAS is "spi:spi-nor" and removing "spi-nor" as device alias
> > prevents module autoloading.
> > 
> > Of course we could revert the removal of the "spi-nor" device alias.
> > However it might be better to switch to DT-based matching for
> > DT-configured devices.
> > 
> > Adding a call to of_device_uevent_modalias to spi_uevent in spi.c
> > solved the issue for me, drawback however is that just the first
> > "compatible" value is used as modalias. In case of m25p80 this means
> > that "jedec,spi-nor" has to be the first "compatible" value.
> > This constraint might be too strict ..
> > 
> > Having said that I'm not sure what could be a better way to fix
> > the issue than just re-introducing the "spi-nor" device alias.
> 
> Is this [1] getting fixed in SPI any time soon? Looks like there was
> some progress [2], but AFAICT it's not completed.
> 
> I'd just like to know what the way forward here should be for m25p80.
> Really, "jedec,spi-nor" never autoloaded modules very reliably because
> of the SPI core constaints. So I'm not sure I'd consider this a
> regression, and I might be OK waiting around if it'll be fixed in a
> reasonable time frame.
> 
> FWIW, I can do testing if somebody's tackling this still. Just CC me.
> 
> Regards,
> Brian
> 
> [1] https://lkml.org/lkml/2014/9/11/458
> [2] https://lkml.org/lkml/2015/8/20/109
