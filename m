Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O9Z8K-0008Ef-A1
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 07:35:05 +0000
Message-ID: <4BE11FA0.20703@parrot.com>
Date: Wed, 5 May 2010 09:34:56 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Kevin Cernekee <cernekee@gmail.com>
Subject: Re: [PATCHv2 1/2] mtd: nand: Extend NAND flash detection to new MLC
	chips
References: <17c88de31cd52bb3794569c28cd2ae51996e6260@localhost.localdomain>
	<10137ab89de6e6d229798d6f397688b0807024da@localhost.localdomain>
In-Reply-To: <10137ab89de6e6d229798d6f397688b0807024da@localhost.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Reuben.Dowle@navico.com" <Reuben.Dowle@navico.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Kevin Cernekee a écrit :
> Some of the newer MLC devices have a 6-byte ID sequence in which
> several field definitions differ from older chips in a manner that is
> not backward compatible.  For instance:
> 
Doesn't these nand support ONFI "Read Parameter Page" (cmd 0xec) ?
If yes it will be a more generic way to detect new nand features.


Matthieu




> Samsung K9GAG08U0M (5-byte sequence): ec d5 14 b6 74
> 4th byte, bits 1:0 encode the page size: 0=1KiB, 1=2KiB, 2=4KiB, 3=8KiB
> 4th byte, bits 5:4 encode the block size: 0=64KiB, 1=128KiB, ...
> 4th byte, bit 6 encodes the OOB size: 0=8B/512B, 1=16B/512B
> 
> Samsung K9GAG08U0D (6-byte sequence): ec d5 94 29 34 41
> 4th byte, bits 1:0 encode the page size: 0=2KiB, 1=4KiB, 3=8KiB, 4=rsvd
> 4th byte, bits 7;5:4 encode the block size: 0=128KiB, 1=256KiB, ...
> 4th byte, bits 6;3:2 encode the OOB size: 1=128B/page, 2=218B/page
> 
> This patch uses the new 6-byte scheme if the following conditions are
> all true:
> 
> 1) The ID code wraps around after exactly 6 bytes
> 
> 2) Manufacturer is Samsung
> 
> 3) 6th byte is zero
> 
> The patch also extends the maximum OOB size from 128B to 256B.
> 
