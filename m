Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MEgVK-0006Pk-D4
	for linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 09:23:34 +0000
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KL200HX1I1U8C@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 18:22:42 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KL200MURI1RBP@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 11 Jun 2009 18:22:41 +0900 (KST)
Date: Thu, 11 Jun 2009 14:52:49 +0530
From: Amul Saha <amul.saha@samsung.com>
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
To: David Woodhouse <dwmw2@infradead.org>, dedekind@infradead.org
Message-id: <2D1A54AFA40441938BF021BAAEFAD13A@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243432517.11172.32.camel@localhost.localdomain>
	<1244554687.4538.16.camel@macbook.infradead.org>
Cc: kyungmin.park@samsung.com, vishak.g@samsung.com,
	linux-mtd@lists.infradead.org,
	apgmoorthy <moorthy.apg@samsung.com>, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>2009/6/9 David Woodhouse <dwmw2@infradead.org>:
>> On Wed, 2009-05-27 at 16:55 +0300, Artem Bityutskiy wrote:
>>
>> Does this mean that if I build OneNAND as a module I have no
>> possibility to define FlexOneNAND boundary?
>>
>> Sorry if I missed the discussion, but why you cannot use something
>> like 'module_param_array()' ?

We have made use of module_param for getting the parameters for Boundary
Setting.

>
> That certainly seems like it would be the best answer.

Yes, we too see that.

> Can we have a patch to do that please?

Sending the Patch, for supporting Flex-OneNAND as a module, taking Boundary setting parameters.

Regards,
Amul Kumar Saha
