Received: from [2001:470:1f01:ffff::eb] (helo=gate.crashing.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JeX1c-0000I6-AG
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 14:54:49 +0000
In-Reply-To: <200803261344.26555.laurentp@cse-semaphore.com>
References: <200803261344.26555.laurentp@cse-semaphore.com>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <d195a61e876d685ea04b29474da187cc@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 2/2] [POWERPC] Describe memory-mapped RAM&ROM chips of
	bindings
Date: Wed, 26 Mar 2008 15:52:37 +0100
To: Laurent Pinchart <laurentp@cse-semaphore.com>
Cc: ben@simtec.co.uk, linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> +    Dedicated RAM and ROM chips are often used as storage for 
> temporary or
> +    permanent data in embedded devices. Possible usage include 
> non-volatile
> +    storage in battery-backed SRAM, semi-permanent storage in 
> dedicated SRAM
> +    to preserve data accross reboots and firmware storage in 
> dedicated ROM.
> +
> +     - compatible : should contain the specific model of RAM/ROM 
> chip(s)
> +       used, if known, followed by either "physmap-ram" or 
> "physmap-rom"
> +     - reg : Address range of the RAM/ROM chip
> +     - bank-width : Width (in bytes) of the RAM/ROM bank. Equal to the
> +       device width times the number of interleaved chips.
> +     - device-width : (optional) Width of a single RAM/ROM chip. If
> +       omitted, assumed to be equal to 'bank-width'.

Maybe I'm rehashing some old discussion here, if so, sorry; but why
do you have bank-width and device-width here?  What useful information
does it provide?  If this is about saying what the preferred (or only
possible) access width is, better names are in order.


Segher
