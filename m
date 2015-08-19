Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRrrq-0004dN-5m
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 01:08:41 +0000
Message-ID: <55D3D6BB.3030307@huawei.com>
Date: Wed, 19 Aug 2015 09:07:07 +0800
From: Sheng Yong <shengyong1@huawei.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 8/19/2015 4:55 AM, Richard Weinberger wrote:
> Andreas,
> 
> On Tue, Aug 18, 2015 at 2:15 PM, Andreas Grünbacher
> <andreas.gruenbacher@gmail.com> wrote:
>> Hello,
>>
>> FYI, I've filed the following bug report against ubifs:
>>
>>> ubifs sets sb->s_xattr to ubifs_xattr_handlers which contains a handler for
>>> "security.*" xattrs. The s_xattr handlers are never used because ubifs uses
>>> its own ubifs_{get,set,list,remove}xattr inode operations instead of
>>> generic_{get,set,list,remove}xattr inode operations though.
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=103071
> 
> Thanks for reporting.
> 
> CC'ing authors of commit d7f0b70d30ffb9bbe6b8a3e1035cf0b79965ef53
> Author: Subodh Nijsure <snijsure@grid-net.com>
> Date:   Fri Oct 31 13:50:30 2014 -0500
> 
>     UBIFS: Add security.* XATTR support for the UBIFS
> 
> 
> Also xfstests' generic/062 test seems to fail (with USE_ATTR_SECURE=yes)
> ---cut---
> generic/062 1s ... - output mismatch (see
> /root/xfstests/results//generic/062.out.bad)
>     --- tests/generic/062.out   2015-08-18 20:13:00.714593141 +0000
>     +++ /root/xfstests/results//generic/062.out.bad     2015-08-18
> 20:50:06.450418217 +0000
>     @@ -203,6 +203,292 @@
>      SCRATCH_MNT/dev/p: user.name2: No such attribute or operation not permitted
>      *** final list (strings, type=dev/p, nsp=user)
> 
>     +=== TYPE reg; NAMESPACE security
>     +
>     +*** set/get one initially empty attribute
>     +# file: SCRATCH_MNT/reg
>     ...
>     (Run 'diff -u tests/generic/062.out
> /root/xfstests/results//generic/062.out.bad'  to see the entire diff)
> Ran: generic/062
> Failures: generic/062
> Failed 1 of 1 tests
> ---cut---
> 
> Guys, how did you test this feature?
> 
This is because UBIFS did not implement extended attribute in the geneirc way
(by calling generic_*xattr()). We could create an xattr_handler to have these
dead functions called (in fact, I did that), but doing this seems just another
encapsulation and makes no sense. So I think we could remove these dead code
directly.

thanks,
Sheng
