Received: from phobos.telex.de ([217.7.76.163])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CINaP-0007Su-Ds
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2004 04:37:19 -0400
From: Josef Baumgartner <josef.baumgartner@telex.de>
To: linux-mtd@lists.infradead.org
Date: Fri, 15 Oct 2004 10:37:06 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200410151037.06581.josef.baumgartner@telex.de>
Subject: Access to AMD SecSi sector
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I need to write and protect the SecSi sector of an AMD flash from linux. I 
searched in the MTD sources but found no way to do that.

Has anybody done this before?  How much work would it be to
add such a function in the MTD driver?

Another way would be to add a simple kernel driver to do it without the whole 
mtd stuff.  I think the problem would be sure that nobody else is accessing 
the flash. 

Hope, anybody can help me.

Regards,

Josef
