Received: from natpost.webmailer.de ([192.67.198.65] helo=post.webmailer.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WE0M-0005Eu-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2002 09:59:43 +0000
Received: from thomas (pD9EB8F59.dip.t-dialin.net [217.235.143.89])
	by post.webmailer.de (8.9.3/8.8.7) with SMTP id LAA07025
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2002 11:10:49 +0100 (MET)
Content-Type: text/plain;
  charset="iso-8859-15"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: linux-mtd@lists.infradead.org
Subject: compile errors on fs/jffs/inode-v23.c
Date: Thu, 31 Jan 2002 11:13:00 +0100
MIME-Version: 1.0
Message-Id: <02013111130007.00763@thomas>
Content-Transfer-Encoding: 8bit
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

Is there a real reason for the change in inode-v23.c at line 367

	inode->i_rdev.value = 0;

As far as I can see is inode->i_rdev neither a structure nor a union. 
I'm working on kernel 2.4.17. Is this a change for 2.5 ?

Thomas
 
__________________________________________________
Thomas Gleixner, autronix automation GmbH
auf dem berg 3, d-88690 uhldingen-muehlhofen
fon: +49 7556 919891 , fax: +49 7556 919886
mail: gleixner@autronix.de, http://www.autronix.de  
