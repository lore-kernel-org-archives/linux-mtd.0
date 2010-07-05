Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OVuXu-0000iU-Ia
	for linux-mtd@lists.infradead.org; Mon, 05 Jul 2010 22:53:51 +0000
Received: by gwaa18 with SMTP id a18so958550gwa.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Jul 2010 15:53:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4822394121cd0a8f08b0bd3ecd6af199@localhost>
References: <4822394121cd0a8f08b0bd3ecd6af199@localhost>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 5 Jul 2010 18:53:29 -0400
Message-ID: <AANLkTikubvQsapLc_wumRbbF0KTcHlSb2DnVBM-UAzl8@mail.gmail.com>
Subject: Re: [PATCH 1/5] mtd-utils: move libmtd source files to lib/
	subdirectory
To: Kevin Cernekee <cernekee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com, saeed.bishara@gmail.com,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 5, 2010 at 18:10, Kevin Cernekee wrote:
> Source files for libmtd, crc32, and fec are scattered throughout the
> tree. =C2=A0Move them to a central location so they can be built into a
> common "libmtd.a" library used by all mtd-utils programs.
>
> This patch only renames/deletes files and does not change the content.

might wan to use the -M flag next time
-mike
