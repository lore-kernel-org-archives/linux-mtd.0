Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaWRT-0001nv-Ko
	for linux-mtd@lists.infradead.org; Sat, 25 Jun 2011 17:14:48 +0000
Received: by iyn15 with SMTP id 15so3804139iyn.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 25 Jun 2011 10:14:42 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <BANLkTinJkfNpJ-13yTwpx9u-FaX1TKScuw@mail.gmail.com>
References: <1308983405-27064-1-git-send-email-vapier@gentoo.org>
	<1308984770-6594-1-git-send-email-vapier@gentoo.org>
	<1308986033.23868.8.camel@koala>
	<BANLkTinJkfNpJ-13yTwpx9u-FaX1TKScuw@mail.gmail.com>
From: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 25 Jun 2011 13:08:10 -0400
Message-ID: <BANLkTin+Or+320Uz5bSj26yFJE2BZgO2dA@mail.gmail.com>
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

On Sat, Jun 25, 2011 at 03:48, Mike Frysinger wrote:
> On Sat, Jun 25, 2011 at 03:13, Artem Bityutskiy wrote:
>> =C2=A0CC =C2=A0 =C2=A0 =C2=A0ubi-utils/ubinize.o
>> In file included from ubi-utils/ubinize.c:38:0:
>> ./ubi-utils/include/libiniparser.h:35:24: fatal error: dictionary.h: No
>> such file or directory
>> compilation terminated.
>> make: *** [/home/dedekind/git/mtd-utils/ubi-utils/ubinize.o] Error 1
>
> weird ... i'm not seeing that. =C2=A0i'll double check my system in the
> morning to see what's going on.

i had /usr/include/dictionary.h which provided the same thing

so how to solve ... i dont quite understand the file layout in
ubi-utils.  why isnt dictionary.h in the include/ subdir ?  after all,
that's where the include is coming from:
ubi-utils/include/libiniparser.h.
-mike
