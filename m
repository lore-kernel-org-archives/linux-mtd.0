Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lf5T1-0006eq-NT
	for linux-mtd@lists.infradead.org; Thu, 05 Mar 2009 04:45:58 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KG000FZFNVAH2@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 05 Mar 2009 13:45:10 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KG000N3CNV62O@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 05 Mar 2009 13:45:10 +0900 (KST)
Date: Thu, 05 Mar 2009 10:16:09 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: [PATCH 1/3] [MTD] Flex-OneNAND support
To: Kyungmin Park <kmpark@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Message-id: <D8532CBD8C914BAC87A51AE8D5CE058C@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <20090303063605.GA30258@july>
	<20090303124948.dda294e5.akpm@linux-foundation.org>
	<49AE6907.1080702@nokia.com>
	<20090304085055.c9de6cbb.akpm@linux-foundation.org>
	<9c9fda240903041547x540899f9hd94cbf49baac660b@mail.gmail.com>
	<20090304155544.3bc3f337.akpm@linux-foundation.org>
	<9c9fda240903041943m483db3f4i3c40c6970ef16fce@mail.gmail.com>
Cc: h.rohit@samsung.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kyungmin,
----- Original Message ----- 
From: "Kyungmin Park" <kmpark@infradead.org>
To: "Andrew Morton" <akpm@linux-foundation.org>; "AMIT 
KUMARSHARMA" <amitsharma.9@samsung.com>
Cc: <adrian.hunter@nokia.com>; <h.rohit@samsung.com>; 
<linux-mtd@lists.infradead.org>; 
<linux-kernel@vger.kernel.org>
Sent: Thursday, March 05, 2009 9:13 AM
Subject: Re: [PATCH 1/3] [MTD] Flex-OneNAND support


> Hi,
>
> On Thu, Mar 5, 2009 at 8:55 AM, Andrew Morton 
> <akpm@linux-foundation.org> wrote:
>> On Thu, 5 Mar 2009 08:47:03 +0900
>> Kyungmin Park <kmpark@infradead.org> wrote:
>>
>>> I think we know the issues currently and then if the 
>>> device is opened,
>>> handle this one if required.
>>> How do you think?
>>
>> I think it would be prudent to fix the known problems 
>> now, rather
>> than having to go through and re-debug them later on.
>>
>> Bear in mind that people frequently copy old code when 
>> writing
>> new code, so these things tend to propagate, creating 
>> more work
>> later on.
>>
>
> Agree,
>
> To Amit,
>
> Could you fix it and send a patch please.
> Also can you reduce the left shift operation to resolve it 
> permanently
sure  i will send it ASAP.
>
> Thank you,
> Kyungmin Park 
