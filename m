Received: from server.bluewater.co.nz ([203.167.251.250]
	helo=smtp.bluewaternz.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QZyb-0005pU-NW
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 22:51:22 +0100
Received: from benmore.bluewaternz.com
	([192.168.2.3] helo=bluewatersys.com ident=gordon)
	by smtp.bluewaternz.com with esmtp (Exim 3.03 #1 (Debian))
	id 19QZz4-0003Gy-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 09:51:50 +1200
Message-ID: <3EE8F5F6.7050805@bluewatersys.com>
Date: Fri, 13 Jun 2003 09:51:50 +1200
From: Gordon J Milne <gordon@bluewatersys.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <20030612163736.CFEC.MINGFENG@linpus.com>
In-Reply-To: <20030612163736.CFEC.MINGFENG@linpus.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: MRAM will kill FLASH ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mingfeng wrote:
> who know MRAM(Magnetoresistive Random Access Memory) ?
> Will it kill FLASH soon?

Hopefully it will kill FLASH but I cannot see it happening anytime soon. 
MRAM storage densities have a long way to go to make MRAM a competitive 
alternative to FLASH. But this is to be expected because the MRAM developers 
have only just moved form the working on the device fundamentals to the 
production building issues.

It is difficult to say how long it will take but I suspect that as soon as 
device densities approach 50% that of FLASH, you will see MRAM taking over 
in specialist devices - top end PDAs, niche embedded systems, etc. And, of 
course, the Instant-On computer.

The recent announcement by Toshiba and SanDisk about futher reducing the 
size of NAND FLASH cells increases the lifetime of FLASH and raise the bar 
for MRAM deployment.

BTW, a recent issue of IEEE Spectrum had a good overview article on the 
"new" memory technologies of MRAM, FRAM (Ferromagnetic RAM) and OUM (Ovonic 
Unified Memory). It described the benefits of each and the underlying 
physical principle involved.

See http://www.spectrum.ieee.org/spectrum/mar03/features/semi.html fro more 
details.
