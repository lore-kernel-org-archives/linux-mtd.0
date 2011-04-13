Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9rJx-0007Hj-3q
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 04:04:49 +0000
Received: by ewy3 with SMTP id 3so67523ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Apr 2011 21:04:47 -0700 (PDT)
Subject: Re: [PATCH v3] mtd: onenand: add ecclayout and subpage_sft for
	none-flex 4kb page onenand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
In-Reply-To: <1302515521-27400-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1302515521-27400-1-git-send-email-roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 13 Apr 2011 07:04:44 +0300
Message-ID: <1302667484.14691.11.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kyungmin.park@samsung.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-11 at 12:52 +0300, Roman Tereshonkov wrote:
> So as the ecclayout and suppage size for 4kb page
> Flex- and none-Flex OneNAND are different
> the new values for none-Flex 4kb page OneNAND memory are added.
> 
> The introduced ecclayout and suppage size are based on specification
> 4Gb M-die OneNAND Flash (KFM4G16Q4M, KFN8G16Q4M). Rev. 1.3, Apr. 2010
> For eccpos we expose only 64 bytes out of 72, for oobfree the spare area
> fields marked as "Managed by internal ECC logic for Logical Sector Number area"
> are used.
> 
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> ---
>  drivers/mtd/onenand/onenand_base.c |   46 +++++++++++++++++++++++++++++++----
>  1 files changed, 40 insertions(+), 6 deletions(-)

Updated l2-mtd-2.6.git with this patch, thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
