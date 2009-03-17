Received: from djurbala-pt.tunnel.tserv2.fmt.ipv6.he.net
	([2001:470:1f01:ffff::eb] helo=gate.crashing.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LjZmo-0005HG-2S
	for linux-mtd@lists.infradead.org; Tue, 17 Mar 2009 13:56:57 +0000
Message-Id: <0AF2700E-820D-4B45-B87C-2CF39185CCA6@kernel.crashing.org>
From: Kumar Gala <galak@kernel.crashing.org>
To: Wolfgang Grandegegr <wg@grandegger.com>
In-Reply-To: <1237281143-8768-1-git-send-email-wg@grandegger.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v930.3)
Subject: Re: [PATCH 0/4] NAND: Multi-chip support for FSL-UPM for TQM8548
	modules
Date: Tue, 17 Mar 2009 08:56:44 -0500
References: <1237281143-8768-1-git-send-email-wg@grandegger.com>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mar 17, 2009, at 4:12 AM, Wolfgang Grandegegr wrote:

> The following patch series adds generic support for multi-chip NAND  
> devices
> to the FSL-UPM driver and support for the Micron MT29F8G08FAB NAND  
> flash
> memory on the TQM8548 modules:
>
> [PATCH 1/4] NAND: FSL-UPM: add multi chip support
> [PATCH 2/4] NAND: FSL-UPM: add support for selecting chips via MAR
> [PATCH 3/4] NAND: FSL-UPM: Add wait flags to support board/chip  
> specific delays
> [PATCH 4/4] powerpc/85xx: TQM8548: Update DTS file for multi-chip  
> support
>
> Wolfgang.

You need to update:

Documentation/powerpc/dts-bindings/fsl/upm-nand.txt

I see some new properties defined in this code and not documented ;)

- k
