Received: from web58902.mail.re1.yahoo.com ([66.196.100.231])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LD03h-0000xR-Cl
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 17:19:41 +0000
Date: Wed, 17 Dec 2008 09:19:40 -0800 (PST)
From: Philip Rakity <prakity@yahoo.com>
Subject: UBIFS FAQ Questions: minor edits
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <425263.69282.qm@web58902.mail.re1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

a) Order backwards ?
How to create an UBIFS image?

	* mkfs.ubifs which creates UBIFS images;
	* ubinize which creates UBIFS images out of UBI images.Isn't this the other way around ?  uninize creates UBI images from UBIFS images ?


b) please add a sentence or two saying how to burn ubi images.  something like
The ubi image may be burn into flash using the ubiformat utility (see here) or by a commercial flash burner.


      
