Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GKbnS-0003uX-6R
	for linux-mtd@lists.infradead.org; Tue, 05 Sep 2006 15:21:05 +0100
Received: from localhost ([127.0.0.1] helo=eos.fwall.u-szeged.hu)
	by eos.fwall.u-szeged.hu with smtp (Exim 4.51) id 1GKbjn-0002ZA-I1
	for linux-mtd@lists.infradead.org; Tue, 05 Sep 2006 16:17:15 +0200
Received: from eos.fwall.u-szeged.hu ([127.0.0.1])
	by eos.fwall.u-szeged.hu (SMSSMTP 4.1.11.41) with SMTP id
	M2006090516171506323
	for <linux-mtd@lists.infradead.org>; Tue, 05 Sep 2006 16:17:15 +0200
Received: from zsofi.inf.u-szeged.hu ([160.114.37.199]
	helo=mail.inf.u-szeged.hu)
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.51) id 1GKbjn-0002Zw-FJ
	for linux-mtd@lists.infradead.org; Tue, 05 Sep 2006 16:17:15 +0200
Received: from [160.114.36.214] (kpax.inf.u-szeged.hu [160.114.36.214])
	by mail.inf.u-szeged.hu (Postfix) with ESMTP id 5760423969
	for <linux-mtd@lists.infradead.org>;
	Tue,  5 Sep 2006 16:17:15 +0200 (CEST)
Message-ID: <44FD875D.6080808@inf.u-szeged.hu>
Date: Tue, 05 Sep 2006 16:19:09 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Summary fix
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All!

We've fixed a bug in summary collecting (JFFS2). I've commited into my
git tree:

http://git.infradead.org/?p=users/havasi/summary-collecting-fix-2.6.git

Ferenc
