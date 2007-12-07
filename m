Received: from mu-out-0910.google.com ([209.85.134.187])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J0ekz-0007Rl-FM
	for linux-mtd@lists.infradead.org; Fri, 07 Dec 2007 15:04:55 +0000
Received: by mu-out-0910.google.com with SMTP id i2so1114211mue
	for <linux-mtd@lists.infradead.org>;
	Fri, 07 Dec 2007 07:04:47 -0800 (PST)
Message-ID: <3adeeb410712070704g7c09e4aeyb81724f15f93b4af@mail.gmail.com>
Date: Fri, 7 Dec 2007 09:04:46 -0600
From: Ramesh <sramesh23@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: AMCC NAND controller driver in 2.6.17
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am using the AMCC PPC 440-EPX board and linux 2.6.17 kernel. The
driver for the built-in NAND controller seems to be the file
sequoia_nand.c. Has anyone seen this working? I am not sure it
programs the EBC registers correctly. Is there a working version of a
driver for the NAND controller? I see ndfc.c in 2.6.19 kernel but I
can't switch kernels yet. Any help is appreciated.

Thanks.
--Ramesh
