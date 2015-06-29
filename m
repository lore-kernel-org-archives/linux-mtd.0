Received: from mail-vn0-x22c.google.com ([2607:f8b0:400c:c0f::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9T8s-0003z7-5i
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2015 07:06:10 +0000
Received: by vnbf62 with SMTP id f62so2275692vnb.9
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jun 2015 00:05:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF362BA@NTXXIAMBX02.xacn.micron.com>
References: <A765B125120D1346A63912DDE6D8B6310BF36288@NTXXIAMBX02.xacn.micron.com>
 <CAFLxGvxE+HMP9iOfBUVWE0yBABezZ+uZ2bh_i+_FYHrPGZtBqw@mail.gmail.com>
 <A765B125120D1346A63912DDE6D8B6310BF362BA@NTXXIAMBX02.xacn.micron.com>
Date: Mon, 29 Jun 2015 09:05:48 +0200
Message-ID: <CAFLxGvwuvZX+p=xnmYsG+jjrQ9N+rACem06g52=+nEUWjdK8sw@mail.gmail.com>
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

On Mon, Jun 29, 2015 at 9:03 AM, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (bean=
huo)
<beanhuo@micron.com> wrote:
>>As you work for Micron, it would be wonderful if you could give us more d=
etails on the MLC nand and what Micron recommends to deal with that.
>
> So far, I am also little know about ubifs. But for MLC nand,maybe I can g=
ive you some helpful infor.

The hardest problem we are aware of are paired pages.
Please search the archives, we had already some discussion on it.

--=20
Thanks,
//richard
