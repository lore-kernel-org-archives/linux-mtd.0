From: David Woodhouse <dwmw2@infradead.org>
To: Dave Dillow <ddillow@idleaire.com>
In-Reply-To: <1067376879.9396.1.camel@dillow.idleaire.com>
References: <3F9EA810.6010905@celerity.net>
	 <1067376879.9396.1.camel@dillow.idleaire.com>
Content-Type: text/plain
Message-Id: <1068028031.6065.18.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 05 Nov 2003 10:27:12 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: INFTL problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-10-28 at 16:34 -0500, Dave Dillow wrote:
> Try this -- it's my current hack to get my 128MB recoginzed. When I get
> time, I plan to work on nand/diskonchip.c, per dwmw2's suggestion.

I'm having a go at merging it -- I should have something for you to test
shortly. I'm hoping to drop the 'DoC_is_2000TSOP()' tests and just treat
it unconditionally as a Millennium. Did you really need these parts...

-       if (DoC_is_2000(doc))
+       if (DoC_is_2000(doc) || DoC_is_2000TSOP(doc))
                xtraflags |= CDSN_CTRL_FLASH_IO;

For the Millennium (and hence I'd have assumed for these 2000 parts too)
we're never supposed to set the CDSN_CTRL_FLASH_IO bit; it's defined as
"always write zero".

Zachi?

-- 
dwmw2
