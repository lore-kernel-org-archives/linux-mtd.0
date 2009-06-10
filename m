Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MEIWQ-00026W-Lg
	for linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 07:47:05 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KL000KP7IY0DL@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 16:46:49 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KL000AOJIXY84@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 16:46:48 +0900 (KST)
Date: Wed, 10 Jun 2009 13:16:55 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
To: David Woodhouse <dwmw2@infradead.org>, dedekind@infradead.org
Message-id: <CDB766040F7D4E5A91CE4E2E2036CFF4@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243432517.11172.32.camel@localhost.localdomain>
	<1244554687.4538.16.camel@macbook.infradead.org>
Cc: vishak.g@samsung.com, apgmoorthy <moorthy.apg@samsung.com>,
	amul.saha@samsung.com, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David & Artem,

We will take care comments.

Thanks
Amit


----- Original Message ----- 
From: "David Woodhouse" <dwmw2@infradead.org>
To: <dedekind@infradead.org>
Cc: <vishak.g@samsung.com>; "apgmoorthy" 
<moorthy.apg@samsung.com>; <amul.saha@samsung.com>; 
<kyungmin.park@samsung.com>; 
<linux-mtd@lists.infradead.org>; <akpm@linux-foundation.org>
Sent: Tuesday, June 09, 2009 7:08 PM
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support


> On Wed, 2009-05-27 at 16:55 +0300, Artem Bityutskiy wrote:
>> On Mon, 2009-05-25 at 16:22 +0530, apgmoorthy wrote:
>> > I tried on the MTD Git  and have seen the warning as 
>> > you mentioned.
>> > '#ifndef MODULE' around the function 
>> > 'flexonenand_setup' should help
>> > to get away with that warning.
>> > We will post a patch.
>>
>> Does this mean that if I build OneNAND as a module I have 
>> no
>> possibility to define FlexOneNAND boundary?
>>
>> Sorry if I missed the discussion, but why you cannot use 
>> something
>> like 'module_param_array()' ?
>
> That certainly seems like it would be the best answer.
> Can we have a patch to do that please?
>
> -- 
> David Woodhouse                            Open Source 
> Technology Centre
> David.Woodhouse@intel.com 
> Intel Corporation
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 
