Received: from [66.89.142.11] (helo=exalane.intransa.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16gUMC-0000cI-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2002 17:28:40 +0000
content-class: urn:content-classes:message
Subject: jffs2 and flash sectors
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 Feb 2002 09:39:53 -0800
Message-ID: <EA23924D8B48774F889C7733226B28E80E7DBA@exalane.intransa.com>
From: "Paul Lai" <paul.lai@intransa.com>
To: <linux-mtd@lists.infradead.org>
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

How cognizant of flash sectors is jffs2?  Will an inode and it's data
cross flash sector boundaries?  Or will jffs2 align them to fit within
and start them on flash sector boundaries?
