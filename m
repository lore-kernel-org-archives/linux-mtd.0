Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AGcES-0003wi-VS
	for <linux-mtd@lists.infradead.org>; Mon, 03 Nov 2003 10:46:49 +0000
From: Ian Campbell <icampbell@arcom.com>
To: mtd list <linux-mtd@lists.infradead.org>
Message-Id: <1067856319.11251.47.camel@linuxdev.icampbell.arcom.cc>
Mime-Version: 1.0
Date: Mon, 03 Nov 2003 10:45:20 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: ilookup used in fs/jffs2/gc.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

JFFS2 in CVS has recently (version 1.122) started using the ilookup
function which is not available in any 2.4 kernels (at least it isn't in
2.4.22 or 2.4.19)

Is a compatmac.h entry likely to be possible for this function, or is
there some other work around which can be used on 2.4 kernels? 

Cheers,
Ian.
-- 
Ian Campbell, Senior Design Engineer

Arcom, Clifton Road, 			Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom	Phone:  +44 (0)1223 411 200


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.

This message has been checked for all viruses by MessageLabs Virus Control Centre.
