Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SDkKx-0000yA-Iv
 for linux-mtd@lists.infradead.org; Fri, 30 Mar 2012 22:30:28 +0000
Received: by bkcjk13 with SMTP id jk13so1292851bkc.36
 for <linux-mtd@lists.infradead.org>; Fri, 30 Mar 2012 15:30:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5D308BD40154E4439D82454FE483A5020655576C@EVS4.nam.ci.root>
References: <5D308BD40154E4439D82454FE483A5020655576C@EVS4.nam.ci.root>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 30 Mar 2012 18:30:03 -0400
Message-ID: <CAMjpGUenHB6VU7k84E1Qdh+h6V3C1ZY1DVkV3rBmMfCueh2c4A@mail.gmail.com>
Subject: Re: User error with fw_printenv - I hope
To: "Bishop, Mark" <Mark.Bishop@cooperindustries.com>
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

On Fri, Mar 30, 2012 at 16:54, Bishop, Mark wrote:
> I am trying to read my uboot environment from userspace.=C2=A0 Not too su=
ccessful.
>
> root:/> cat /proc/mtd
> dev:=C2=A0=C2=A0=C2=A0 size=C2=A0=C2=A0 erasesize=C2=A0 name
> mtd0: 00080000 00020000 "bootloader(nand)"
> mtd1: 00800000 00020000 "linux kernel(nand)"
> mtd2: 06400000 00020000 "file system(nand)"
> mtd3: 09380000 00020000 "file system(ubifs)"
>
> From my uboot config:
> #define CONFIG_ENV_OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x60000
> #define CONFIG_ENV_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=
x20000
>
> Try #1
> root:/> cat /etc/fw_env.config
> /dev/mtd0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x60000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x20000=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x20000=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
>
> root:/> ./fw_printenv
> Cannot read bad block mark: Invalid argument

strace it to see what is actually complaining
-mike
