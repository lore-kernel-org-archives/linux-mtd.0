Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9Jbi-0002Ze-Fo
	for linux-mtd@lists.infradead.org; Wed, 27 May 2009 13:55:57 +0000
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
From: Artem Bityutskiy <dedekind@infradead.org>
To: apgmoorthy <moorthy.apg@samsung.com>
In-Reply-To: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 27 May 2009 16:55:17 +0300
Message-Id: <1243432517.11172.32.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: vishak.g@samsung.com, amul.saha@samsung.com, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-05-25 at 16:22 +0530, apgmoorthy wrote:
> Hi Artem , 
> 
> On Sat May 23 05:35:19 EDT 2009 dedekind@infradead.org wrote :
> 
> >I get the following warning when compile this:
> 
> >drivers/mtd/onenand/onenand_base.c:3263: warning: 'flexonenand_setup'
> >defined but not used 
> 
> I tried on the MTD Git  and have seen the warning as you mentioned.
> '#ifndef MODULE' around the function 'flexonenand_setup' should help to get away with that warning.
> We will post a patch.

Does this mean that if I build OneNAND as a module I have no
possibility to define FlexOneNAND boundary?

Sorry if I missed the discussion, but why you cannot use something
like 'module_param_array()' ?
-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
