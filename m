Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15vc0k-0007o0-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Oct 2001 11:08:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0110221043350.13158-100000@dagobert.svc.sysgo.de> 
References: <Pine.LNX.4.21.0110221043350.13158-100000@dagobert.svc.sysgo.de> 
To: Robert Kaiser <rob@sysgo.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD support for Intel E28F016S3 ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 22 Oct 2001 11:17:46 +0100
Message-ID: <28805.1003745866@redhat.com>
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

rob@sysgo.de said:
> I am trying to implement JFFS/MTD support for the SSV DNPC module.
> This module has an Intel E28F016S3 which does not appear to be CFI
> compliant. Which chip driver should I use for this one (is there any)
> ? 

The latest version of the jedec_probe code should support these chips.

CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_CFI_INTELEXT=y



--
dwmw2
