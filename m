Received: from zproxy.gmail.com ([64.233.162.198])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ESfAz-0005Wf-1c
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2005 14:30:08 -0400
Received: by zproxy.gmail.com with SMTP id s18so291195nze
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2005 11:29:44 -0700 (PDT)
Message-ID: <7febb0a10510201129t6393fb1eo3229526112c177a9@mail.gmail.com>
Date: Fri, 21 Oct 2005 01:29:43 +0700
From: HS8JCV <hs8jcv@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Mountting partition error.?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all.
I mount /dev/mtdblock/3 /mnt
I got this message

[root@XXX/root]$mount /dev/mtdblock/0 /mnt/
mtdblock_open
ok
mtdblock: read on "Physically mapped flash" at 0x0, size 0x1000
mtdblock: read on "Physically mapped flash" at 0x2000, size 0x1000
mtdblock: read on "Physically mapped flash" at 0x3000, size 0x1000
mtdblock: read on "Physically mapped flash" at 0x8000, size 0x1000
mtdblock: read on "Physically mapped flash" at 0x9000, size 0x1000
mtdblock_release
ok
mtdblock_open
ok
[root@XXX /rooIntternal flash device timeout occurred or write
operation was performed while flash was programming.
]$Internal flash device timeout occurred or write operation was
performed while flash was programming.
Internal flash device timeout occurred or write operation was
performed while flash was programming.
Internal flash device timeout occurred or write operation was
performed while flash was programming.
Internal flash device timeout occurred or write operation was
performed while flash was programming.
Internal flash device timeout occurred or write operation was
performed while flash was programming.

Why system show this message.?
How to resolve this error.?

Regard
Mr.X
