Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0ZFT-0001k2-Ea
	for linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 11:21:04 +0000
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KRV00EHM3IV1J@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 20:20:55 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KRV009MX3ITUB@mmp2.samsung.com> for
	linux-mtd@lists.infradead.org; Wed, 21 Oct 2009 20:20:55 +0900 (KST)
Date: Wed, 21 Oct 2009 16:50:59 +0530
From: Amul Kumar Saha <amul.saha@samsung.com>
Subject: Re: [PATCH] [OneNAND] OTP support re-implementation 1/1
To: Adrian Hunter <adrian.hunter@nokia.com>, dedekind1@gmail.com
Message-id: <F1A2DF54F9F549B29F1A72240FB6CED8@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <7C266C6722224724BF9456BA7986FC05@sisodomain.com>
	<1256028984.29856.144.camel@localhost> <4ADDC5A3.50607@nokia.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Kyungmin Park <kmpark@infradead.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian,


> Artem Bityutskiy wrote:
>> I'm still waiting for Adrian to review this. Yesterday he said he will
>> do this soon. In any case, I remember about this patch, just FYI.
>
> Seems fine except why aren't
> onenand_otp_command()
> onenand_otp_write_oob_nolock()
> inside an
> #ifdef CONFIG_MTD_ONENAND_OTP
> ...
> #endif

Accepted and Corrected.

Regards,
Amul Kumar Saha 
