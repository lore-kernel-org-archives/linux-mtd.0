Received: from verifonedns.verifone.com ([192.30.91.34])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bQmn-0004XL-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 18:39:13 +0000
Received: from smf-nt-mail1.verifone.com (SMF-NT-MAIL1.verifone.com [10.64.88.34])
	by verifonedns.verifone.com (Postfix) with ESMTP id A90B73E57D
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 10:49:23 -0800 (PST)
Message-ID: <614CC7C21856D1118DA30060B06B487302ACC8D0@SMF-NT-MAIL1>
From: Eric Nelson <eric_n2@verifone.com>
To: linux-mtd@lists.infradead.org
Subject: Alternate to DOC??
Date: Thu, 14 Feb 2002 10:50:15 -0800
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

We would very much like to use JFFS2 on a project.  However, most boards have
either CF or DOC.  My understanding of JFFS2 on DOC is that you disable the
controller on the DOC, and just use the flash.

Now, wouldn't it be a good idea for someone to build a device w/ same footprint
as DOC, but w/ just raw flash?  Maybe we could do this.  Would this impinge on
some patent by M-Systems?  It would make it a lot easier for us to use JFFS2 if
we could do this.
