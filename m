Received: from zproxy.gmail.com ([64.233.162.200])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DtAf1-0003BW-K5
	for linux-mtd@lists.infradead.org; Thu, 14 Jul 2005 16:50:26 -0400
Received: by zproxy.gmail.com with SMTP id 34so271833nzf
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Jul 2005 13:50:18 -0700 (PDT)
Message-ID: <7febb0a1050714135049067b71@mail.gmail.com>
Date: Fri, 15 Jul 2005 03:50:17 +0700
From: HS8JCV <hs8jcv@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: How to flash map.?
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
My board use nor flash (SST39VF3201).
It use address 10000000 to 103FFFFF.
How to map it for use jffs2.?
Which file change for complie new kernel.?
1.boot.bin
2.u-boot.gz
3.uImage(Kernel).
4.ramdisk
5.save data(jffs2)

Thank you and Regard
Mr.X
