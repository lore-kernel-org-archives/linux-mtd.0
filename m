Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBopp-0003UV-Tl
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 13:49:50 +0000
Received: by yic15 with SMTP id 15so1925839yic.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 06:49:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2285954c62e0401291aa3f5055bc79c6789149d7.1303115468.git.ext-andriy.shevchenko@nokia.com>
References: <1302783893.2796.27.camel@localhost>
	<802c3655ae5130e95b01e5004710f206a3d9ef9c.1303115468.git.ext-andriy.shevchenko@nokia.com>
	<2285954c62e0401291aa3f5055bc79c6789149d7.1303115468.git.ext-andriy.shevchenko@nokia.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 18 Apr 2011 09:49:27 -0400
Message-ID: <BANLkTik3bKP4=zBgqxpN2vNTWD5V5DzKAA@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] mkfs.jffs2: fix casting of __off64_t
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 18, 2011 at 04:31, Andy Shevchenko wrote:
> The casting of __off64_t to unsigned long potentially wrong for values hi=
gher
> than ULONG_MAX. =C2=A0Let's fix that.

i dont think this is the way to go.  on 64bit systems, long long is
128bits.  i imagine the way to go (assuming we're always using LFS) is
to use PRIu64 from inttypes.h

printf("\td %04o %9" PRIu64 "             %5d:%-3d %s\n",
    e->sb.st_mode & ~S_IFMT, (unsigned long long) e->sb.st_size,
    (int) (e->sb.st_uid), (int) (e->sb.st_gid),
    e->name);
-mike
