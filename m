Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ReyH-00013v-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2002 19:46:41 +0000
Message-ID: <3C487D9A.D85DDC3D@comdev.cc>
Date: Fri, 18 Jan 2002 11:55:06 -0800
From: Adam Wozniak <adam.wozniak@comdev.cc>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: optimum geometry
References: <3C48504B.68F8FE7F@comdev.cc>  <20020118010528.A22777@swing.comdev.cc> <28158.1011372920@redhat.com>
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

I've got 8 x 8 bit chips forming my 64 bit wide flash area.
An erase block on a single chip is 128K bytes, so I've really
got 128K * 8 == 1024 K == 1 M erase blocks.  My JFFS2 partition
is 96 Megs, so I've only got 96 erase blocks.

I'm beginning to fear that this is far from optimum.  What is an
optimum erase block size?

I could drop back and rewrite the MTD driver to address each
chip seperately, but I'm concerned that would be both messy and
tough on performance.

Thoughts?

-- 
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      3450 Broad St. 107, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
