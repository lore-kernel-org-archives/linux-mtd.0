Received: from s131.mittwaldmedien.de ([62.216.178.31])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EgzUg-0008DR-OF
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 02:01:43 -0500
Received: from localhost (localhost [127.0.0.1])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id 02FE95E57DA
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Nov 2005 08:01:32 +0100 (CET)
Received: from lin01.mn-solutions.de (p54B2819D.dip0.t-ipconnect.de
	[84.178.129.157])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id 5CCDE5E57D4
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Nov 2005 08:01:30 +0100 (CET)
Received: from mnz66.mn-solutions.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 45A5E1E014A
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Nov 2005 08:00:38 +0100 (CET)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 29 Nov 2005 08:02:11 +0100
References: <4386F21B.9010507@inf.u-szeged.hu>
	<438B9355.6080603@greyinnovation.com>
In-Reply-To: <438B9355.6080603@greyinnovation.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511290802.11932.hs4233@mail.mn-solutions.de>
Subject: Re: New compression method for JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> With the crypto stuff being used, is there much of a performance hit?

You don't have to do crypto, you can. If you don't use it, it won't hurt 
performance.

Kernel Crypto API is not just crypto (like aes.c, des.c, ...), but also about 
compression (compress.c, deflate.c, ...) and HMACs (md5.c, sha1.c, ...).
