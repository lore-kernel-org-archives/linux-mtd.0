Received: from outbound.mailhop.org ([63.208.196.171])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GKsxK-000263-P7
	for linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 09:40:23 +0100
Received: from 84-216-44-250.sprayadsl.telenor.se ([84.216.44.250]
	helo=arbetsmyra.dyndns.org)
	by outbound.mailhop.org with esmtpa (Exim 4.51) id 1GKsw2-000NoB-UN
	for linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 04:39:03 -0400
Received: from there (sol-int [10.0.2.1])
	by arbetsmyra.dyndns.org (Postfix) with SMTP id B4DE55E7
	for <linux-mtd@lists.infradead.org>;
	Wed,  6 Sep 2006 10:38:58 +0200 (CEST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Ronny L Nilsson <rln-mtd@arbetsmyra.dyndns.org>
To: linux-mtd@lists.infradead.org
Subject: Is NAND MTD preemption safe?
Date: Wed, 6 Sep 2006 10:37:58 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20060906083858.B4DE55E7@arbetsmyra.dyndns.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi
I have a question about MTD, NAND and race conditions. Basically I'm 
wondering if the NAND support in MTD is preemption safe?

Scenario:
1) A NAND chip is splited in multiple partitions.

2) On each partition (/dev/mtdblockX) is a filesystem.

3) If one filesystem performs a write in the NAND chip, will the other 
filesystems temporarily be lock out? If preemption is enabled in the 
kernel I suspect races might otherwise occur (since addressing and 
command cycles of NANDS are quite lengthy).


Regards
/Ronny Nilsson
