Received: from web40412.mail.yahoo.com ([66.218.78.109])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18TRoB-0006aa-00
	for <linux-mtd@lists.infradead.org>; Tue, 31 Dec 2002 19:12:12 +0000
Message-ID: <20021231194227.16581.qmail@web40412.mail.yahoo.com>
Date: Tue, 31 Dec 2002 11:42:27 -0800 (PST)
From: Jeff Lin <jlin87@yahoo.com>
Subject: FTL of compact flash card 
To: linux-mtd@lists.infradead.org
In-Reply-To: <20021231120008.22857.80291.Mailman@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Hello, all, 

 First, Happy new year to you!

 I am looking for a FTL (flash translation layer)code 
that will emulates the flash memory as a IDE  disk 
for the controller IC inside the compact flash card. 

The FTL will need to do logical to physical address
mapping, bad block management, and wear level
algorithm. There is no File system needed, instead,
the FTL will talk to the native file system. 

Is there any open source code of FTL available? Can
NFTL or JFFS/JFFS2 be tailored for this purpose? As
for commercial FTL, which commercial code is
good/reliable and relatively inexpensive?

Thank you very much for help,
Jeff




__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
