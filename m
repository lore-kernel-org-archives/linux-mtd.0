Received: from pop3.galileo.co.il ([199.203.130.130] helo=galileo5.galileo.co.il)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18R6EB-0008TA-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Dec 2002 07:45:20 +0000
Received: from pc22 ([10.2.1.73])
	by galileo5.galileo.co.il (8.12.6/8.12.6) with SMTP id gBP8FIP5023386
	for <linux-mtd@lists.infradead.org>; Wed, 25 Dec 2002 10:15:18 +0200 (GMT-2)
From: "Ilan Pollak" <ilanp@galileo.co.il>
To: <linux-mtd@lists.infradead.org>
Subject: How Do I connect MTD utils into the uClinux distro ?
Date: Wed, 25 Dec 2002 10:20:59 +0200
Message-ID: <PKEDKBLDKFHINBMPOMCHKECNCHAA.ilanp@galileo.co.il>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi List,
I'm porting the latest and greatest uClinux distro (Sep 27th).
I've downloaded MTD's latest code.
everything compiles fine after i patchin in the kernel. but when i get to
the mtd-utils in the userland, i get lots of errors.
can someone please tell me how do i hook mtd/util into user/mtd-utils ???
thanks,
ilan.
