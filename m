Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MtJV1-00085v-Rv
	for linux-mtd@lists.infradead.org; Thu, 01 Oct 2009 11:07:08 +0000
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KQU00A3J1JOUH@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 01 Oct 2009 20:07:00 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KQU00A5X1JML6@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 01 Oct 2009 20:07:00 +0900 (KST)
Date: Thu, 01 Oct 2009 16:38:06 +0530
From: Amul Kumar Saha <amul.saha@samsung.com>
Subject: Re: [PATCH] [OneNAND] Standardising prints in onenand_base.c
To: dedekind1@gmail.com
Message-id: <F890C3D467A3465090BA4473AF6EC789@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <C45F9E809A3C4FB0A470336A43DCCB74@sisodomain.com>
	<1254384027.32310.18.camel@localhost>
Cc: David Woodhouse <dwmw2@infradead.org>, Kyungmin Park <kmpark@infradead.org>,
	linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

>
> Could you please first send the patch to yourself, then save it, and
> try to apply. And when this works, send it to me.
>
> This one does not apply either for the same reasons.
>

I have taken care of all the prints but one.
onenand_base.c: 2160
DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start = 0x%012llx, len = %llu\n", (unsigned long long) instr->addr, (unsigned long long) 
instr->len);

Reason: This one is 149 characters long and the patch couldn't be sent, through the mailer.
I am avoiding this one. I hope it's OK.

Regards,
Amul 
