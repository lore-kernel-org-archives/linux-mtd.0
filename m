Received: from motgate2.mot.com ([136.182.1.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17rhtj-0003ng-00
	for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 17:41:56 +0100
Received: [from pobox4.mot.com (pobox4.mot.com [10.64.251.243]) by motgate2.mot.com (motgate2 2.1) with ESMTP id JAA25003 for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 09:42:15 -0700 (MST)]
Received: [from zat01exm01.vienna.ecid.cig.mot.com (c3po.vienna.ecid.cig.mot.com [140.101.192.3]) by pobox4.mot.com (MOT-pobox4 2.0) with ESMTP id JAA05117 for <linux-mtd@lists.infradead.org>; Wed, 18 Sep 2002 09:41:53 -0700 (MST)]
Message-ID: <8D4D5329976AD311B47800508B5D521D0329D643@c3po.vienna.ecid.cig.mot.com>
From: Schlager Kristian-KSCHLAG1 <Kristian.Schlager@motorola.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS(2) on Compact Flash
Date: Wed, 18 Sep 2002 18:41:46 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I am running Linux on a Jumptec Dimm PC with built-in Compact Flash.
As powerfailures cannot be avoided, the ext2 fs gets screwed up after some time.
Can I use JFFS on the Compact Flash?
I have read Simon Evans' posting on his mtd/block driver (June 2001) and the follow ups.
One poster was stating that it makes no sense to run JFFS on CF.

Does ext3 (or do other journaling fs) indead perform as well as JFFS(2) regarding stability after power failures?

Or is the only save way to put all temporay files on ramdisk and have the CF mount read-only?


Kristian Schlager
