Received: from chfdns01.ch.intel.com ([143.182.246.24] helo=pan.ch.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15woyr-00065E-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Oct 2001 19:11:49 +0100
Received: from hasmsxvs01.iil.intel.com (hasmsxvs01.iil.intel.com [143.185.63.58])
	by pan.ch.intel.com (8.9.1a+p1/8.9.1/d: relay.m4,v 1.44 2001/10/01 19:10:43 root Exp $) with SMTP id SAA13391
	for <linux-mtd@lists.infradead.org>; Thu, 25 Oct 2001 18:21:02 GMT
Message-ID: <7C0E66E1B97BD5119B120002A50A63D22E41E6@hasmsx101.iil.intel.com>
From: "Kremer, Alex" <alex.kremer@intel.com>
To: "'dsaxena@mvista.com'" <dsaxena@mvista.com>, linux-mtd@lists.infradead.org
Subject: RE: TE28F320B3B madness :(
Date: Thu, 25 Oct 2001 20:20:59 +0200
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

This chip should work.
Larry Doolittle recently (couple of weeks ago) added support for the B3
(Boot Block) line
via jedec_probe and cfi_cmdset_001. This is the best way to do it.

You will need to replace  "cfi_probe" with "jedec_probe" in do_map_probe() 
from the maps driver (drivers/mtd/maps) you are using.

Kreso



| -----Original Message-----
| From: Deepak Saxena [mailto:dsaxena@mvista.com]
| Sent: Thu, October 25, 2001 7:20 PM
| To: linux-mtd@lists.infradead.org
| Subject: TE28F320B3B madness :(
| 
| 
| 
| I've got a TE28F320B3B chip on an IXP board I'm porting to and 
| seem to be blessed with the unluck that many have.  I've skimmed
| through the archives and it seems that various people have different
| patches/methods that make this chip work. What is the status of 
| support for this chip? 
| 
| Markings:
| 
| TE28F320
| B3BC90
| A1104042
| (C)1999
| 
| Tnx,
| ~Deepak
| 
| -- 
| Deepak Saxena, Code Monkey - Ph:480.517.0372 Fax:480.517.0262 
| MontaVista Software - Powering the Embedded Revolution - 
www.mvista.com



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
