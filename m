Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MIjeJ-00010P-3k
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 13:33:33 +0000
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KLN00GK36ZOSN@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 22:33:24 +0900 (KST)
Received: from apgmoorthy ([107.108.214.61])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KLN003R36ZMXE@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 22:33:24 +0900 (KST)
Date: Mon, 22 Jun 2009 19:03:46 +0530
From: apgmoorthy <moorthy.apg@samsung.com>
Subject: RE: MLC Support in JFFS2
In-reply-to: <4A3F3718.1070102@gmail.com>
To: 'Artem Bityutskiy' <dedekind1@gmail.com>
Message-id: <AC2E6612F7284933840F22ED22E239CE@sisodomain.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 7BIT
References: <1C48A8694DD447A0A922790E587F7D5F@sisodomain.com>
	<4A3F3718.1070102@gmail.com>
Cc: 'Amit Kumar Sharma' <amitsharma.9@samsung.com>, vishak.g@samsung.com,
	'Amul Saha' <amul.saha@samsung.com>, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem ,  

On Monday, June 22, 2009 1:18 PM Artem Bityutskiy wrote :
 
>> Currenlty , Is there a way to use JFFS2 with MLC Memories ?
>> 
>> If not , Felt that any one of the following patch can be of use
>> 
>> 1. http://lists.infradead.org/pipermail/linux-mtd/2007-December/020047.html
>>           - Which removes the Clean Marker.
>> 
>> 2. http://lists.infradead.org/pipermail/linux-mtd/2008-September/023101.html
>>    http://lists.infradead.org/pipermail/linux-mtd/2008-September/023044.html 
>>           - Leaving 1page/Block , for Clean Marker.
>> 
>> or some other solution, which solves the standoff.   
>> 
>> Without MLC Support , Flex-OneNAND is unsuable with JFFS2.

>Is JFFS2 usable with Flex-OneNAND by design? I thought it would have to be able to handle paired pages to become MLC-compatible. Does it do that?

Yes it do that .
There are two things in Handling MLCs
1.Paired Page Handling
This is done in Flex-OneNAND Driver.
flexonenand_lsb_page_recovery will handle that in MLC area. 

2.NOP==1
This scenario has to be dealt in synchronization with JFFS2.
This is what i asked about. 
Pathces , in the links(above)are addressing this.

With Regards
 Moorthy
