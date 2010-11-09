Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PFksh-0005y1-9z
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2010 09:52:48 +0000
Received: by wwb39 with SMTP id 39so1060957wwb.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Nov 2010 01:52:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1288772847-8120-9-git-send-email-computersforpeace@gmail.com>
References: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
	<1288772847-8120-9-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 9 Nov 2010 04:51:36 -0500
Message-ID: <AANLkTinGe84r8mo84HQVikPqQxLrKnwrXa20E_rfN=0f@mail.gmail.com>
Subject: Re: [PATCH 09/10] mtd-utils: nanddump: type consistency
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, Jehan Bing <jehan@orb.com>,
	linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 3, 2010 at 04:27, Brian Norris wrote:
> =C2=A0nandwrite.c | =C2=A0 =C2=A06 +++---

the subject says "nanddump" ...

> --- a/nandwrite.c
> +++ b/nandwrite.c
> @@ -262,7 +262,7 @@ int main(int argc, char * const argv[])
> =C2=A0 =C2=A0 =C2=A0 =C2=A0long long blockstart =3D -1;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_dev_info mtd;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_oob_buf oob;
> - =C2=A0 =C2=A0 =C2=A0 loff_t offs;
> + =C2=A0 =C2=A0 =C2=A0 long long offs;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int oobinfochanged =3D 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nand_oobinfo old_oobinfo;

i dont think this is quite right.  "offs" is given to an ioctl which
takes __kernel_loff_t ... we shouldnt assume "long long" and
"__kernel_loff_t" are always the same.
-mike
