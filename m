Received: from jerusalem.magic.fr ([195.154.101.82])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zgUI-0007r0-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 16:11:50 +0100
Received: from serveur.inventel.fr (ppp-146.net-1002.magic.fr [195.115.184.146])
	by jerusalem.magic.fr (8.9.0/8.9.0) with ESMTP id RAA28181
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 17:15:59 +0200 (CEST)
Received: from inventel.fr (193.54.84.61) by serveur.inventel.fr (NPlex 1.3.152) for linux-mtd@lists.infradead.org; 15 May 2001 17:16:04 +0200
Message-ID: <3B01495C.A7CC459A@inventel.fr>
Date: Tue, 15 May 2001 17:21:00 +0200
From: Xavier DEBREUIL <xde@inventel.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: how to make
Content-Type: text/plain; charset=us-ascii
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

I got the 20010306 version working on my board and now I would like to use jffs2
; so, I got the last source version from the cvs access from yesterday and copy
necessary files in my kernel tree ; then make clean, xconfig, and Image but it
does not compile mtdchar or mtdblock and nothing in fact. I am using the
2.4.0-test6 kernel. Did I miss something obvious ?
Do I have to modify Makefiles by hand ?

Xavier
