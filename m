Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=Dual166.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Te5a-0001Jr-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 07:14:26 +0000
Received: from nt40server ([192.168.1.101])
	by Dual166.localdomain (8.9.3/8.9.3) with SMTP id XAA14161
	for <linux-mtd@lists.infradead.org>; Wed, 23 Jan 2002 23:25:39 -0800
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: <linux-mtd@lists.infradead.org>
Subject: NTFL support for Millennium Plus
Date: Wed, 23 Jan 2002 23:17:35 -0800
Message-ID: <NCBBIINEHIPFGJPLBEIFGEJNDDAA.acurtis@onz.com>
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

The M-Systems Millennium Plus Linux distribution has TrueFFS. Is it possible
to use the MTD NTFL support to put JFFS2 on top of the Millennium Plus DOC?

(Yes, we have a loadable module for the Millennium Plus. Has anyone looked
at AppNote 46? It describes low level interfaces to the TrueFFS driver.
Perhaps an MTD interface could be made for this?)
