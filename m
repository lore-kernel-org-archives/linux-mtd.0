Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DqHmi-0004vy-Od
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2005 17:50:26 -0400
Received: from mail.tec.linutronix.de (unknown [192.168.0.1])
	by mail.tglx.de (Postfix) with ESMTP id 6876F65C003
	for <linux-mtd@lists.infradead.org>;
	Wed,  6 Jul 2005 23:47:35 +0200 (CEST)
Received: from tglx.tec.linutronix.de (tglx.tec.linutronix.de [192.168.0.68])
	by mail.tec.linutronix.de (Postfix) with ESMTP id 6B709283A2
	for <linux-mtd@lists.infradead.org>;
	Wed,  6 Jul 2005 23:50:21 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Wed, 06 Jul 2005 23:53:18 +0200
Message-Id: <1120686798.26713.81.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [RFO] CVS commit and patch comments
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

RFO = Request For Obedience :)

Please follow the few simple rules for patch submissions and CVS commit
comments to make the life of patchmonkeys / maintainers easier.


1. Provide a short summary line of the patch in the format:

[MTD] DETAILEDTARGET: short summary
[JFFS2] short summary

DETAILEDTARGET should be one of the MTD subcomponents e.g. NAND, CHIPS,
MAPS, CORE and/or a filename if it simplifies the review/recognition of
patch relevance

2. Empty newline

No futher explanation for this one :)


3. Add a long comment to explain the patch.

Please use understandable wording. We are not experts in witchcraft.
Please omit comments which just resemble the short summary line for
simple patches.


4. Add the appropriate origin information

[From: Realname <realmail>]
[Acked-by: Realname <realmail>]
Signed-off-by: Realname <realmail>

Convenience rule for MTD-CVS writers:
Committing patches to MTD-CVS is an implicit "Signed-off-by: CVS
committer". Therefor MTD-CVS writers may omit their own (the bottom)
Signed-off-by line, if they keep their infradead.org username vs.
Realname/RealMail correlation in scripts/mtdusers.txt up to date. The
Signed-off-by can be created automatically by the CVS->git commit
selection / review script, when this information is available and
correct.


Thanks for your help and understanding.

tglx


PS: Refusing obedience will be tracked down and punished
 - either by tickling to death 
 - or by penalty not less than a keg (25 ltr ~= 6 gal) of beer due for
the next MTD developer meeting scheduled for September/05 at my place.
