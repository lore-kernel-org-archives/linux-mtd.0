Received: from dsl-64-129-133-253.telocity.com ([64.129.133.253] helo=skylab.outpostsentinel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iiql-0003w5-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 21:21:27 +0000
Received: from GATEKEEPER ([192.168.2.103])
	by skylab.outpostsentinel.com (8.11.2/8.11.2) with SMTP id g26MMn809492
	for <linux-mtd@lists.infradead.org>; Wed, 6 Mar 2002 17:22:49 -0500
Message-Id: <200203062222.g26MMn809492@skylab.outpostsentinel.com>
Date: Wed, 06 Mar 2002 16:31:31 -0500
To: linux-mtd@lists.infradead.org
From: Chris Fowler <strtok@hotmail.com>
Subject: DOC2000 lost after trying to install grub
Reply-To: strtok@hotmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

Well,  after 4 hours of work I finallty got my chip back.  It will now be used only for development.  Somehow when doing the doc_loadbios on /dev/mtd0 I overrote my bad block list.  I'll never
do that one again.  I'll stick to doc-lilo till someone else irons grub out a little bit more.

Chris
