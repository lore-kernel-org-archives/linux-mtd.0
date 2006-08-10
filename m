Received: from fitch2.uni2.net ([130.227.52.102])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GB65N-0007JK-Qn
	for linux-mtd@lists.infradead.org; Thu, 10 Aug 2006 04:40:20 -0400
Received: from [130.228.251.10] (unknown [130.228.251.10])
	by fitch2.uni2.net (Postfix) with SMTP id 5C014128B39E
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Aug 2006 10:12:55 +0200 (CEST)
From: KimM <kmnet1@gmail.com>
Subject: Dynamic MTD partition tables in Linux
Date: Thu, 10 Aug 2006 10:12:55 +0200
Message-Id: <pan.2006.08.10.08.12.54.851351@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all

I need support for dynamic MTD partition tables in Linux. Currently there's four
ways of doing this: cmdlineparsing, Redboot, ARM way or my own way. 

For various reasons I won't use the cmdline, so it's either Redboot or ARM, in which
case my preference is Redboot since I assume that it's more likely to be maintained in
the future. Unfortunately I do not use Redboot, but u-boot, so I have to develop
my own tool for writing the partition tables.

Of course, there are several ways to go about this, but I prefer a generic Linux
tool which can create/modify the partition table. This way I can run the tool
on both my host and target and create partitions as images or at runtime.

But before I go ahead, I want to get some opinions whether to use the Redboot 
or ARM tables. And of course, I would very must like to know if a 
tool already exists...:)

Thanks
KimM
