Received: from bolna.monet.no ([195.139.82.18])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gWJ3-0005oP-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2001 20:01:21 +0100
Received: from starticon (ca88-76.monet.no [195.139.88.76])
	by bolna.monet.no (8.11.6/8.9.1) with SMTP id f8AI5Vr31115
	for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2001 20:05:31 +0200
Message-ID: <00d901c13a2c$ca16d2f0$c801a8c0@starticon>
Reply-To: "Yunus Shaikh" <yshaikh@start-icon.com>
From: "Yunus Shaikh" <yshaikh@start-icon.com>
To: <linux-mtd@lists.infradead.org>
Subject: Fw: Booting doc2000 and mtd
Date: Mon, 10 Sep 2001 21:14:18 +0200
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

Hello all

i have managed to write data   in to the doc2000 , although
i gives segmentation faults many times somehow i haev written it after
restarting almost 50+ times now the problem is the root file system is
mounted
but does not go ahead i get a error mesage saying
warning : unable to open an initial console

i have tried passing init=/bin/sh parameter to the kernel
any help ?

Thanks in advance
Yunus
