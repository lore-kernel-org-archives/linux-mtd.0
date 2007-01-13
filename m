Received: from an-out-0708.google.com ([209.85.132.241])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H5cV1-0000K9-ST
	for linux-mtd@lists.infradead.org; Sat, 13 Jan 2007 01:36:23 -0500
Received: by an-out-0708.google.com with SMTP id d40so1139194and
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Jan 2007 22:36:18 -0800 (PST)
Received: from pooky.senux.com (localhost.localdomain [127.0.0.1])
	by pooky.senux.com (8.13.7/8.13.7) with ESMTP id l0D6aTTB013321
	(version=TLSv1/SSLv3 cipher=DHE-DSS-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Sat, 13 Jan 2007 15:36:29 +0900
Received: (from senux@localhost)
	by pooky.senux.com (8.13.7/8.13.7/Submit) id l0D6aT5d013320
	for linux-mtd@lists.infradead.org; Sat, 13 Jan 2007 15:36:29 +0900
Date: Sat, 13 Jan 2007 15:36:29 +0900
From: Seongsu Lee <senux@senux.com>
To: linux-mtd@lists.infradead.org
Subject: What is ANAND header?
Message-ID: <20070113063629.GA13015@pooky.senux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I've a embedded board with 1GB NAND flash memory from Samsung.
(The model number of the flash memory is
 SAMSUNG 640, K9K8G08U0A)
I want to use NFTL to mount the flash memory by FAT filesystem.

But NFTL does not work for me. I found that MTD failed to
find boot record in nftlmount.c source.

It try to find out ANAND header from the MTD device. But it fails
to find out. 

	if (retlen < 6 || memcmp(buf, "ANAND", 6)) {
		continue;
	}

What is ANAND header?

Is it possible to use NFTL for mounting FAT on MTD device in my
environment?

Thank you in advance!

-- 
Seongsu's blog - http://www.senux.com/
Some people have parts that are so private they
themselves have no knowledge of them.
