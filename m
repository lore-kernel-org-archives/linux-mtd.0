Received: from dsl-64-129-131-125.telocity.com ([64.129.131.125] helo=mir.outpostsentinel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GTub-00055Z-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2001 23:44:41 +0000
Received: from cfowler ([192.168.1.102])
	by mir.outpostsentinel.com (8.11.0/8.11.0) with SMTP id fBJ1Sgf02430
	for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2001 20:28:43 -0500
From: "Chris Fowler" <cfowler@outpostsentinel.com>
To: <linux-mtd@lists.infradead.org>
Subject: Storing config data on DOC.
Date: Tue, 18 Dec 2001 18:54:11 -0500
Message-ID: <NFBBLCEFBCFEPMJJKOIKIENJCAAA.cfowler@outpostsentinel.com>
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

I have a DOC2000 that I store config data on /dev/fla2.  Basically it starts
from block 1 and continues for roughly 20k.  I have a 3 character header
that is at the begining.  If I run doc-lilo to modify the boot sector on
/dev/fla then it appears that my header disapears.  Should I begin storing
raw data at an offset?

Thanks,
Chris
