Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSEAQ-0001y7-RZ
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 00:57:19 +0000
Message-ID: <55D52473.7050209@cn.fujitsu.com>
Date: Thu, 20 Aug 2015 08:50:59 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>, =?UTF-8?B?QW5kcmVh?=
 =?UTF-8?B?cyBHcsO8bmJhY2hlcg==?= <andreas.gruenbacher@gmail.com>
CC: <snijsure@grid-net.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 <ben.shelton@ni.com>, <terry.wilcox@ni.com>, <mkl@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 <gratian.crisan@ni.com>, <brad.mouring@ni.com>
Subject: Re: [kernel.org bug 103071] Dead "security.*" xattr code in ubifs
References: <CAHpGcM+bkFA-UDM0FKwH=FkS9+TWv_Br7nWJXSpKDquo5n_gFw@mail.gmail.com>
 <CAFLxGvxPGZoRX3Ft_g59fzfLhoOmEES=q-oPBmYuGVBzn-dRUA@mail.gmail.com>
In-Reply-To: <CAFLxGvxPGZoRX3Ft_g59fzfLhoOmEES=q-oPBmYuGVBzn-dRUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/19/2015 04:55 AM, Richard Weinberger wrote:
> Andreas,
>
> On Tue, Aug 18, 2015 at 2:15 PM, Andreas Gr=C3=BCnbacher
> <andreas.gruenbacher@gmail.com> wrote:
>> Hello,
>>
>> FYI, I've filed the following bug report against ubifs:
>>
>>> ubifs sets sb->s_xattr to ubifs_xattr_handlers which contains a handler=
 for
>>> "security.*" xattrs. The s_xattr handlers are never used because ubifs =
uses
>>> its own ubifs_{get,set,list,remove}xattr inode operations instead of
>>> generic_{get,set,list,remove}xattr inode operations though.
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D103071
>
> Thanks for reporting.
>
> CC'ing authors of commit d7f0b70d30ffb9bbe6b8a3e1035cf0b79965ef53
> Author: Subodh Nijsure <snijsure@grid-net.com>
> Date:   Fri Oct 31 13:50:30 2014 -0500
>
>      UBIFS: Add security.* XATTR support for the UBIFS
>
>
> Also xfstests' generic/062 test seems to fail (with USE_ATTR_SECURE=3Dyes=
)
> ---cut---
> generic/062 1s ... - output mismatch (see
> /root/xfstests/results//generic/062.out.bad)
>      --- tests/generic/062.out   2015-08-18 20:13:00.714593141 +0000
>      +++ /root/xfstests/results//generic/062.out.bad     2015-08-18
> 20:50:06.450418217 +0000
>      @@ -203,6 +203,292 @@
>       SCRATCH_MNT/dev/p: user.name2: No such attribute or operation not p=
ermitted
>       *** final list (strings, type=3Ddev/p, nsp=3Duser)
>
>      +=3D=3D=3D TYPE reg; NAMESPACE security
>      +
>      +*** set/get one initially empty attribute
>      +# file: SCRATCH_MNT/reg
>      ...
>      (Run 'diff -u tests/generic/062.out
> /root/xfstests/results//generic/062.out.bad'  to see the entire diff)
> Ran: generic/062
> Failures: generic/062
> Failed 1 of 1 tests

Hi Richard,
	Glad to know you are also using fstests for our ubifs. :)
About this case, I checked it and found it's a bug in fstests.
Because when we are setting USE_ATTR_SECURE=3Dyes, the output
would be different with what it expected currently.
	So, I will send a patch out to fix it. And with a quick
fix, I found ubifs works well in xattr security.

Yang
> ---cut---
>
> Guys, how did you test this feature?
>
