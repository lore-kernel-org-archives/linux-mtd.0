Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ACBL-0006Ir-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 17:08:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <EFEAIMDCOOOHIEPHDNFJKELGDPAA.stefan.roese@esd-electronics.com> 
References: <EFEAIMDCOOOHIEPHDNFJKELGDPAA.stefan.roese@esd-electronics.com> 
To: "Stefan Roese" <stefan.roese@esd-electronics.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: SST Flash Support (SST39VF160) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 21 May 2002 17:08:13 +0100
Message-ID: <17271.1021997293@redhat.com>
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

stefan.roese@esd-electronics.com said:
> physmap flash device: 200000 at ffc00000 CFI: Found no Physically
> mapped flash device at location zero

Weird. That chip is definitely supposed to do CFI. 
http://www.ssti.com/products/pdf/399-39LF-VF160-02.000-DS.pdf

Sure it's wired up the same and your configured buswidth is right?

stefan.roese@esd-electronics.com said:
> On the amd flash board I get the following debug messages: 
> kmod: failed to exec /sbin/modprobe -s -k cfi_cmdset_0002, errno = 2
> Support for command set 0002 not present
> cfi_probe: No supported Vendor Command Set found

CONFIG_CFI_AMDSTD=y

--
dwmw2
