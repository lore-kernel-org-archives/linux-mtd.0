Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NykCR-0004vm-9d
	for linux-mtd@lists.infradead.org; Mon, 05 Apr 2010 11:10:36 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0L0E00FL6HPIWZ@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 05 Apr 2010 20:10:30 +0900 (KST)
Received: from amulsaha ([107.108.214.58])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L0E004LRHPFQ1@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 05 Apr 2010 20:10:29 +0900 (KST)
Date: Mon, 05 Apr 2010 16:40:49 +0530
From: Amul Kumar Saha <amul.saha@samsung.com>
Subject: Re: MLC Support in JFFS2
To: massimo cirillo <maxcir@gmail.com>
Message-id: <04513CE719AF46EDACC26900E39ED2F2@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
	<2AF67696C6634054B7CFDF7A9C19865D@sisodomain.com>
	<1244803363.5847.446.camel@localhost.localdomain>
	<3E83C7DF574149B78FFE8D12094FAF6D@sisodomain.com>
	<1244808209.5847.447.camel@localhost.localdomain>
	<5156D5DBD34A4A5984AE3F3840C0452F@sisodomain.com>
	<1244813557.3511.1272.camel@macbook.infradead.org>
	<42F6638D897B4BA7B729CBC244D9F6E4@sisodomain.com>
	<1245698113.25547.229.camel@macbook.infradead.org>
	<E19B9A1D84D0455981E564D51B3C641F@sisodomain.com>
	<p2r62cbdcd91003310607g3507fb29gd8ecddf3d3a3dfaa@mail.gmail.com>
Cc: Amit Kumar Sharma <amitsharma.9@samsung.com>, dedekind@infradead.org,
	kyungmin.park@samsung.com, apgmoorthy <moorthy.apg@samsung.com>,
	linux-mtd@lists.infradead.org, raghav.gupta@samsung.com,
	v.dalal@samsung.com, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>> 3. Write the TOKEN_BLOCK's MAGIC_NUMBER in the OOB Area alongwith the
>>  ready_to_use info, in the Main Area.
> I think you should protect each ready_to_use block info in the TOKEN_BLOCK
> with a CRC - as it was a node of JFFS2 - against power loss corruption.
>

Sure, I'll take that into account.

>> 4. On next update, ask GC to provide a fresh block.
> What do you mean ? Each time a block is erased do you
> update the TOKEN_BLOCK by using a new one ?
>

No.
That would be done only during a proper unmount or idle time.
As this block just contains ready_to_use block info,
that can be reconstructed, on remount.
Because any updation on fixed intervals will not be of use.
Neither will it be feasbale to update the TOKEN_BLOCK on every erase.
Please do comment.

Regards,
Amul 
