Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJ5UK-0001wI-H4
	for linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 12:52:45 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KLO0012GZQ5N0@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 21:51:41 +0900 (KST)
Received: from apgmoorthy ([107.108.214.61])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KLO00A5ZZQ2AJ@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 23 Jun 2009 21:51:41 +0900 (KST)
Date: Tue, 23 Jun 2009 18:22:03 +0530
From: apgmoorthy <moorthy.apg@samsung.com>
Subject: RE: MLC Support in JFFS2
In-reply-to: <1245698113.25547.229.camel@macbook.infradead.org>
To: 'David Woodhouse' <dwmw2@infradead.org>
Message-id: <AECB2B7C3BFE41EF9C53455593C2372C@sisodomain.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
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
Cc: 'Amit Kumar Sharma' <amitsharma.9@samsung.com>, vishak.g@samsung.com,
	'Amul Saha' <amul.saha@samsung.com>, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,  

On Tuesday, June 23, 2009 12:45 AM David Woodhouse wrote :
 
>> If not , Felt that any one of the following patch can be of use
>> 
>> 1. http://lists.infradead.org/pipermail/linux-mtd/2007-December/020047.html
>>           - Which removes the Clean Marker.

>There was a reason for the cleanmarker -- it saved us from using partly-erased blocks for data. Do you have some other way to
guarantee that this won't 
>happen?
- How about the second One (Refer Below Links), which leaves 1page/block for Cleanmarker.
   http://lists.infradead.org/pipermail/linux-mtd/2008-September/023101.html
   http://lists.infradead.org/pipermail/linux-mtd/2008-September/023044.html 
  
>(Sorry, I think we may have had this discussion before, but I've forgotten the conclusion, if there was one. It was academic at the
time, since we didn't >have any solution for the paired-page insanity anyway. 
- Right , I dont see any detailed discussion on this regard in the list.
  

With Regards
 Moorthy
