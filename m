Received: from zproxy.gmail.com ([64.233.162.196])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EfhbF-0001Me-Hj
	for linux-mtd@lists.infradead.org; Fri, 25 Nov 2005 12:43:15 -0500
Received: by zproxy.gmail.com with SMTP id m22so1855509nzf
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Nov 2005 09:43:04 -0800 (PST)
Message-ID: <7febb0a10511250943jc23af8p99c6fe048654f168@mail.gmail.com>
Date: Sat, 26 Nov 2005 00:43:02 +0700
From: HS8JCV <hs8jcv@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Warning: DQ5 raised
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all
I use nor flash of SST39VF3201.
I create 3 partition.
Last partition size 256K.and map to jffs2.img(size 256K)
After I mount it.(mount -t jffs2 /dev/mtdblock/3 /flashdisk).
I got this message.

ash was programming.
Internal flash device timeout occurred or write operation was performed whi=
le fl
ash was programming.
Internal flash device timeout occurred or write operation was
performed while flash was programming.
Warning: DQ5 raised while program operation was in progress, however
operation completed OK
Internal flash device timeout occurred or write operation was
performed while flash was programming.
Internal flash device timeout occurred or write operation was
performed while flash was programming.

I can read/write this partition.
but,I still got this message.

How to fix it?

Thank you for advantage
Mr.X
