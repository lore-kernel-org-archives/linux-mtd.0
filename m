Received: from mailout5.samsung.com ([203.254.224.35])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MtFRT-00079i-7Z
	for linux-mtd@lists.infradead.org; Thu, 01 Oct 2009 06:47:11 +0000
Received: from epmmp1 (mailout5.samsung.com [203.254.224.35])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KQT00B3PPI7HD@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 01 Oct 2009 15:46:56 +0900 (KST)
Received: from amulsaha ([107.108.214.27])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KQT002S8PI5AP@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 01 Oct 2009 15:46:55 +0900 (KST)
Date: Thu, 01 Oct 2009 12:18:01 +0530
From: Amul Kumar Saha <amul.saha@samsung.com>
Subject: Re: [PATCH] [OneNAND] OTP support re-implementation 1/1
To: dedekind1@gmail.com
Message-id: <64C58EB6B88842909BEC982D4D1D4214@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <EF4202CC14044212993EE17E6010D5E7@sisodomain.com>
	<87D6E94B11734CE1A253D9AE203F4192@sisodomain.com>
	<4A94CF0A.6060106@gmail.com>
	<6098B9D32DCD48C387EF96034FFFC55D@sisodomain.com>
	<1251466736.3514.10.camel@localhost>
	<A32D4C31541C4D8B9BF6CB4D6EF4B5DC@sisodomain.com>
	<9c9fda240908310234h6cef3afev6a3f6e315321631b@mail.gmail.com>
	<C48D93C7DF3C4F9C96E47BE9D6F51F37@sisodomain.com>
	<4A9E0C47.205@gmail.com>
	<8A3568961C4E4E7495A397D2267B6E37@sisodomain.com>
	<1251958245.5060.6.camel@localhost>
	<FC4F021760EA4F649917598723041422@sisodomain.com>
	<1251976743.5060.13.camel@localhost>
	<E902C77C74C544A3A554DD9881742C04@sisodomain.com>
	<1254130728.3778.57.camel@localhost>
Cc: Kyungmin Park <kmpark@infradead.org>, David Woodhouse <dwmw2@infradead.org>,
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

> Could you please refresh your patch and resend it? The old one does not
> apply anymore.
>
> Also, could you please avoid doing these:
>
> printk(KERN_ERR "onenand_write_ops_nolock: \
>       write failed %d\n", ret);
>
> function name prints. This is bad practice. You could amend whole
> onenand_base.c first, then send the OTP re-write as a follow up patch.

I understand.
Sending the patch.

Regards,
Amul Kumar Saha 
