Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzZFJ-0001k2-Ms
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 00:08:10 +0000
Received: by pabfh17 with SMTP id fh17so99731825pab.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 16:07:48 -0800 (PST)
Date: Thu, 19 Nov 2015 16:07:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Martin Sperl <martin@sperl.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-mtd@lists.infradead.org,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
Message-ID: <20151120000746.GQ64635@google.com>
References: <564CEB61.2000601@gmail.com> <20151118215755.GL31303@sirena.org.uk>
 <564D0098.4030107@gmail.com> <20151119114057.GN31303@sirena.org.uk>
 <F224F5F3-FAD5-47FE-9419-39E53BCBB8C6@sperl.org>
 <20151119171538.GO31303@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20151119171538.GO31303@sirena.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 19, 2015 at 05:15:38PM +0000, Mark Brown wrote:
> On Thu, Nov 19, 2015 at 04:00:45PM +0100, Martin Sperl wrote:
> > On the bcm2835 there are also some “limitations” (when transfers are not aligned
> > to word, transfers>65535 can’t DMA) which we work around right now inefficiently.
> 
> Alignment is a general issue which all clients should be trying to
> ensure as a matter of course - never mind individual blocks of hardware,
> some common CPU architectures suffer noticable penalties from unaligned
> accesses so it's just generally good practice to try to avoid them.
> 
> You shouldn't be doing anything about transfer size limitations in your
> driver, if you have this restriction you should be adding code to the
> core and just flagging the limit in your driver.

So for transfer size limitations, are you speaking of the same thing as
Heiner (who began this post mentioning *message* size limitations)? I
read a difference between the two, where a transfer size limitation
might mean that one could improve the SPI core to just split transfers
up into multiple sub-transfers, and still complete the whole
spi_message (and therefore the protocol driver has less to worry about).
But if we're talking about spi_message limitations, then this would be
more exposed to the protocol driver.

Or maybe I'm just reading this all wrong and am confused. Please
enlighten.

Regards,
Brian
