Received: from dsl-64-129-131-125.telocity.com
	([64.129.131.125] helo=mir.outpostsentinel.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16RbZG-0000rd-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2002 16:08:39 +0000
Received: from amd800 (dhcp02.outpostsentinel.com [192.168.1.102])
	by mir.outpostsentinel.com (8.9.3/8.9.3) with SMTP id GAA22528
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2002 06:23:30 -0500
From: "Chris Fowler" <cfowler@outpostsentinel.com>
To: <linux-mtd@lists.infradead.org>
Subject: Marking sector as RO.
Date: Fri, 18 Jan 2002 11:18:49 -0500
Message-ID: <NFBBLCEFBCFEPMJJKOIKOENHCBAA.cfowler@outpostsentinel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I store a 64bit serial number on a raw partition using DOC2000.  Is it
possible to mark that area as readonly during assembly of units?

Chris
