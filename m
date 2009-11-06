Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N6Mnm-00040B-IX
	for linux-mtd@lists.infradead.org; Fri, 06 Nov 2009 11:16:26 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KSO00BLDPZ5OD@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 06 Nov 2009 20:16:17 +0900 (KST)
Received: from Sarathbabu ([107.108.214.67])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KSO00IOQPZ2F6@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 06 Nov 2009 20:16:17 +0900 (KST)
Date: Fri, 06 Nov 2009 16:43:10 +0530
From: Tadimarri Sarath Babu <sarath.babu@samsung.com>
Subject: Re: can UBIFS be NFS exported
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>, linux-mtd@lists.infradead.org
Message-id: <3C2FAC88009448298C46A613D8C066FE@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <4AF2DE80.5010808@aimvalley.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


----- Original Message ----- 
From: "Norbert van Bolhuis" <nvbolhuis@aimvalley.nl>
To: <linux-mtd@lists.infradead.org>
Sent: Thursday, November 05, 2009 7:47 PM
Subject: can UBIFS be NFS exported


>
> just to make sure. UBIFS can not be NFS exported, is this correct ?
   Can you clarify on this ? I am able to use NFS as rootfs and mount ubifs over the OneNAND .
> (I need NFS in our distributed system. The server uses UBIFS.
>  But there is a ISO9660 image on our UBIFS and fortunately
>  ISO(Z)FS can be NFS exported, so it's not a problem)
>
>
>
Regards,
Sarath.
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/ 
