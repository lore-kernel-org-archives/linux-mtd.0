Received: from wsgw1.atc.army.mil ([134.194.13.55])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVyNj-0001yO-V3
	for linux-mtd@lists.infradead.org; Thu, 03 Jun 2004 16:00:10 -0400
Received: from atc-smtp1.atc.army.mil ([134.194.25.160])
	by wsgw1.atc.army.mil (SMSSMTP 4.0.0.59) with SMTP id
	M2004060316102532325
	for <linux-mtd@lists.infradead.org>; Thu, 03 Jun 2004 16:10:25 -0400
Message-ID: <EFF9A3506F74924AB5CC77BDC66E79351812AE@atcml01.atc.army.mil>
From: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
To: linux-mtd@lists.infradead.org
Date: Thu, 3 Jun 2004 16:01:45 -0400 
MIME-Version: 1.0
Content-Type: text/plain
Subject: Another mkfs.jffs2 question pagesize verse size of image?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

  I run mkfs.jffs2 on my host.  When I use defaults to create image and the
try to write to the DOC using nandwrite I get input file is not page
aligned.  When I try to create the jffs2 image using the -s 512 and -e 32768
my image grows to large.  Should the values of page size be 512 bytes " from
documentation pdf file" and 32768 erase size as reported by mtd_debug???????

Thanks
John
