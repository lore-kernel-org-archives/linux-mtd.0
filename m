Received: from mx0.gmx.de ([213.165.64.100] helo=mx0.gmx.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cht7-0004EO-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 08:39:17 +0100
Date: Thu, 8 Aug 2002 09:38:52 +0200 (MEST)
From: Frank Oltmanns <frank.oltmanns.ml@gmx.de>
To: <jay.s@sohu.com>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
References: <871203.1028710084678.JavaMail.postfix@mailsrv1.mail.sohu.com>
Subject: Re: problem at boot from doc2000-with grub
Message-ID: <15719.1028792332@www19.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Did you try "eraseall /dev/mtd0"? I don't know too much about DiskOnChip,
but I think this should work!? But this would also erase your
bad-block-table,
so use with care.

  Frank

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
