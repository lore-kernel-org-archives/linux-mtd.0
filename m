Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bKLwP-0007rD-MJ
 for linux-mtd@lists.infradead.org; Tue, 05 Jul 2016 08:42:51 +0000
Received: by mail-oi0-x22e.google.com with SMTP id s66so220429330oif.1
 for <linux-mtd@lists.infradead.org>; Tue, 05 Jul 2016 01:42:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <C80AB6F618D91B4E8F391CB202C12DFD11218919C5@LGEVEXMBHQSVC1.LGE.NET>
References: <C80AB6F618D91B4E8F391CB202C12DFD11218919BD@LGEVEXMBHQSVC1.LGE.NET>
 <CAFLxGvxRtxSSRL5VOEmy1udbnWBYcVf0JDVaMdca0Ww1HTK74w@mail.gmail.com>
 <C80AB6F618D91B4E8F391CB202C12DFD11218919C5@LGEVEXMBHQSVC1.LGE.NET>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 5 Jul 2016 10:42:28 +0200
Message-ID: <CAFLxGvwhmTjXRMpPGBX6LO9f_7NrKsTXvSBQLcLFFWWh1h4rGA@mail.gmail.com>
Subject: Re: ubifs issue about ubifs_tnc_remove_ino when replay journal
To: =?UTF-8?B?7J206rCA656ML+yjvOyehOyXsOq1rOybkOOAiVNXIFBsYXRmb3JtKOyXsClBT1TtjIAoa2FyYW0u?=
 =?UTF-8?B?bGVlQGxnZS5jb20p?= <karam.lee@lge.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?67CV7Iq57Zi4?= <seungho1.park@lge.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 25, 2016 at 10:32 AM, =EC=9D=B4=EA=B0=80=EB=9E=8C/=EC=A3=BC=EC=
=9E=84=EC=97=B0=EA=B5=AC=EC=9B=90=E3=80=89SW
Platform(=EC=97=B0)AOT=ED=8C=80(karam.lee@lge.com) <karam.lee@lge.com> wrot=
e:
> thank you!
>
> I do not use fastmap.
> My ".config" is "# CONFIG_MTD_UBI_FASTMAP is not set"

Okay, good. This issue is still on my TODO.
Is is possible to share a nanddump with me?

I think I know what is going on, but I'm not sure.

--=20
Thanks,
//richard
