Received: from wproxy.gmail.com ([64.233.184.198])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DvJVe-0003Se-Jd
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2005 14:41:39 -0400
Received: by wproxy.gmail.com with SMTP id i20so1524424wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jul 2005 11:41:28 -0700 (PDT)
Message-ID: <2db32b72050720114074d1badb@mail.gmail.com>
Date: Wed, 20 Jul 2005 11:40:56 -0700
From: rolf liu <rolfliu@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: rolf liu <rolfliu@gmail.com>
Subject: suddently, can't use "cp jffs2.img /dev/mtd0" anymore
Reply-To: rolf liu <rolfliu@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yesterday, I can use "cp jffs2.img  /dev/mtd0" to copy the jffs2 image
to mtd. Today, I applied the cvs snapshot of mtd to kernel and
compiled it. Suddenly, the "cp" command stops working.

it tells me:
MTD do_write_buffer(): software timeout
cp: writing '/dev/mtd0' : Input/output error

any idea?

thanks
