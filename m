Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QwDWO-0007Gk-6Y
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 13:29:32 +0000
Received: by fxd20 with SMTP id 20so1221054fxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Aug 2011 06:29:30 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 24 Aug 2011 15:29:30 +0200
Message-ID: <CAHRBi55AcPqscA3P1h54yvz1s_EyV=FweJTC-ze6Lg0Wht-kWw@mail.gmail.com>
Subject: sector erase frequency
From: Ryan Raasch <ryan.raasch@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am trying to "measure" or get an idea how often a particular
writable partition (NOR flash, JFFS2) is being erased. This device needs to run
a while, so we need to have some idea how often this
partition's sectors are erased (16 MB partition, 128 KB size sector).

My first thought is to hack the mtd devices (cmd set 001)
 and have some type of counter for each sector.
The largest size of the partition for this would be 16 MB. But
i haven't quite figured out how to get a mtd partition pointer within
the mtdchar ioctl. There is only an offset.

Are there any ideas on how best to tackle this? This is purely for
testing/sanity issues, not to be used in releases.

Thanks,
Ryan
