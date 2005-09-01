Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EAlwn-0000P9-Vq
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 06:05:36 -0400
Received: from ep_mmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IM4004NBUMGM8@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 19:03:52 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPA id <0IM4002SXUMFJ8@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 01 Sep 2005 19:03:52 +0900 (KST)
Date: Thu, 01 Sep 2005 19:03:52 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
In-reply-to: <4316CA53.7070201@gmail.com>
To: 'Bernhard Priewasser' <priewasser@gmail.com>
Message-id: <0IM4002SYUMFJ8@mmp2.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
Subject: RE: [PATCH] OneNAND: Simple Bad Block handling support
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

> 
> please let me bother you with another question.
> It's about scanning for bad blocks during reading/writing 
> flash (/* TODO 
> handling oob */...)

'TODO handling oob' is for YAFFS filesystem
In JFFS2, they only use erase mark at oob area
But YAFFS use some many files, 
We needs to test YAFFS. currently not yet run and tested.

> What's the possibility of having a bad block at r/w?
 OneNAND spec isn't 
> very extensive regarding handling bad blocks beside the initial scan. 

> Which things must/should be done by the flash driver, which 
> ones by the 
> file system in this case?

I don't know the exactly but I heard that JFFS2 handles runtime badblock
internally. 
So OneNAND MTD don't care badblock handling in read/write function. 
MTD only care the initial bad block at erase operation.

> I would be very grateful if you could give me a brief outline, I'm 
> afraid BBM is a bit "too new" for us because we are used to 
> operate on 
> plain NOR... :-)

In our commercial software, we use another bad block handling, known as Bad
Block Management (BBM) based on replace instead of skip as BBT
So we don't care the intial bad and runtime bad. 

Now we are trying to implement our scheme and will be released at open
source. But not yet available in this time.

If do you have any question. please let me know :)

Regards.

Kyungmin Park
