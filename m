Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dtcp4-0002Ih-QO
 for linux-mtd@lists.infradead.org; Sun, 17 Sep 2017 16:53:38 +0000
From: Richard Weinberger <richard@nod.at>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Hyunchul Lee <hyc.lee@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubifs: Fix uninitialized variable in search_dh_cookie()
Date: Sun, 17 Sep 2017 18:53:28 +0200
Message-ID: <3629896.LZWARU6us7@blindfold>
In-Reply-To: <1505637141-4700-1-git-send-email-geert@linux-m68k.org>
References: <1505637141-4700-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Sonntag, 17. September 2017, 10:32:20 CEST schrieb Geert Uytterhoeven:
> fs/ubifs/tnc.c: In function =E2=80=98search_dh_cookie=E2=80=99:
> fs/ubifs/tnc.c:1893: warning: =E2=80=98err=E2=80=99 is used uninitialized=
 in this function
>=20
> Indeed, err is always used uninitialized.
>=20
> According to an original review comment from Hyunchul, acknowledged by
> Richard, err should be initialized to -ENOENT to avoid the first call to
> tnc_next().  But we can achieve the same by reordering the code.
>=20
> Reported-by: Hyunchul Lee <hyc.lee@gmail.com>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Compile-tested only.
>=20
> Still needed in v4.14-rc1, so I'm sending out the patch I wrote in July.
> This avoids initializing err at the top, so we don't loose the ability to
> catch future uninitialized use.

Geez. ;-\
Applied for 4.14-rc2.

Thanks,
//richard
