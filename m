Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A3uFM-0002Ck-8u
	for <linux-mtd@lists.infradead.org>; Mon, 29 Sep 2003 10:23:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Daniel Toussaint <daniel@dmhome.net>
In-Reply-To: <1064826976.29857.116.camel@host35>
References: <1064826976.29857.116.camel@host35>
Message-Id: <1064827342.29569.17.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 29 Sep 2003 10:22:22 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: raw nand on x86 - reference boards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-09-29 at 17:16 +0800, Daniel Toussaint wrote:
> Hi, 
> 
> Does anyone know where I can find an x86 based sbc with nand chips on
> board(NOT implemented as ide flash disk) OR maybe an ISA/pci add-on card
> of some sort ? I need it to do a proof of concept , write some drivers
> and a bootloader (x86 legacy bios extension)  .... 

A DiskOnChip 2000 or Millennium sounds like an ideal answer for this.

-- 
dwmw2
