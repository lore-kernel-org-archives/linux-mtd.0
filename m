Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16o4T2-0006yk-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Mar 2002 15:27:04 +0000
Message-Id: <200203211538.g2LFcVw31556@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-15"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: linux-mtd@lists.infradead.org
Subject: drivers/mtd/nand/spia.c broken ?
Date: Thu, 21 Mar 2002 16:39:23 +0100
Cc: David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

has anyone tried to compile this file lately ?

I'm only asking because it contains some IMO strange stuff:

Line 38 following: #define SPIA_XX =

Line 38 vs. 55, 39 vs 56:  xxx_ADDR <> xxx_BASE

Line 161: return = -ENOMEM


Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
