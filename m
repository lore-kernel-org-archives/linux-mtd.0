Received: from sccrmhc01.attbi.com ([204.127.202.61])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 187WhX-00051T-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Nov 2002 07:58:43 +0000
Message-Id: <5.1.0.14.2.20021101002546.03b61038@pop.prodigy.net>
Date: Fri, 01 Nov 2002 00:28:22 -0800
To: Anders Olsson <Anders.Olsson@matchpointds.com>
From: Eugene Surovegin <ebs@innocent.com>
Subject: Re: MTD devices at the wrong place
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <1036137508.26545.46.camel@Europa.matchpointds>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

At 11:58 PM 10/31/2002, you wrote:

>##I guess it's ok to just create one device? or do I have to create them
>all? Or a directory structure under /dev/mtd0 and /dev/mtd1
>mknod /dev/mtd4 c 90 4

/dev/mtd4 should be c 90 8


  Eugene Surovegin <mailto:ebs@innocent.com>
