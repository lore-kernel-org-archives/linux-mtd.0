Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rawX-0003tP-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2001 09:11:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0110111005170.26498-100000@lxserver.deltes.cz> 
References: <Pine.LNX.4.21.0110111005170.26498-100000@lxserver.deltes.cz> 
To: martin.kula@deltaes.cz
Cc: linux-mtd@lists.infradead.org
Subject: Re: Identification flash on board ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 11 Oct 2001 09:20:57 +0100
Message-ID: <32351.1002788457@redhat.com>
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

martin.kula@deltaes.cz said:
> Can anybody explain me next lines from dmesg ?

> DiskOnChip 2000 found at address 0xE8000
> Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
> Flash chip at floor 1, chip 0 is different:
> Unknown flash chip found: F9 F9

Is this an 8MiB DiskOnChip, or do you actually expect the extra chips to be 
there?

--
dwmw2
