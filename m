Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gX0h3-0005RL-Q7
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2018 09:20:39 +0000
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?5q2m5LqVIOWFi+aYjg==?= <takei744@oki.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Questions about ubifs,ubi and mtd?
Date: Wed, 12 Dec 2018 10:20:23 +0100
Message-ID: <3417318.kOS8JojacP@blindfold>
In-Reply-To: <TY2PR01MB270060F7EC282F9C7C705D409DA70@TY2PR01MB2700.jpnprd01.prod.outlook.com>
References: <TY2PR01MB27000DE339F2C8C63CBEF4C49DA60@TY2PR01MB2700.jpnprd01.prod.outlook.com>
 <CAFLxGvzp_FmaoADzLG0HnBSJsz45NDU3kH+YPr6eUAzOo4uJrw@mail.gmail.com>
 <TY2PR01MB270060F7EC282F9C7C705D409DA70@TY2PR01MB2700.jpnprd01.prod.outlook.com>
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

Hello Katsuaki Takei,

Am Mittwoch, 12. Dezember 2018, 02:07:33 CET schrieb =E6=AD=A6=E4=BA=95 =E5=
=85=8B=E6=98=8E:
> Dear Richard,
>  Thank you for your comment.
>  We are using kernel 3.2.26 for reasons.
>  I can not update the kernel right now.

3.2.x is dead.
It contains bugs, security problems, is unmaintained, etc...
Shipping with 3.2.x is a very bad idea.
=20
> To everyone
> Is there a lot of fixes and patches for processing that causes abnormal b=
ehavior as I asked you?
> We hope to solve the problem by patch to kernel 3.2.26. if possible.
> Shyly, I have little experience of developing ubifs or ubi, and I can not=
 yet figure out which program is likely to be involved in this abnormal ope=
ration(ref. Note*).
>=20
> Note*:
> Nevertheless, when loading our program from 'rootfs-a', trying to read th=
e inode with the ubifs_read_node() function will result in "bad node type" =
(ex: 193 but expected 9) and the LEB can not be read with the expected valu=
e. (Even though you do not have write access to rootfs) In addition, the fi=
le size may be 0 byte in some cases.

The problem could be anything.
Both UBI and UBIFS faced tons of fixes over the last years.
Maybe it is also bug somewhere else.

You could try backporting the whole UBI and UBIFS subsystems to your kernel.

Thanks,
//richard
