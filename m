Received: from port61.vestas.dk ([195.41.59.61] helo=cotas2.cotas.vestas.dom)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 194z1N-0003pK-Vj
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 09:08:58 +0100
From: Esben Nielsen <esn@cotas.dk>
To: linux-mtd@lists.infradead.org
Date: Mon, 14 Apr 2003 10:08:32 +0200
MIME-Version: 1.0
Message-Id: <200304141008.32102.esn@cotas.dk>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 8bit
Subject: Database on JFFS2?
Reply-To: esn@cotas.dk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is it posible to run a sql database (mysql forinstance) on a JFFS2 filesystem?

Running just a database as it is seems to be out of the question due to the 
many writes a database does. At least some tweaking is needed.

Do anyone have experience wth MySQL or other database engines running on a 
JFFS2 volume?

Esben Nielsen
