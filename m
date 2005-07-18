Received: from wproxy.gmail.com ([64.233.184.196])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DuceI-0004zs-FT
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2005 16:55:40 -0400
Received: by wproxy.gmail.com with SMTP id i20so1071264wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Jul 2005 13:55:30 -0700 (PDT)
Message-ID: <2db32b72050718135560ae235c@mail.gmail.com>
Date: Mon, 18 Jul 2005 13:55:29 -0700
From: rolf liu <rolfliu@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Cc: rolf liu <rolfliu@gmail.com>
Subject: boot error using /dev/mtdblock0
Reply-To: rolf liu <rolfliu@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using /dev/mtdblock0 as the root, and put a jffs2 image on it.
but when the kernel boots up, it panic:

Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(3=
1,0)

Any suggestion?
