Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70]
	helo=mail.dev.rtsoft.ru)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AF7nh-000160-I2
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2003 08:05:01 +0000
From: Ruslan Satlykov <ruslics@yahoo.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 30 Oct 2003 11:04:00 +0300
MIME-Version: 1.0
Message-Id: <200310301104.00496.ruslics@yahoo.com>
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Subject: read_inode() after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  To David Woodhouse,

  In TODO file from JFFS2 filesystem drivers' source tree, you wrote abou=
t=20
twice flash readings right after mount. Could you please explain this? An=
d=20
how it interference with jffs2_scan_medium()?

  Thank you,
  Ruslan
