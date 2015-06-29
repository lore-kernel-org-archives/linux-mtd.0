Received: from mail-vn0-x22e.google.com ([2607:f8b0:400c:c0f::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9Srx-0004Xf-QH
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2015 06:48:42 +0000
Received: by vnbf62 with SMTP id f62so2224103vnb.9
 for <linux-mtd@lists.infradead.org>; Sun, 28 Jun 2015 23:48:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF36288@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF36288@NTXXIAMBX02.xacn.micron.com>
Date: Mon, 29 Jun 2015 08:48:17 +0200
Message-ID: <CAFLxGvxE+HMP9iOfBUVWE0yBABezZ+uZ2bh_i+_FYHrPGZtBqw@mail.gmail.com>
Subject: Re: mount_ubifs: failed to mount ubifs
From: Richard Weinberger <richard.weinberger@gmail.com>
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 29, 2015 at 7:03 AM, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (bean=
huo)
<beanhuo@micron.com> wrote:
> Hello:
> Currently ,I mainly focus on ubi powerloss solution for MLC nand ,now I
> Have a problem about master node, below is log.
>
> When PEB 354:4096 read failed,and ubi will regard this block a corrupted =
block.
> Ubi will not recover it, but reserve it.
> Maybe this block contains master node, so will mount failure?

UBI does not expect that a block turns bad/unreadable all of a sudden.

> Why ubi not try to recover such block?

How would it? If there is an ECC error UBI cannot do much.

The more interesting question is, why went it unreadable?
You said this is MLC nand, UBI was designed for SLC.
MLC is still unsupported, especially if you need to deal with powercuts.

As you work for Micron, it would be wonderful if you could give us more det=
ails
on the MLC nand and what Micron recommends to deal with that.

--=20
Thanks,
//richard
