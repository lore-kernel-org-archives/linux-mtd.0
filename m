Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJMJT-00049J-GS
	for linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 06:50:51 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KLQ004E7DO4X9@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 15:50:29 +0900 (KST)
Received: from apgmoorthy ([107.108.214.61])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KLQ0005DDO1SU@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 15:50:28 +0900 (KST)
Date: Wed, 24 Jun 2009 12:20:51 +0530
From: apgmoorthy <moorthy.apg@samsung.com>
Subject: RE: MLC Support in JFFS2
In-reply-to: <1245763177.25547.2350.camel@macbook.infradead.org>
To: 'David Woodhouse' <dwmw2@infradead.org>
Message-id: <2209425595F44A51856A01EBC7DD2E06@sisodomain.com>
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
	<AECB2B7C3BFE41EF9C53455593C2372C@sisodomain.com>
	<1245763177.25547.2350.camel@macbook.infradead.org>
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

 
On Tuesday, June 23, 2009 6:50 PM David Woodhouse wrote:
 
> Your mail program is behaving very strangely -- your quotes are quite
> hard to read. Is there any chance you could use a better one? 

- Earlier Mailer had some issues , Now using a different one.
   
> So instead of erasing blocks without cleanmarker _immediately_ on
> startup, we just put them on a 'to be erased' list. Whenever the
> empty_list is getting short of blocks, we erase another block from the
> 'to be erased' list and move it to the empty list.
> 
> It does mean that if you keep rebooting over and over again, you're
> probably going to increase your erase count. But with a long-lived
> system, it's likely to be more efficient than the large cleanmarker?
> 
> What do you think?
> 

- Yes , the solution looks a better tradeoff.
  Will work in that direction and get a pacth.
  Later we can look into a way to optimize erase count. 

With Regards
 Moorthy
