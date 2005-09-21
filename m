Received: from londo.lunn.ch ([80.238.139.98])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIBuD-0006e4-S4
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 17:13:47 -0400
Received: from lunn by londo.lunn.ch with local (Exim 3.36 #1 (Debian))
	id 1EIBuA-0002z5-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Sep 2005 23:13:26 +0200
Date: Wed, 21 Sep 2005 23:13:26 +0200
To: linux-mtd@lists.infradead.org
Message-ID: <20050921211326.GK8421@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: Andrew Lunn <andrew@lunn.ch>
Subject: Another compiler error: sumtool.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Folks

Thanks to Artem's fix i can now compile jffs2 without write buffer
support. However the sumtool does not compile.....

lunn@londo:~/pkgs/mtd/mtd/util$ make
gcc -I../include -O2 -Wall -g -c -o sumtool.o sumtool.c -g -Wp,-MD,.sumtool.c.dep
sumtool.c:66: error: static declaration of 'target_endian' follows non-static declaration../include/mtd/jffs2-user.h:22: error: previous declaration of 'target_endian' was here
make: *** [sumtool.o] Error 1

The easy fix is to make target_endian not static in sumtool.c, but is
that the correct fix?

        Thanks
                Andrew
