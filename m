Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zIcF-0006SG-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 May 2001 14:42:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <DAV46AyfxRydC3hSsxL000018db@hotmail.com> 
References: <DAV46AyfxRydC3hSsxL000018db@hotmail.com> 
To: "zydla son" <zydlason@hotmail.com>
Cc: "PPC-embedded" <linuxppc-embedded@lists.linuxppc.org>,
    "MTD" <linux-mtd@lists.infradead.org>
Subject: Re: kernel can not detect flash device. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 14 May 2001 14:46:30 +0100
Message-ID: <22540.989847990@redhat.com>
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

zydlason@hotmail.com said:
>   My target platform is ForcePowerCore 6750 which has four
> userflash(AM29F016) and I choose the relative options according to the
> "Linux MTD, JFFS HOWTO",but kernel can not detect flash device.

> Physically mapped flash: Found no CFI device at location zero

Is the AM29F016 actually CFI-compliant? Try the amd_flash driver. You'll 
probably have to hack the physmap.c code to invoke that probe instead of 
the cfi probe.

--
dwmw2
