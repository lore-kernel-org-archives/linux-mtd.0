Received: from h015.c007.snv.cp.net ([209.228.33.243] helo=c007.snv.cp.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mfvw-0002I7-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 20:35:24 +0100
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
From: acurtis@onz.com
Subject: recalc_sigpending() - multiple defines
Date: Wed, 04 Sep 2002 12:35:20 -0700 (PDT)
Message-Id: <20020904123521.26470.h002.c007.wm@mail.directvinternet.com.criticalpath.net>
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

When compiling with Module versioning support I get an warning regarding
redefinition of recalc_sigpending() from linux/mtd/compatmac.h

Is this anything to worry about? Is there a good solution for this?

------------------------------------------------------------ 
Allen Curtis              |  All good things come to those 
Ones and Zeros, Inc.      |  who wait. Some of us have to 
mailto:acurtis@onz.com    |  wait a little longer. 
