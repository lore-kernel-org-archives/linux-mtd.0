Received: from sj-iport-1-in.cisco.com ([171.71.176.70]
	helo=sj-iport-1.cisco.com)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GQtUO-0004qM-HI
	for linux-mtd@lists.infradead.org; Fri, 22 Sep 2006 23:27:21 +0100
Received: from sj-core-5.cisco.com (sj-core-5.cisco.com [171.71.177.238])
	by sj-dkim-2.cisco.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8MMQGI7027397
	for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2006 15:26:16 -0700
Received: from xbh-sjc-231.amer.cisco.com (xbh-sjc-231.cisco.com
	[128.107.191.100])
	by sj-core-5.cisco.com (8.12.10/8.12.6) with ESMTP id k8MMQG1E023632
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Sep 2006 15:26:16 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: MTD Partitions
Date: Fri, 22 Sep 2006 15:26:15 -0700
Message-ID: <ED07EE9DB42A8945877C9794BA15040805D582@xmb-sjc-229.amer.cisco.com>
From: "Nikhil Bansal \(nikbansa\)" <nikbansa@cisco.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>From what I understand you need to provide the partitioning details of
MTD devices at the compile time. I was wondering if there is any way to
partition a flash device at runtime based on the sectors. For Example:
partition 1 from sector 1 to sector 10, partition 2 from sector 11 to
sector 20.=20

The thing is that we have a board with a flash chip on it and
configuration of this chip may vary based on several factors. I don't
have the luxury of compiling the kernel for each such requirement :( I
think I read somewhere that at this point, partitioning can be done at
compile time only but just wanted to confirm.

By the way, we can keep the number of partitions fixed but size needs to
be varied. Please let me know if it can be done.

Thanks in advance,
Nikhil
