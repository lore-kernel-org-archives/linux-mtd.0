Received: from mailout5.samsung.com ([203.254.224.35])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nwubb-0001PE-4g
	for linux-mtd@lists.infradead.org; Wed, 31 Mar 2010 09:53:00 +0000
Received: from epmmp1 (mailout5.samsung.com [203.254.224.35])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0L0500M0T4S5P5@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 31 Mar 2010 18:52:53 +0900 (KST)
Received: from amulsaha ([107.108.214.58])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L05003924S23C@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 31 Mar 2010 18:52:52 +0900 (KST)
Date: Wed, 31 Mar 2010 15:23:07 +0530
From: Amul Kumar Saha <amul.saha@samsung.com>
Subject: Re: MLC Support in JFFS2
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	dedekind@infradead.org
Message-id: <E19B9A1D84D0455981E564D51B3C641F@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<1243432517.11172.32.camel@localhost.localdomain>
	<1244554687.4538.16.camel@macbook.infradead.org>
	<9061742E1E7840C6B7016A210EF848AB@sisodomain.com>
	<1244712906.5847.414.camel@localhost.localdomain>
	<2AF67696C6634054B7CFDF7A9C19865D@sisodomain.com>
	<1244803363.5847.446.camel@localhost.localdomain>
	<3E83C7DF574149B78FFE8D12094FAF6D@sisodomain.com>
	<1244808209.5847.447.camel@localhost.localdomain>
	<5156D5DBD34A4A5984AE3F3840C0452F@sisodomain.com>
	<1244813557.3511.1272.camel@macbook.infradead.org>
	<42F6638D897B4BA7B729CBC244D9F6E4@sisodomain.com>
	<1245698113.25547.229.camel@macbook.infradead.org>
Cc: 'Amit Kumar Sharma' <amitsharma.9@samsung.com>, kyungmin.park@samsung.com,
	raghav.gupta@samsung.com, apgmoorthy <moorthy.apg@samsung.com>,
	v.dalal@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

We have come up with an alternate solution to support MLC devices on JFFS2.

>>
>> Currenlty , Is there a way to use JFFS2 with MLC Memories ( NOP == 1 )?
>>
>> If not , Felt that any one of the following patch can be of use
>>
>> 1. http://lists.infradead.org/pipermail/linux-mtd/2007-December/020047.html
>>           - Which removes the Clean Marker.
>
> There was a reason for the cleanmarker -- it saved us from using
> partly-erased blocks for data. Do you have some other way to guarantee
> that this won't happen?
>
> (Sorry, I think we may have had this discussion before, but I've
> forgotten the conclusion, if there was one. It was academic at the time,
> since we didn't have any solution for the paired-page insanity anyway. I
> was mostly just burying my head in the sand and hoping this stupid 'MLC'
> crap would go away.)

New approach:-

We will have something known as the TOKEN_BLOCK.

TOKEN_BLOCK: A block used to store all the ready_to_use blocks related info.

ready_to_use blocks: These are blocks which are erased and ready to use,
 but don't have a usual CLEANMARKER on them. To save NOP for
 the 1st page of each block.

How it works:
1. Ask GC to provide a block, and use it as TOKEN_BLOCK on need basis.
2. In the provided block, we store all ready_to_use block info.
3. On remount; this info needs to be retreived.
    So, we shall make use of MAGIC_NUMBER signifying TOKEN_BLOCK,
    to identify the block containing the info.

Scan has to be modified, to identify the TOKEN_BLOCK and act accordingly.

Handling TOKEN_BLOCK
1. Make request for a block to be used as TOKEN_BLOCK.
2. List all the ready_to_use block info on the TOKEN_BLOCK contiguously.
3. Write the TOKEN_BLOCK's MAGIC_NUMBER in the OOB Area alongwith the
 ready_to_use info, in the Main Area.
4. On next update, ask GC to provide a fresh block.
5. Update this block accordingly as TOKEN_BLOCK.
6. Discard the previous TOKEN_BLOCK, and put it on dirty_list.

Let me know, about the feasibility of this design from your perspective.

This is just a base plan, and obvisouly there are a lot of things that have to be looked
into, before getting into the real imlpementation.

Regards,
Amul Kumar Saha
