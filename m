Received: from guardian.hermes.si ([193.77.5.150])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16uwMr-0005bW-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Apr 2002 15:13:05 +0100
Received: from primus.hermes.si (primus.hermes.si [193.77.5.98])
	by guardian.hermes.si (8.9.3/8.9.3) with ESMTP id QAA10293
	for <linux-mtd@lists.infradead.org>; Tue, 9 Apr 2002 16:12:59 +0200 (METDST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by primus.hermes.si (Postfix) with ESMTP id 89CB473C81
	for <linux-mtd@lists.infradead.org>; Tue,  9 Apr 2002 16:12:28 +0200 (CEST)
Received: from hsl-mb2.hermes.si (hsl-mb2.hermes.si [10.53.100.100])
	by primus.hermes.si (Postfix) with ESMTP id 824E973C6F
	for <linux-mtd@lists.infradead.org>; Tue,  9 Apr 2002 16:12:27 +0200 (CEST)
Received: from jadran.hermes.si (jadran.hermes.si [10.53.1.9])
	by hsl-mb2.hermes.si (8.9.3/8.9.3) with ESMTP id QAA08261
	for <linux-mtd@lists.infradead.org>; Tue, 9 Apr 2002 16:32:30 +0200
Message-ID: <81D0D3538E3CD411AE3C00D0B7474C31BB6513@jadran.hermes.si>
From: Ludvik Kumin <ludvik.kumin@hermes.si>
To: "Mtd Driver (E-mail)" <linux-mtd@lists.infradead.org>
Subject: FW: problems in latest mtd cvs - jffs2 implementation
Date: Tue, 9 Apr 2002 16:15:33 +0200 
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

I noticed the same thing (except that I checked out the *mtd* version from 
1/4/2002 and used it with the kernel 2.4.16). What is the reason???

Ludvik


-----Original Message-----
From: Gad Hayisraeli [mailto:gad@syete.co.il]
Sent: Sunday, April 07, 2002 15:40
To: Linux-mtd List
Subject: problems in latest mtd cvs - jffs2 implementation


i downloaded the cvs version from 7/4/2002 - this day.
i tried to use it in order to include jffs2 support to older kernel - 2.4.2.
but i noticed that in patchin.sh there's no link's to jffs2 files at all !
is this intentional ?

maybe the simple way is better - to overwrite all files of old kernel with
new mtd-cvs files ?

Gad


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
