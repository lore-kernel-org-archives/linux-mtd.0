Received: from mailout2.samsung.com ([203.254.224.25])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GDCns-0000s0-Ms
	for linux-mtd@lists.infradead.org; Wed, 16 Aug 2006 05:14:53 +0100
Received: from ep_mmp2 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0J4200EC9P43WP@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 16 Aug 2006 13:14:27 +0900 (KST)
Received: from sharmaami ([12.52.146.61])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 HotFix 1.17 (built
	Jun 23 2003)) with ESMTPSA id <0J4200M0FP41DV@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 16 Aug 2006 13:14:26 +0900 (KST)
Date: Wed, 16 Aug 2006 13:14:43 +0900
From: Amit Kumar Sharma <sharma.amit@samsung.com>
Subject: RE: JFFS2 problem(amit Kumar sharma)
In-reply-to: <44DAFD33.4060104@yandex.ru>
To: "'Artem B. Bityutskiy'" <dedekind@yandex.ru>
Message-id: <003101c6c0ea$80b147e0$3d92340c@dsn.sec.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem 

I have one problem related to JFFS2 partition ,My partition size is  20MB
but I am able to copy more then 20 MB in this partition and strange is after
rebooting file exist with out any problem ,Can u tell me ,how JFFS2 maintain
partition size information during copy or file write command.In which area I
must check in JFFS2 or mtd.


Thanks
Amit

-----Original Message-----
From: Artem B. Bityutskiy [mailto:dedekind@yandex.ru] 
Sent: Thursday, August 10, 2006 6:33 PM
To: Amit Kumar Sharma
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 problem

Hello Amit,

Amit Kumar Sharma wrote:
> I am looking for JFFS2 stable version for kernel 2.4, Can u help me
because
> I am facing strange problem. My device size is 187M and JFFS2 creating 2G
> file on my device. But when I checked same device partition on 2.6 kernel
it
> also show file size 2G "it can not be possible because MTD partition is
187M
> " SO I run same test program on 2.6 kernel. it stops after creating 187M
> file size. SO I wonder may it is a problem of JFFS2 version I am using
with
> mvl 2.4.20 kernel.

I'd suggest you to contact MV instead. MTD community is mostly not 
interested in 2.4, so you probably won't get any help here.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
