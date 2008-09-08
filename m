Received: from merope.crondor.net ([213.193.236.201])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KcfmK-0005ZF-2t
	for linux-mtd@lists.infradead.org; Mon, 08 Sep 2008 12:23:36 +0000
Received: from aeon.hgd.crondor.net (205-120.ipact.nl [82.210.120.205])
	(using TLSv1 with cipher ADH-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by merope.crondor.net (Postfix) with ESMTPSA id C57AD158933
	for <linux-mtd@lists.infradead.org>;
	Mon,  8 Sep 2008 14:22:58 +0200 (CEST)
Received: from andromeda.localnet (unknown
	[IPv6:2001:610:6f9:0:220:18ff:fe8c:66ca])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by aeon.hgd.crondor.net (Postfix) with ESMTP id B58EFEAB2A
	for <linux-mtd@lists.infradead.org>;
	Mon,  8 Sep 2008 14:22:25 +0200 (CEST)
From: Michel Wilson <michel@crondor.net>
To: linux-mtd@lists.infradead.org
Subject: Accessing CF in memory mode
Date: Mon, 8 Sep 2008 14:22:22 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200809081422.22800.michel@crondor.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm currently developing an embedded system with a CF card as storage for the 
file system. I understand that mtd should normally not be used with a CF card, 
since they work in IDE mode. However, I still would like to use a flash 
filesystem on the card, so that the wear will be lower. From the CF specs I 
understand that it's possible to use the CF card in 'PC Card Memory Mode'. How 
do I achieve this, and is my assumption correct that I'll be able to use 
pcmciamtd to access the card in mtd mode? Is the only way to enable memory 
mode plugging the card in a pcmcia slot or adapter?
(I'm not subscribed, so please be so kind to cc me)

Regards,

Michel Wilson.
-- 
Michel Wilson     michel@crondor.net
PGP key ID        0xD2CB4B7E
