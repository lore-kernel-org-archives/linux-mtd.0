Received: from rs35.luxsci.com ([66.216.127.90])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K8OgS-000132-9d
	for linux-mtd@lists.infradead.org; Tue, 17 Jun 2008 00:04:24 +0000
Received: from [10.20.0.14] (user-10cm74m.cable.mindspring.com [64.203.28.150])
	(authenticated bits=0)
	by rs35.luxsci.com (8.13.1/8.13.7) with ESMTP id m5H04KXQ007038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jun 2008 19:04:22 -0500
Message-ID: <4856FF76.9000302@firmworks.com>
Date: Mon, 16 Jun 2008 14:04:06 -1000
From: Mitch Bradley <wmb@firmworks.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: mtd partitions limited to 4 GB?
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

In drivers/mtd/mtdpart.c, struct mtd_part has  "u_int32_t offset", thus 
(apparently) limiting the partition start offset to 4 GiB.  Similarly, 
struct mtd_partition in include/linux/mtd/partititions.h has "u_int32_t 
size" and "u_int32_offset".

Now that NAND FLASH device sizes have exceeded that, this appears to be 
a significant limitation.

Is anyone in the mtd community already addressing this?

Fixing the core infrastructure might be as simple as using "loff_t" 
instead of "u_int32_t" for those fields.  However, all of the existing 
partition map parsers appear to have the same 32-bit limitation, so 
partitioning a >4GiB device will require a new or modified partition map 
format.
