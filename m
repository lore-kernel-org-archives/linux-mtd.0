Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ApsVu-0007Ie-AH
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2004 17:14:34 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Florian Schirmer <jolt@tuxbox.org>
In-Reply-To: <200402081802.42325.jolt@tuxbox.org>
References: <007301c3ebea$29f96270$9602010a@jingle>
	 <200402081238.45099.jolt@tuxbox.org>
	 <1076241213.12587.240.camel@imladris.demon.co.uk>
	 <200402081802.42325.jolt@tuxbox.org>
Content-Type: text/plain
Message-Id: <1076260389.12587.291.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sun, 08 Feb 2004 17:13:09 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2004-02-08 at 18:02 +0100, Florian Schirmer wrote:
> memcopy_fromio is memcpy on MIPS. I've checked the memcpy implementation in 
> arch/mips/lib/memcpy.S and it is using byte transfers for remaining byte 
> transfers. So i expect at least the MIPS and SH plattform to be broken for 
> non buswidth==1 setups. Haven't checked other archs yet.

I don't understand. Why should it be broken? If your bus controller is
set up right for that region, byte loads ought to work fine. It'll
_issue_ a wider load, then pick the right byte from it.

What's happening is that it's picking the _wrong_ byte from it. Is the
bus controller set up to byte-swap transparently when we do 16-bit
access?

Can you show the result of a single 32-bit load, two consecutive 16-bit
loads, and four consecutive 8-bit loads all starting at the same
address?

> I'm wondering what assumptions can be made about memcpy's access patterns? 
> Looks like nobody even guarantees a specific access type. But we need to make 
> sure every access to the flash matches the bus width, don't we?

I don't think so. The bus controller really ought to handle this for us,
for reading. 

-- 
dwmw2
