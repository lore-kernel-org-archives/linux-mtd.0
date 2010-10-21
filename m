Received: from smtp.scorch.co.nz ([27.110.127.199] helo=scorch.co.nz)
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8m44-0007ia-Q9
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 03:43:41 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Issues with ubi utils Makefile
Date: Thu, 21 Oct 2010 16:43:33 +1300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201010211643.33332.manningc2@actrix.gen.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All

I'm getting some errors trying to mount a ubinized volume with a more recent 
kernel and think it might be due to problems in the ubi utils distributed 
with Ubuntu Meerkat.

I thus thought I'd build from git

When I do a make install from inside the mtd-utils/ubi-utils it tries to place 
the binaries in /usr/local//usr/sbin.

Same happens if I try make install from mtd-utils/

Is something broken or am I driving it incorrectly?


-- Charles
