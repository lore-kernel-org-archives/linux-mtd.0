Received: from mindseal.comm2000.it ([194.133.0.6] helo=relay.comm2000.it)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DOqL-0007xR-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2001 12:11:17 +0100
Received: from Athlon ([212.97.52.190])
	by relay.comm2000.it (8.11.2/MFAGMM-19990726) with SMTP id f5MBBeY05732
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2001 13:11:40 +0200
Message-ID: <003101c0fb0c$28d2d920$230d0dc3@Athlon>
From: "Paolo Marini" <paolom@prisma-eng.it>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2: endian problem ?
Date: Fri, 22 Jun 2001 13:11:57 +0200
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

OK, the new rpxlite.c solved the problem. I did not need to set
CONFIG_MTD_CFI_ADV_OPTIONS.

Thank you

Paolo
