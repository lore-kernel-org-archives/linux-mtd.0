Received: from [212.58.137.10] (helo=trajan.ag-netcom.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AFJyT-0003LP-LO
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2003 21:04:57 +0000
Received: from 192.168.0.4 (dsl-217-155-44-202.zen.co.uk [217.155.44.202])
	by trajan.ag-netcom.net (8.12.8p1/8.12.8) with ESMTP id h9UL5ERs041422
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2003 21:05:14 GMT
	(envelope-from david@avoncliff.com)
From: david stevenson <david@avoncliff.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 30 Oct 2003 21:03:42 +0000
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200310302103.42918.david@avoncliff.com>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: zlib versions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Could someone please educate me on zlib?

I can compile kernel 2.4.21 with MTD updated from tarball 20031021 with jff2 
with no errors.
But when I try and compile the utils from the same tar ball, using the same 
kernel headers I get error file not found zlib.h.

I can compile the utils against the kernel headers on my host 2.4.20 without 
error. But I guess then the binaries will not run on the target machine?

The difference appears to be linux/zlib v1.1.3 or /zlib v1.1.4 but I am not 
sure what I should use to get utils that run.
Thanks
David
