Received: from mail-vc0-x22c.google.com ([2607:f8b0:400c:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xzs10-00085N-4R
 for linux-mtd@lists.infradead.org; Sat, 13 Dec 2014 19:06:06 +0000
Received: by mail-vc0-f172.google.com with SMTP id hq11so4495095vcb.31
 for <linux-mtd@lists.infradead.org>; Sat, 13 Dec 2014 11:05:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1418482828-21290-1-git-send-email-zajec5@gmail.com>
References: <1418482828-21290-1-git-send-email-zajec5@gmail.com>
Date: Sat, 13 Dec 2014 20:05:44 +0100
Message-ID: <CAFLxGvw1YpX+wYDVjQ-_xfLNvo8OaL5dJQGNymQft56oCiFbYQ@mail.gmail.com>
Subject: Re: [PATCH] ubinfo: allow passing MTD device number
From: Richard Weinberger <richard.weinberger@gmail.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
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

On Sat, Dec 13, 2014 at 4:00 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:
> This provides a nice way to find if and which UBI device is attached to
> the MTD.

Is it really worth adding this functionality to ubinfo?
One can check /sys/class/ubi/ubiX/mtd_num.

The design behind UBI tools is to work only on UBI device nodes
and not on MTD numbers.
i.e. to keep the layers separated.

--=20
Thanks,
//richard
