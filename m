Received: from proxy.tritec.de ([193.141.224.1] helo=nimrod.tritec.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15I8DL-0004hL-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Jul 2001 13:26:35 +0100
Received: from gideon.tritec.de (gideon.tritec.de [10.0.4.31])
	by nimrod.tritec.de (8.8.8/8.8.8) with ESMTP id OAA01177
	for <linux-mtd@lists.infradead.org>; Thu, 5 Jul 2001 14:32:12 +0200 (MET DST)
Received: from localhost (localhost [127.0.0.1])
	by gideon.tritec.de (8.8.8/8.8.8) with SMTP id OAA04841
	for <linux-mtd@lists.infradead.org>; Thu, 5 Jul 2001 14:32:12 +0200 (MET DST)
Message-Id: <200107051232.OAA04841@gideon.tritec.de>
Date: Thu, 5 Jul 2001 14:32:12 +0200 (MET DST)
From: Peter Blum <pb@tritec.de>
Reply-To: Peter Blum <pb@tritec.de>
Subject: SmartMedia Card Flash File System
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: TEXT/plain; charset=us-ascii
Content-MD5: AnX4xph+r3WIDYs0ojWZ6A==
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

Hello,

does anybody know what kind of flash file system is used for
SmartMedia Card?

I got a driver working on 2.4.5 ppc kernel and can use the mtdchar
device to read the raw contens of the card. It seems that neither ftl
nor nftl can't be used.


Peter

_____________________________________________________________________
Peter Blum                                 Tel. +49 (6131) 922 237
Tritec Electronic AG                        Fax +49 (6131) 922 229
Carl-Zeis-Strasse 41                      email Peter.Blum@tritec.de
D-55129 Mainz                               URL http://www.tritec.de
