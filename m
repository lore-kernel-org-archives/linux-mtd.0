Received: from du-253-35.nat.adsl.claranet.fr ([212.43.253.35]
	helo=synergie-inf.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Iow1-0007VQ-Ja
	for <linux-mtd@lists.infradead.org>; Thu, 22 May 2003 13:12:37 +0100
Received: from archie.gsi.synergie-inf.com ([10.53.2.1])
	by gateway.synergie-inf.com ([127.0.0.1])
	with SMTP (MDaemon.PRO.v6.5.1.R)
	for <linux-mtd@lists.infradead.org>; Thu, 22 May 2003 14:12:53 +0200
Message-ID: <515CABE7496FD111AA3300201829FCBE2FFE30@archie.gsi.synergie-inf.com>
From: Marc Neiger <m.neiger@synergie-inf.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Thu, 22 May 2003 14:12:51 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: jffs2 scanning
Reply-To: m.neiger@synergie-inf.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

is it possible to tell (from command line ?) jffs2 not to scan some MTD
devices ?

I have some mtd partitions in NOR flash which are to be accessed as raw
devices and a NAND flash which is JFFS2. With debugging enabled JFFS2
reports pages and pages of messages regarding what it found in NOR,
moreover, it could eventually understand something wrong !

Cheers,
Marc Neiger
 
Groupe Synergie Informatique
14 rue Saint Papoul
31000 Toulouse
France
