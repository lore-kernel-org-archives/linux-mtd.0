Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15f0au-0004sc-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 15:57:28 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B978FD5.D35F06BF@mazet.de> 
References: <3B978FD5.D35F06BF@mazet.de> 
To: Holger Friedrich <friedrich@MAZeT.de>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip write performance 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Date: Thu, 06 Sep 2001 16:02:52 +0100
Message-ID: <9184.999788572@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


friedrich@MAZeT.de said:
> I'm using a DiskOnChip 2000 and thanks to this mailing list I'm able
> to boot linux off it.  My application needs to write big files pretty
> fast and I was expecting a write speed of 500 kBytes/sec, the
> M-Systems DOC 2000 spec claims to achieve this. Unfortunately the
> fastest speed I could obtain was about 70 kBytes/sec which seems
> pretty poor to me. When I asked the M-Systems support the answers were
> not really helpfull so far. 

Are you using their drivers or the real Linux ones? If you're not using
their drivers, I can understand why they couldn't help you very much.

Our driver is fairly naïve, and may well be wasting a lot of time which 
it shouldn't. I can give you pointers on fixing that, if you're 
interested.

--
dwmw2
