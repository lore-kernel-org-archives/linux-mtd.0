Received: from chfdns01.ch.intel.com ([143.182.246.24] helo=pan.ch.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15vwNv-00012K-00
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 08:54:03 +0100
Received: from hasmsxvs01.iil.intel.com (hasmsxvs01.iil.intel.com [143.185.63.58])
	by pan.ch.intel.com (8.9.1a+p1/8.9.1/d: relay.m4,v 1.44 2001/10/01 19:10:43 root Exp $) with SMTP id IAA11769
	for <linux-mtd@lists.infradead.org>; Tue, 23 Oct 2001 08:03:15 GMT
Message-ID: <7C0E66E1B97BD5119B120002A50A63D22E41C9@hasmsx101.iil.intel.com>
From: "Kremer, Alex" <alex.kremer@intel.com>
To: "'Larry Doolittle'" <ldoolitt@recycle.lbl.gov>,
        linux-mtd@lists.infradead.org
Subject: RE: MTD support for Intel E28F016S3 ?
Date: Tue, 23 Oct 2001 10:03:06 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
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


| -----Original Message-----
| From: Larry Doolittle [mailto:ldoolitt@recycle.lbl.gov]
| Sent: Mon, October 22, 2001 6:45 PM
| To: linux-mtd@lists.infradead.org
| Subject: MTD support for Intel E28F016S3 ?
| 
| One weird effect showed up using the 28F320B3B on a nanoEngine, where
| the CFI detect code "found" the chip, although it is truly not CFI
| compliant.  This is apparently a chip bug, and the workaround is to
| use the JEDEC probe first, followed by the CFI detect code.  This
| order is backwards from the official Intel policy on detection logic.
| 

This is strange, I have TE28F320B3B mapped over dc21285 and the cfi_probe
first,
jedec_probe after works fine...

Kreso
