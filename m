Received: from mail-we0-x22f.google.com ([2a00:1450:400c:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQwjc-0007F7-VF
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 11:03:50 +0000
Received: by mail-we0-f175.google.com with SMTP id w61so484361wes.6
 for <linux-mtd@lists.infradead.org>; Mon, 08 Sep 2014 04:03:25 -0700 (PDT)
MIME-Version: 1.0
Sender: jphilippe.francois@gmail.com
In-Reply-To: <1410171221.10764.132.camel@sauron.fi.intel.com>
References: <CAGGh5h0KjexqaoEt8vvVXAEqCr625675XG4d71KdEuhrQVPr3w@mail.gmail.com>
 <1410170318.10764.119.camel@sauron.fi.intel.com>
 <20140908100453.GA28903@1wt.eu>
 <1410171221.10764.132.camel@sauron.fi.intel.com>
Date: Mon, 8 Sep 2014 13:03:25 +0200
Message-ID: <CAGGh5h3gVuurOn_2=MGc5X=QFe+bFRZREAjGqv6qK7zCnpQXfA@mail.gmail.com>
Subject: Re: Ubi patch proposition for 3.10.y
From: jean-philippe francois <jp.francois@cynove.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: richard@nod.at,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Willy Tarreau <w@1wt.eu>, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2014-09-08 12:13 GMT+02:00 Artem Bityutskiy <dedekind1@gmail.com>:
> On Mon, 2014-09-08 at 12:04 +0200, Willy Tarreau wrote:
>> > But better, if people started paying more attention to "fastmap", we m=
ay
>> > agree that from now on we are careful about the sending the fixes to t=
he
>> > stable queue.
>>
>> Personally, I think that whatever feature provided in a kernel release i=
s
>> subject to being used and deserves its fixes. There are some cases where
>> we *know* that some features are not used (eg: when they don't work with=
out
>> a lot of patching or tweaking), but if they seem to work for end users, =
they
>> are likely to be used.
>
> Well, adding stable tags is does not come for free. Whey you add a
> stable tag, you need to make sure it applies to the older kernel, and
> you need to also pick the possible dependencies. You need test it with
> older kernel.
>
> While in general what you say makes sense, for this specific "fastmap"
> case the maintainers (me and Richard) did not think the overhead is
> worth the benefits.
>
> If now the situation has changed, we may start being more careful.
>
Well for the original commit case :
- it applies
- it has been tested (by me at least)
- it solves a power cut fs corruption issue.

You ask for power cut testing, but when presented with the results,
patch is dismissed because I am foolish enough to use a long term
stable kernel, and not jump version each time a new kernel comes up.

Hopefully, dts will greatly help with migrating kernel, but
unoftunately, our camera was developped at the wrong moment (no more
board file accepted, yet no dts support for vital peripheral like
ISP).

It started with one patch, and now tens of them are mentionned, so I
understand your concern.

Regards,
Jean-Philippe Fran=C3=A7ois

> Best Regards,
> Artem Bityutskiy
>
