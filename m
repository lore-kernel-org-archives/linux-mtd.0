Received: from mail.iok.net ([62.249.129.22] helo=mail05.iok.net)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 193WMu-0000qS-KN
	for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2003 08:21:08 +0100
Received: from lin01.mn-logistik.de (frdb-d9b967f1.pool.mediaWays.net
	[217.185.103.241])
	by mail05.iok.net (8.12.5/8.12.5) with ESMTP id h3A7LBxO021659
	for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2003 09:21:11 +0200
Received: from mnz66.mn-logistik.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-logistik.de (Postfix) with ESMTP id 317561FF0C
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Apr 2003 08:23:22 +0200 (CEST)
From: Holger Schurig <h.schurig@mn-logistik.de>
To: linux-mtd@lists.infradead.org
Date: Thu, 10 Apr 2003 08:23:21 +0200
References: <001601c2febc$4013a050$1200a8c0@JOHNB>
In-Reply-To: <001601c2febc$4013a050$1200a8c0@JOHNB>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200304100823.21837.h.schurig@mn-logistik.de>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: Problems making jffs2 utils
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> over 5MB (1.6M stripped).  Still too big.  Are there other solutions for
> erasing or for library?

Try another library but glibc, e.g. uclibc
