Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15lzAv-0005KV-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Sep 2001 21:51:29 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010925134029.A22314@recycle.lbl.gov> 
References: <20010925134029.A22314@recycle.lbl.gov> 
To: Larry Doolittle <ldoolitt@recycle.lbl.gov>
Cc: linux-mtd@lists.infradead.org
Subject: Re: problems with 28F320B still 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Sep 2001 22:00:31 +0100
Message-ID: <24339.1001451631@redhat.com>
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

ldoolitt@recycle.lbl.gov said:
> boards with an Intel 28F320B3 (non-CFI-compliant) chip on it. 
> With DEBUG_CFI set in drivers/mtd/chips/cfi_probe.c, a
> linux-2.4.9-ac9-rmk1-np1 boot log shows: 

It's not a CFI chip. Why is cfi_probe claiming to recognise it? The CFI 
structure you quoted is obviously wrong. 

>  Erase Region #0: BlockSize 0xFFFF00 bytes, 65536 blocks
>  Erase Region #1: BlockSize 0xFFFF00 bytes, 65536 blocks
> Device size: 0x0 bytes (0 MiB)


--
dwmw2
