Received: from mx7.port.ru ([194.67.57.17])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15RuLj-0006Vu-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 Aug 2001 12:39:39 +0100
Received: from [195.161.198.29] (helo=195.161.198.29)
	by mx7.port.ru with esmtp (Exim 3.14 #1)
	id 15RuRK-0006uT-00
	for linux-mtd@lists.infradead.org; Wed, 01 Aug 2001 15:45:26 +0400
Date: Wed, 1 Aug 2001 16:46:05 +0400
From: ASA <atris@mail.ru>
Reply-To: ASA <atris@mail.ru>
Message-ID: <13728558576.20010801164605@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: re: got stuck with DoC 2000: excuse me
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hello all,

Excuse me for hurrying and asking before thoroughly examining...

>  Where I was wrong? Is there any detailed step-by-step instruction to
>  set up DoC2000?
mtd-jffs-HOWTO. at first looking I did not saw this file at all :-(

It says what I want... And that 2.2.x does not work with DoC...

>  I can use 2.4 kernel but I don't want this - I'm developing embedded
>  device and do not want to enlarge system even by 150-200K. In fact,
>  I cannot fit kernel 2.4 (even packed with UPX) and initrd with glibc
>  2.1 together on single bootable standard-formatted floppy.
No, 2.4.1 kernel was enlarged by 20 kbytes only and it does work with DoC.

Thank you
-- 
Best regards,
 ASA                          mailto:atris@mail.ru
