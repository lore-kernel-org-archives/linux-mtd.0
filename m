Received: from zproxy.gmail.com ([64.233.162.202])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DY0yw-0005IK-KF
	for linux-mtd@lists.infradead.org; Tue, 17 May 2005 08:15:31 -0400
Received: by zproxy.gmail.com with SMTP id 34so1588254nzf
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 May 2005 05:15:36 -0700 (PDT)
Message-ID: <7febb0a1050517051514a4e0d1@mail.gmail.com>
Date: Tue, 17 May 2005 19:15:36 +0700
From: HS8JCV <hs8jcv@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: How to use jffs2.?
Reply-To: HS8JCV <hs8jcv@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all.
I use AT91RM9200DK and linux version 2.4.27-vrs1.
This kernel support jffs2 because I saw at startup(dmesg).
but I run command cat /proc/mtd and df -h .
cat /proc/mtd
dev:    size   erasesize  name

df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/root                14.5M      6.7M      7.8M  46% /

Flash on my board 8 M (intel E28F640)
I will save data into my board.

How to use jffs2.?
Please,suggest me for next step.

Best Regard
Mr.X
