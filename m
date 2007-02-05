Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HDyDx-0004g3-IT
	for linux-mtd@lists.infradead.org; Mon, 05 Feb 2007 02:25:16 -0500
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-ext12.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l157L8jF005775
	for <linux-mtd@lists.infradead.org>; Mon, 5 Feb 2007 09:21:26 +0200
Message-ID: <45C6DB35.3040106@nokia.com>
Date: Mon, 05 Feb 2007 09:22:29 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] OneNAND: Do not allow oob write past end of page
References: <45C2EE39.7050909@nokia.com>
	<003a01c748f0$48530620$c7a3580a@swcenter.sec.samsung.co.kr>
In-Reply-To: <003a01c748f0$48530620$c7a3580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Kyungmin Park wrote:
> Umm Why is it required in OneNAND? Even though OneNAND is based on NAND. We
> regard it as NOR

I am not sure what you mean.  In onenand_base.c it has:

	mtd->type = MTD_NANDFLASH;

So mtd sees it as NAND.
