Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Ilcd-0003e8-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 08:35:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001c01c2134d$6811ed10$8ea8a8a8@yuanfei> 
References: <001c01c2134d$6811ed10$8ea8a8a8@yuanfei> 
To: "Sleepy" <sleepygod@sina.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD 16M Flash module detection error? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Jun 2002 08:35:46 +0100
Message-ID: <17698.1024040146@redhat.com>
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

sleepygod@sina.com said:
> I have a flash module come with Linkup7205SDB, which got total 8
> AM29LV160DT chips on it. We use it in 32bit mode 4way interleave. But
> some how I only can detect the first 8M, the kernel give me the
> following messages:

> Physmap flash device: 1000000 at 80000000

> Physically mapped flash: Found 4 x16 devices at 0x0 in 32-bit mode A

OK... can you try configuring the Physmap device to probe only for the 
_second_ set of flash chips -- are they at 0x80800000?

If it finds them there, we need to add some debugging code and work out why 
it's not doing so after finding the first set.

--
dwmw2
