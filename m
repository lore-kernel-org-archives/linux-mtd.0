Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=Dual166.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MA3d-0002J5-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Jan 2002 15:45:29 +0000
Received: from nt40server ([192.168.1.101])
	by Dual166.localdomain (8.9.3/8.9.3) with SMTP id HAA00426
	for <linux-mtd@lists.infradead.org>; Thu, 3 Jan 2002 07:55:22 -0800
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS and Hard Links
Date: Thu, 3 Jan 2002 07:49:09 -0800
Message-ID: <NCBBIINEHIPFGJPLBEIFAECIDDAA.acurtis@onz.com>
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

Are hard links supported in the latest JFFS? It appears that some of the
Linux administrative functions like "useradd" and "su" require hard links.
If they do not work, then it is not possible to have a system with only
JFFS.

Recommendations?
