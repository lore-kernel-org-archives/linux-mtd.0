Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaNcD-0006rM-HY
	for linux-mtd@lists.infradead.org; Sat, 25 Jun 2011 07:49:18 +0000
Received: by iyn15 with SMTP id 15so3565509iyn.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Jun 2011 00:49:14 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1308986033.23868.8.camel@koala>
References: <1308983405-27064-1-git-send-email-vapier@gentoo.org>
	<1308984770-6594-1-git-send-email-vapier@gentoo.org>
	<1308986033.23868.8.camel@koala>
From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 25 Jun 2011 03:48:54 -0400
Message-ID: <BANLkTinJkfNpJ-13yTwpx9u-FaX1TKScuw@mail.gmail.com>
Subject: Re: [PATCH 1/2 v2] rewrite build system to avoid recursion
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 25, 2011 at 03:13, Artem Bityutskiy wrote:
> =C2=A0CC =C2=A0 =C2=A0 =C2=A0ubi-utils/ubinize.o
> In file included from ubi-utils/ubinize.c:38:0:
> ./ubi-utils/include/libiniparser.h:35:24: fatal error: dictionary.h: No
> such file or directory
> compilation terminated.
> make: *** [/home/dedekind/git/mtd-utils/ubi-utils/ubinize.o] Error 1

weird ... i'm not seeing that.  i'll double check my system in the
morning to see what's going on.
-mike
