Received: from fallback.mail.ru ([194.67.57.14] helo=mx4.mail.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DEiOW-0008D7-50
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2005 01:34:09 -0500
Received: from f16.mail.ru (f16.mail.ru [194.67.57.46])
	by mx4.mail.ru (mPOP.Fallback_MX) with ESMTP id B0C66188B1A
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Mar 2005 08:14:30 +0300 (MSK)
Received: from mail by f16.mail.ru with local id 1DEh9N-0008Wa-00
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2005 08:14:25 +0300
From: =?koi8-r?Q?=F7=C9=D4=C1=CC=C9=CA=20=F3=D4=CF=CC=D1=D2=CF=D7?=
	<svitaliy77@mail.ru>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Date: Fri, 25 Mar 2005 08:14:25 +0300
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit
Message-Id: <E1DEh9N-0008Wa-00.svitaliy77-mail-ru@f16.mail.ru>
Subject: jffs2 mounting time
Reply-To: =?koi8-r?Q?=F7=C9=D4=C1=CC=C9=CA=20=F3=D4=CF=CC=D1=D2=CF=D7?=
	<svitaliy77@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I have the big problem with mounting jffs2.

I am using it with s3c2410 ARM linux-2.4.18-rmk7-pxa1 and
Intel NOR flash TE28F128. But when I try to mount jffs2 (8M partition) with around 5MBytes of data the mounting (and first file access)
process continues about 10 minutes!

What can I do?

Thank You!

Best Regards,
Vitaliy Stolyarov.
