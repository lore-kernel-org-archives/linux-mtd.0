Received: from [213.70.90.131] (helo=mailsweeper.advaoptical.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17uzhp-000053-00
	for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2002 19:19:13 +0100
Received: from adva-mailer.munich.adva.com (unverified) by mailsweeper.advaoptical.de
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T5d996aab520ac8000a06e@mailsweeper.advaoptical.de> for <linux-mtd@lists.infradead.org>;
 Fri, 27 Sep 2002 20:17:43 +0200
Message-ID: <33BB463469A3D411B08F00508BDD1626E1872C@ntsyork.adva_york>
From: John Messenger <JMessenger@advaoptical.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Trouble building mkfs.jffs2
Date: Fri, 27 Sep 2002 20:18:12 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi,

Building mkfs.jffs2 after copying the content of the mtd distribution into
my kernel build tree, I get:

cd util
make
...
compr_zlib.c:15:2: #error "The userspace support got too messy and was
removed.  Update your mkfs.jffs2".

Has this been fixed?  Any suggestions?

Related question: how do you build your initial JFFS2 images?  I am also
trying to loopback mount a JFFS2 for a PPC machine on an i386 Red Hat 7.3
after loading JFFS2 modules, but no luck so far.

Help greatfully received.
	-- John

--
John Messenger, R&D Software Manager, ADVA Optical Networking Ltd.
Tel: +44-(1904) 699309
Fax: +44-(1904) 699378
Email: JMessenger@advaoptical.com
www.advaoptical.com
"Mind like parachute - only works when open." -- Charlie Chan  
