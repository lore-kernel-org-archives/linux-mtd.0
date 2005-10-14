Received: from s131.mittwaldmedien.de ([62.216.178.31])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EQTQy-0000ld-Pg
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2005 13:33:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id 5BE655E471C
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2005 08:25:51 +0200 (CEST)
Received: from lin01.mn-solutions.de (p54B2B138.dip0.t-ipconnect.de
	[84.178.177.56])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id 7BCF25E417F
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2005 08:25:50 +0200 (CEST)
Received: from mnz66.mn-solutions.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 719381E014A
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2005 08:25:15 +0200 (CEST)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: linux-mtd@lists.infradead.org
Date: Fri, 14 Oct 2005 08:25:12 +0200
References: <434E7211.6020709@gmail.com>
In-Reply-To: <434E7211.6020709@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200510140825.12934.hs4233@mail.mn-solutions.de>
Subject: Re: /dev/mtd* not there with latest MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> But: there is no /dev/mtd* or /dev/mtdblock* at all!
> There are no changes to u-boot or some other kernel config, only the new
> MTD source.

This is no longer created by the CVS version MTD. Not wanting udev on my 
device (I was able to not use initrd's for years, why should I now begin?), I 
made some old-fanshiond mknod-style device files there. They have the same 
names as devfs without devfsd had, so my software just runs fine.
