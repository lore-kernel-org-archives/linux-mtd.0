Received: from mail3.aracnet.com ([216.99.193.38])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175aN4-0006a9-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 23:57:19 +0100
Received: from tinman.seitzassoc.com (216-99-217-243.dsl.aracnet.com [216.99.217.243])
	by mail3.aracnet.com (8.12.2/8.12.1) with ESMTP id g48MvGmJ005049
	for <linux-mtd@lists.infradead.org>; Wed, 8 May 2002 15:57:16 -0700
Received: from tinman.seitzassoc.com (IDENT:galens@localhost [127.0.0.1])
	by tinman.seitzassoc.com (8.11.6/8.11.6) with ESMTP id g48MvFP09794
	for <linux-mtd@lists.infradead.org>; Wed, 8 May 2002 15:57:16 -0700
Message-Id: <200205082257.g48MvFP09794@tinman.seitzassoc.com>
To: linux-mtd@lists.infradead.org
Subject: module options for physmap.o?
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 08 May 2002 15:57:15 -0700
From: Galen Seitz <galens@seitzassoc.com>
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

I have a PCI card which contains flash memory that is mapped into the
PCI memory space via a BAR.  Since the base address is dynamic, I'm not
sure how to use physmap.  Is there another way to do this, or,
alternatively, how difficult would it be to add module options to physmap
to allow for dynamic configuration?

Sorry if this has been asked before.  (Is google my best choice for 
searching a mailing list that is archived by mailman?)

thanks,
galen
