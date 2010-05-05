Received: from mika.eatserver.nl ([195.20.9.75])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9auu-0004lr-CB
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 09:29:21 +0000
Message-ID: <4BE13A65.1020701@aimvalley.nl>
Date: Wed, 05 May 2010 11:29:09 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Some questions on bit-flips and JFFS2
References: <201005031505.18604.muehlfelder@enertex.de>	
	<4BDFE8D6.1050704@aimvalley.nl>
	<201005041659.26262.muehlfelder@enertex.de>	
	<4BE12D86.2070605@aimvalley.nl>	
	<Pine.LNX.4.64.1005051039490.22753@lnxricardw.se.axis.com>
	<1273049480.3702.129.camel@localhost>
In-Reply-To: <1273049480.3702.129.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?UTF-8?B?VGhvcnN0ZW4gTQ==?= =?UTF-8?B?w7xobGZlbGRlcg==?=
	<muehlfelder@enertex.de>, Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:

.
.
.

> 
> Unless you supply your device with an UPS :-)
> 
> I did not really follow the discussion, so sorry if the following is
> unrelated: I think it should not be too difficult to teach JFFS2 to
> force GC on eraseblocks with bit-flips.
> 

I can confirm that ;-)
we actually implemented this (for our ancient 2.4.25 kernel with JFFS2 version 2005)
because we were seriously suffering from NAND bit flips on our Numonyx SLC NAND device.
see:
http://lists.infradead.org/pipermail/linux-mtd/2009-August/027080.html

This would only benefit the OP if kernel image is kept on JFFS2 (too).
