Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14cW3D-0003Cx-00
	for mtd-list@infradead.org; Mon, 12 Mar 2001 17:24:07 +0000
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: David Woodhouse <dwmw2@infradead.org>, mtd@infradead.org
Subject: Swich statement in cfi_probe.c
Date: Mon, 12 Mar 2001 18:15:37 +0100
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <01031218235800.02378@rob>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I noticed that in cfi_probe.c, routine cfi_probe_new_chip(), the cases following
the switch(map->buswidth) are not terminated by a break. Thus if the probe
fails for the given buswidth, the code will try all remaining buswidths too.

Is that a bug or does it serve a purpose (if so, which ?)

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
