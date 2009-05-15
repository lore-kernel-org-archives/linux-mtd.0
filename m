Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M4zWE-0002ix-MQ
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 15:40:25 +0000
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
From: Artem Bityutskiy <dedekind@infradead.org>
To: akpm@linux-foundation.org
In-Reply-To: <200905122106.n4CL6DYn009450@imap1.linux-foundation.org>
References: <200905122106.n4CL6DYn009450@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 May 2009 18:39:51 +0300
Message-Id: <1242401991.27996.263.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: h.rohit@samsung.com, linux-mtd@lists.infradead.org,
	kyungmin.park@samsung.com, dwmw2@infradead.org, vishak.g@samsung.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-05-12 at 13:46 -0700, akpm@linux-foundation.org wrote:
> From: Rohit Hagargundgi <h.rohit@samsung.com>
> 
> Add support for Samsung Flex-OneNAND devices.
> 
> Flex-OneNAND combines SLC and MLC technologies into a single device. 
> SLC area provides increased reliability and speed, suitable for storing
> code such as bootloader, kernel and root file system.  MLC area
> provides high density and is suitable for storing user data.
> 
> SLC and MLC regions can be configured through kernel parameter.
> 
> [akpm@linux-foundation.org: export flexoand_region and onenand_addr]
> Signed-off-by: Rohit Hagargundgi <h.rohit@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Vishak G <vishak.g@samsung.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---

Hi Andrew,

you sent this bunch of patches to MTD ML. What does it mean?
Does it mean you are going to send them to Linus some time
later? Or you want review, or acks?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
