Subject: Re: [PATCH] mtd: OneNAND: samsung: Write DMA support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Thu, 30 Jun 2011 16:38:33 +0300
In-Reply-To: <20110630112354.GW21898@n2100.arm.linux.org.uk>
References: <20110608101804.GA5527@july> <1309420530.23597.153.camel@sauron>
	<20110630091951.GQ21898@n2100.arm.linux.org.uk>
	<1309430735.23597.165.camel@sauron>
	<20110630112354.GW21898@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309441118.23597.198.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Kyungmin Park <kmpark@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-30 at 12:23 +0100, Russell King - ARM Linux wrote:
> It's probably going to be better to have a MTD block API for DMA which
> provides a scatterlist to the MTD block driver, and which knows whether
> the memory is from vmalloc.  When it is, it takes care of the flushing
> via those two functions I referred to in cachetlb.txt.
> 
> This keeps the magic out of the individual MTD block drivers, and stops
> them replicating the same mistakes time and time again - and also means
> that you won't have to teach everyone about this.

Yeah, something like this. The MTD API is not very suitable for this and
would need some rework to make sure we achieve 2 goals:

1. No need to change current MTD API users
2. Keep the vmalloced memory handling in one place and not replicate it
   in each driver.

Currently only OneNAND drivers do these hacks, so I guess Kyungmin will
suffer most...

> It doesn't make sense for the DMA API to deal with vmalloc - MTD is
> one of the very few (the only?) subsystems which does this.

OK, thank you!

-- 
Best Regards,
Artem Bityutskiy
