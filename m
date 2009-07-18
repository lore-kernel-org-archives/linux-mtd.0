Received: from [124.30.7.148] (helo=mail.freesystems.biz)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MS6gV-00014j-MF
	for linux-mtd@lists.infradead.org; Sat, 18 Jul 2009 09:58:33 +0000
Received: from [192.168.1.2] (localhost [127.0.0.1])
	by mail.freesystems.biz (Postfix) with ESMTP id C9FE22162EA
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Jul 2009 15:17:45 +0530 (IST)
Message-ID: <4A619A8A.1020100@freesystems.biz>
Date: Sat, 18 Jul 2009 15:18:58 +0530
From: Devendra <devendra.sharma@freesystems.biz>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: raw flash hardware
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
We want to add flash support to our PC in form of PCIe card. Usage could 
be as SSD or cache.

Most cards have flash controllers that incorporate useful functionality 
  like bus conversion & DMA engine. But their  firmware implements WL, 
GC, EDC, etc.

What PCIe boards with raw flash MTD are people here using?

Thanks & regards,
Devendra
