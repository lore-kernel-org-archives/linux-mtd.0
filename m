Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSWFg-00024D-O2
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 14:53:17 +0000
Received: by wyf22 with SMTP id 22so546588wyf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Dec 2010 06:53:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=DmECiCVyZ61Cc0=66VANyrQV9xwzYjDceA8=M@mail.gmail.com>
References: <AANLkTi=DmECiCVyZ61Cc0=66VANyrQV9xwzYjDceA8=M@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 14 Dec 2010 09:52:53 -0500
Message-ID: <AANLkTikJ3UTQ-D01FX8fSEGgcuG-fXEhAw6h4z9pwkRX@mail.gmail.com>
Subject: Re: Faster flash_eraseall for NOR flash
To: =?UTF-8?Q?=C3=98yvind_Harboe?= <oyvind.harboe@zylin.com>
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

On Tue, Dec 14, 2010 at 04:20, =C3=98yvind Harboe wrote:
> CFI erase performance can be 10x slower than write
> performance on CFI flashes.
>
> I've added an option to skip already erased CFI blocks. This
> includes checking if the JFFS2 cleanmarker is written.

i dont think -f/--fast is the right name.  how about something a bit
more explicit like --skip-erased ?

why cant this also be used for NAND ?  all the NAND devices i use have
0xff when erased.

other random problems:
 - the coding style of this patch is incorrect.  please review the
style found in the rest of the file.  such as brace placement and
spaces in function calls.
 - your patch is not against the master branch -- there is no
"flash_eraseall.c" file anymore.
 - once you update, your code will look vastly different as there are
helpers to do memory allocation/error output/etc...
 - better to use pread() rather than lseek()/read().
-mike
