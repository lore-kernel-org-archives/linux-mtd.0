From: David Woodhouse <dwmw2@infradead.org>
To: leoli@motorola.com
In-Reply-To: <1075971769.28245.60.camel@Gundam>
References: 
	 <01139FC052A0D411900B00508B9535FC0F0D25BB@ZCH07EXM04.corp.mot.com>
	 <1074503876.14499.40.camel@imladris.demon.co.uk>
	 <1074509881.14564.3.camel@Gundam>
	 <1074510244.14499.49.camel@imladris.demon.co.uk>
	 <1074572447.14559.23.camel@Gundam>
	 <1074583969.14499.100.camel@imladris.demon.co.uk>
	 <1075950453.12044.7.camel@Gundam>
	 <1075964435.12587.2.camel@imladris.demon.co.uk>
	 <1075971769.28245.60.camel@Gundam>
Content-Type: text/plain
Message-Id: <1075973239.786.6179.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 05 Feb 2004 09:27:20 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2+mtd+big endian problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-02-05 at 17:02 +0800, Li Yang wrote:
> Search for id:(ff89 ffaa) interleave(2) type(2)
> Search for id:(ff89 ffaa) interleave(2) type(2)
> Search for id:(ff89 ffaa) interleave(2) type(2)
> Search for id:(ff89 ffaa) interleave(2) type(2)
> Search for id:(ff89 ffaa) interleave(2) type(2)
> Search for id:(89 aa) interleave(2) type(1)

The 'sharp.c' driver handles four 8-bit chips in parallel. Your probes
above aren't _looking_ for that. Did you enable the advanced CFI options
and then disable 4-way interleave? 

> MTD jedec_match(): Check fit 0x00000000 + 0x00200000 = 0x00200000
> MTD jedec_match(): check unlock addrs 0x0555 0x02aa
> MTD jedec_match(): check ID's disappear when not in ID mode
> MTD jedec_match(): return to ID mode
> MTD jedec_probe_chip(): matched device 0x89,0xaa unlock_addrs: 0x0555
> 0x02aa
> Found: Intel I28F016S3
> Flash SIMM: Found 2 x8 devices at 0x0 in 32-bit mode
> Probe at addr_unlock2(0x00400000 + 0xc0185aac) past the end of the
> map(0x007fffff)

That's odd too. What is that pointer doing in addr_unlock2? Possibly not
relevant though.

-- 
dwmw2
