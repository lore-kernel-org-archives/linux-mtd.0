Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L7ZXp-0007s4-HS
	for linux-mtd@lists.infradead.org; Tue, 02 Dec 2008 18:00:22 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id
	mB2I08i1007593 for <linux-mtd@lists.infradead.org>;
	Tue, 2 Dec 2008 11:00:13 -0700 (MST)
Received: from iconoclast.sgtl.sigmatel.com ([10.1.28.112])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id mB2I074s002804
	for <linux-mtd@lists.infradead.org>;
	Tue, 2 Dec 2008 12:00:07 -0600 (CST)
Date: Tue, 02 Dec 2008 11:59:11 -0600
To: linux-mtd@lists.infradead.org
Subject: A Question about MTD_OOB_*
From: "Patrick Turley" <patrick.turley@freescale.com>
Content-Type: text/plain; format=flowed; delsp=yes; charset=utf-8
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <op.uljqwxt14yuz67@iconoclast.sgtl.sigmatel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have some questions about the following macros:

     MTD_OOB_PLACE
     MTD_OOB_RAW
     MTD_OOB_AUTO

Specifically, I believe I understand the meaning of MTD_OOB_AUTO and  
MTD_OOB_RAW, but I'm struggling to understand MTD_OOB_PLACE.

Can anyone explain to me what MTD_OOB_PLACE means?
