Received: from xproxy.gmail.com ([66.249.82.193])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7RZW-0001J4-KW
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 01:43:46 -0400
Received: by xproxy.gmail.com with SMTP id i30so295064wxd
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2005 22:43:38 -0700 (PDT)
Message-ID: <802ad8b60508222243345b5e18@mail.gmail.com>
Date: Tue, 23 Aug 2005 11:13:38 +0530
From: Suresh K <sureshkanniappan@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: JFFS2 Mount issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hai,

I am looking for reliable compressed R/W file system. I came to know
that JFFS2 is the reliable one. I started implementing the same in
2.4.26 kernel. Created a JFFS2 image of 80MB and copied to one of
partition in Hard Disk. I am trying to mount a 80MB JFFS2 image in
Hard disk. The time taken to mount the JFFS2 image is 30 seconds.

I tried with 2.6.10 kernel also. The time taken to mount the JFFS2
image is too large. Also i am not able to create multiple JFFS2
partition.
        cp jffs2.imf /dev/mtdblock0 - Copied the JFFS2 image to one
partition in Hard Disk
        cp jffs2.imf /dev/mtdblock1 - cannot create regular file
'/dev/mtdblock1' : No Such Device or Address

How cai reduce the more mounting time. Kindly help me in this regard.

Regards,
K. Suresh
