Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1610V6-0007UP-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 07:18:24 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <2178200CCE4ED311974300A0CC4263FB143605@accounting> 
References: <2178200CCE4ED311974300A0CC4263FB143605@accounting> 
To: jglennon@getntds.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: Need help understanding cfi_probe and cfi_cmdset_0002 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Nov 2001 07:27:44 +0000
Message-ID: <15375.1005031664@redhat.com>
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

jglennon@getntds.com said:
> target board:   Motorola MVME5100, CPU=MPC750
>                 FLASH = 4x AMD29D323D, is CFI.

Are you 100% sure these are arranged as 4 8-bit devices side-by-side on the 
32-bit bus? It's more common in my experience to have 2 devices together in 
16-bit mode, and to have two such pairs consecutively mapped in the address 
space if there are four chips.

Turn off CONFIG_MTD_CFI_ADV_OPTIONS and let it try all the probes.

--
dwmw2
