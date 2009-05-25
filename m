Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8Xku-0002Xl-JM
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 10:50:15 +0000
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KK70076Y4R4IM@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 25 May 2009 19:49:52 +0900 (KST)
Received: from apgmoorthy ([107.108.214.61])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KK7009JO4R292@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 25 May 2009 19:49:52 +0900 (KST)
Date: Mon, 25 May 2009 16:22:24 +0530
From: apgmoorthy <moorthy.apg@samsung.com>
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
To: dedekind@infradead.org
Message-id: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
MIME-version: 1.0
Content-type: text/plain; charset=koi8-r
Content-transfer-encoding: 7BIT
Cc: vishak.g@samsung.com, amul.saha@samsung.com, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem , 

On Sat May 23 05:35:19 EDT 2009 dedekind@infradead.org wrote :

>I get the following warning when compile this:

>drivers/mtd/onenand/onenand_base.c:3263: warning: 'flexonenand_setup'
>defined but not used 

I tried on the MTD Git  and have seen the warning as you mentioned.
'#ifndef MODULE' around the function 'flexonenand_setup' should help to get away with that warning.
We will post a patch.

Against which Fork , the patch should be ? 

With Regards
  Moorthy
