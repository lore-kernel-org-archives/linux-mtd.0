Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ofv89-0002Z5-QK
	for linux-mtd@lists.infradead.org; Mon, 02 Aug 2010 13:32:39 +0000
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 4BCDF185820
	for <linux-mtd@lists.infradead.org>;
	Mon,  2 Aug 2010 09:32:35 -0400 (EDT)
Received: from [10.2.11.102] (unknown [195.59.102.251])
	by www.fastmail.fm (Postfix) with ESMTPSA id B32504DEC1
	for <linux-mtd@lists.infradead.org>;
	Mon,  2 Aug 2010 09:32:34 -0400 (EDT)
Subject: Is repartitioning possible while one of the partitions is mounted?
From: Tim Cussins <timcussins@eml.cc>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 02 Aug 2010 14:32:33 +0100
Message-ID: <1280755953.2174.24.camel@pc816>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I just spotted post regarding upcoming Runtime Partitioning Support
(http://lists.infradead.org/pipermail/linux-mtd/2010-July/031200.html)

After taking a cursory glance at the patch it's not immediately obvious
( uh, to me anyway :D ) whether you can create/delete partitions while
a filesystem (e.g. rootfs) is mounted from another partition on the same
mtd device.

Under what conditions can you create/delete partitions?

Cheers,
Tim
