Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16282W-0004jr-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Nov 2001 09:33:32 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200111090817.fA98Hxt11516@hofr.at> 
References: <200111090817.fA98Hxt11516@hofr.at> 
To: Der Herr Hofrat <der.herr@hofr.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: TC58FVT160 question 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 09 Nov 2001 09:42:42 +0000
Message-ID: <7189.1005298962@redhat.com>
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


der.herr@hofr.at said:
> 
>  as I can find the TC58FVT160 chip (a 2MB - 16*1024 chip) in
> amd_flash.c cfi_jedec.c and jedec_probe.c I'm kind of confused at
> what driver I actually should be configuring for this chip. 

Er, cfi_jedec.c doesn't actually exist any more. I assume you mean jedec.c?
You should be using the new jedec_probe.c

CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=n
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_OBSOLETE_CHIPS=n (which stops it from asking you about 
the CONFIG_MTD_AMDSTD and CONFIG_MTD_JEDEC options).



--
dwmw2
