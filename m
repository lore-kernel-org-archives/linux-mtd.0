Received: from sphere.barak.net.il ([212.150.48.98])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16uBxk-0002zY-00
	for <linux-mtd@lists.infradead.org>; Sun, 07 Apr 2002 13:40:04 +0100
Received: from gad ([10.10.11.10]) by sphere.barak.net.il
          (InterMail vK.4.03.00.00 201-232-121 license 5444ddd44659357c6c93343e0ce38507)
          with SMTP id <20020407123746.BVL18833.sphere@gad>
          for <linux-mtd@lists.infradead.org>;
          Sun, 7 Apr 2002 15:37:46 +0300
Message-ID: <005801c1de39$ad6a1fc0$1900000a@v.vmanage.com>
Reply-To: "Gad Hayisraeli" <gad@syete.co.il>
From: "Gad Hayisraeli" <gad@syete.co.il>
To: "Linux-mtd List" <linux-mtd@lists.infradead.org>
Subject: problems in latest mtd cvs - jffs2 implementation
Date: Sun, 7 Apr 2002 15:39:44 +0200
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

i downloaded the cvs version from 7/4/2002 - this day.
i tried to use it in order to include jffs2 support to older kernel - 2.4.2.
but i noticed that in patchin.sh there's no link's to jffs2 files at all !
is this intentional ?

maybe the simple way is better - to overwrite all files of old kernel with
new mtd-cvs files ?

Gad
