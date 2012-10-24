Received: from mail02.rohde-schwarz.com ([80.246.32.97])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TQwpm-0004DV-Sg
 for linux-mtd@lists.infradead.org; Wed, 24 Oct 2012 09:01:07 +0000
In-Reply-To: <5087AC58.1000402@linux.vnet.ibm.com>
References: <50877953.9040602@linux.vnet.ibm.com>
 <OFCD7F9EAE.28A631AD-ONC1257AA1.002B4604-C1257AA1.002D248C@rohde-schwarz.com>
 <5087AC58.1000402@linux.vnet.ibm.com>
To: hejianet <hejianet@linux.vnet.ibm.com>
MIME-Version: 1.0
Subject: Re: [question]MTD:unstable bit issues?
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF4005835E.007816E8-ONC1257AA1.0030E2F0-C1257AA1.003189CF@rohde-schwarz.com>
Date: Wed, 24 Oct 2012 11:01:02 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Jia:

> Yes, we use jffs2.
> How did u solve your bug? :)

> >> ----------------------------------------------------- 
> >> 2)a 4k bytes hole with all 0 in the flash file.
> >> -----------------------------------------------------

Unfortunately, we didn't solve it. Some day, it was simply gone; I have no 
idea what had changed. I couldn't reproduce it anymore, so I couldn't do 
any further analysis.

Anyway, most likely this is not a NAND issue or MTD issue, but a JFFS2 
issue. And I would certainly want to hear about it if you manage to find 
and fix it ...

Best regards,
Thomas
