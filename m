Received: from rs35.luxsci.com ([66.216.127.90])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KC4LB-00056t-UV
	for linux-mtd@lists.infradead.org; Fri, 27 Jun 2008 03:09:38 +0000
Message-ID: <486459EC.7030004@firmworks.com>
Date: Thu, 26 Jun 2008 17:09:32 -1000
From: Mitch Bradley <wmb@firmworks.com>
MIME-Version: 1.0
To: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Support NAND partitions >4GiB with Open Firmware
References: <48642B50.9060607@firmworks.com>
In-Reply-To: <48642B50.9060607@firmworks.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A revised version of the patch, addressing some points that Segher
identified, will be issued soon.

So if you want to review the patch as submitted, please be aware that
some stylistic things have already been fixed (u64 instead of u_int64_t
etc, use of of_read_number(), removal of fallback code for broken
device trees).  The info in Documentation/powerpc/booting-without-of.txt
will also be amended.

The overall scheme - using #address-cells and #size-cells to permit 64-bit
offset and sizes - remains unchanged.
