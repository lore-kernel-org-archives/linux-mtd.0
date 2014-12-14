Received: from mail-ig0-x230.google.com ([2607:f8b0:4001:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y08QR-0003oa-Rf
 for linux-mtd@lists.infradead.org; Sun, 14 Dec 2014 12:37:28 +0000
Received: by mail-ig0-f176.google.com with SMTP id l13so3982009iga.3
 for <linux-mtd@lists.infradead.org>; Sun, 14 Dec 2014 04:37:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvw1YpX+wYDVjQ-_xfLNvo8OaL5dJQGNymQft56oCiFbYQ@mail.gmail.com>
References: <1418482828-21290-1-git-send-email-zajec5@gmail.com>
 <CAFLxGvw1YpX+wYDVjQ-_xfLNvo8OaL5dJQGNymQft56oCiFbYQ@mail.gmail.com>
Date: Sun, 14 Dec 2014 13:37:05 +0100
Message-ID: <CACna6rzGQtgJqG5XX=hefSzbmrv=2bt6gjdyOzPH-2bgqrhUsg@mail.gmail.com>
Subject: Re: [PATCH] ubinfo: allow passing MTD device number
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13 December 2014 at 20:05, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Sat, Dec 13, 2014 at 4:00 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.co=
m> wrote:
>> This provides a nice way to find if and which UBI device is attached to
>> the MTD.
>
> Is it really worth adding this functionality to ubinfo?
> One can check /sys/class/ubi/ubiX/mtd_num.

I didn't know about it when asking the questions, should be enough for
me, thanks.

--=20
Rafa=C5=82
