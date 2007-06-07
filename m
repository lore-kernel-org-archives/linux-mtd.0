Received: from mail-in-07.arcor-online.net ([151.189.21.47])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HwKLF-00036E-IX
	for linux-mtd@lists.infradead.org; Thu, 07 Jun 2007 11:56:08 -0400
In-Reply-To: <1181228442.2785.60.camel@pmac.infradead.org>
References: <7fc919fce0761f861be3069a853d3169@bga.com>
	<bd6ef296692e8cfb81118f2dc85189a5@kernel.crashing.org>
	<4662EAA9.70104@ru.mvista.com>
	<e4197fd2753f2b4d548d5dde9e3fd1d3@kernel.crashing.org>
	<466308F4.8050004@ru.mvista.com>
	<8ac5664208e0f59329b62ac2138bbc8c@kernel.crashing.org>
	<466312C2.4090200@ru.mvista.com>
	<548a7e11ffb577f6395b8f5a9c2fba2d@kernel.crashing.org>
	<466323EF.5040807@ru.mvista.com>
	<1181228442.2785.60.camel@pmac.infradead.org>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <18fbfbaf113ab76b602d279848d9b405@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
Date: Thu, 7 Jun 2007 17:55:44 +0200
To: David Woodhouse <dwmw2@infradead.org>
Cc: Sergei Shtylyov <sshtylyov@ru.mvista.com>, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org, Milton Miller <miltonm@bga.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Any representation of flash devices in the device-tree should ideally
> have 'bus width' and 'interleave' properties to contain this
> information.
>
> The 'bus width' cannot necessarily be inferred, especially where a 
> given
> bus can be configured to allow multiple sizes of access. It's purely a
> function of how the flash chips are wired up. That's why we actually
> call it 'bank width', not 'bus width' in the Linux code.

Ah, "bank width" as in "bus width" per chip select.  I see.

So I think the best thing to have would be

	compatible      "cfi-flash"
	bank-width      like you said
	device-width    width of a single flash device
	reg             complete address range of this thing

and then the Linux OF CFI flash code / MTD code just keeps
on probing devices from that address range until it has it
filled.

Sounds good / comments / anything I missed?


Segher
