Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KkAcL-0002Sf-AP
	for linux-mtd@lists.infradead.org; Mon, 29 Sep 2008 04:44:17 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0K7X002WXX4XJC@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 29 Sep 2008 13:43:45 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0K7X00E7MX4VJJ@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 29 Sep 2008 13:43:45 +0900 (KST)
Date: Mon, 29 Sep 2008 10:16:16 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: fclose in JFFS2 7 YAFFS2 sometimes takes 7 seconds
To: Michael Meriin <meriinm@marvell.com>, linux-mtd@lists.infradead.org
Message-id: <16560409E35D439B99D189E529F45E88@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <E0F29C1343A0404DB4C86E66F5754EE47BE03D9CF9@IL-MB01.marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michael

Can u check during load time , Was garbage collector invoked 
, and if we have tested yaffs2 and Jffs2 both with LTP on 
flexOneNAND but we never face such scenario.

Rgs
Amit

----- Original Message ----- 
From: "Michael Meriin" <meriinm@marvell.com>
To: <linux-mtd@lists.infradead.org>
Sent: Sunday, September 28, 2008 7:13 PM
Subject: fclose in JFFS2 7 YAFFS2 sometimes takes 7 seconds


>
> Hi,
>
> We are running Linux kernel 2.6.25 on ARM.
> In two different platforms we are using almost the same 
> code. But on one platform we are using JFFS2 and on the 
> other platform YAFFS. On both platforms used ONENand 
> Flash.
> In both cases we have some process that periodically, 
> every several seconds, updates some short (300 bytes) 
> file.
> The problem is that several times a day (1-2, in some load 
> conditions even more times) it takes 7 seconds to perform 
> fclose system call.
> What can be the reasons for such behavior? Can it be FS 
> garbage collection?
>
>
> Best Regards,
>              Michael Meriin
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 
