Received: from darwin.altera.com ([66.35.227.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17QNat-0007mQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Jul 2002 08:33:31 +0100
Received: from Altera.COM (sunrise [137.57.1.1])
	by darwin.altera.com (8.10.2+Sun/8.10.2) with ESMTP id g657UvW11802
	for <linux-mtd@lists.infradead.org>; Fri, 5 Jul 2002 00:30:57 -0700 (PDT)
Received: from localhost (localhost [[UNIX: localhost]])
	by localhost.localdomain (8.11.6/8.11.6) id g657Wnv27004
	for linux-mtd@lists.infradead.org; Fri, 5 Jul 2002 08:32:49 +0100
Message-Id: <200207050732.g657Wnv27004@localhost.localdomain>
Content-Type: text/plain;
  charset="iso-8859-15"
From: Clive Davies <cdavies@altera.com>
To: linux-mtd@lists.infradead.org
Subject: add_mtd_partition question
Date: Fri, 5 Jul 2002 08:32:48 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Is there a reason why when you add a partition with add_mtd_partition 
master->priv doesn't get copied into slave->priv ? If not, does anyone object 
if I add it in? I'm trying to fix the read_user_prot_reg accesses which no 
longer seem to work for me. 

Clive
