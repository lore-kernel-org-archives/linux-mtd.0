Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRnvO-0004ZS-3P
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 20:56:03 +0000
Received: by obbop1 with SMTP id op1so152555870obb.2
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2015 13:55:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHpGcM+bkFA-UDM0FKwH=FkS9+TWv_Br7nWJXSpKDquo5n_gFw@mail.gmail.com>
References: <CAHpGcM+bkFA-UDM0FKwH=FkS9+TWv_Br7nWJXSpKDquo5n_gFw@mail.gmail.com>
Date: Tue, 18 Aug 2015 22:55:40 +0200
Message-ID: <CAFLxGvxPGZoRX3Ft_g59fzfLhoOmEES=q-oPBmYuGVBzn-dRUA@mail.gmail.com>
Subject: Re: [kernel.org bug 103071] Dead "security.*" xattr code in ubifs
From: Richard Weinberger <richard.weinberger@gmail.com>
To: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 snijsure@grid-net.com,
 mkl@pengutronix.de, ben.shelton@ni.com, brad.mouring@ni.com,
 terry.wilcox@ni.com, gratian.crisan@ni.com,
 Artem Bityutskiy <dedekind1@gmail.com>
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

Andreas,

On Tue, Aug 18, 2015 at 2:15 PM, Andreas Gr=C3=BCnbacher
<andreas.gruenbacher@gmail.com> wrote:
> Hello,
>
> FYI, I've filed the following bug report against ubifs:
>
>> ubifs sets sb->s_xattr to ubifs_xattr_handlers which contains a handler =
for
>> "security.*" xattrs. The s_xattr handlers are never used because ubifs u=
ses
>> its own ubifs_{get,set,list,remove}xattr inode operations instead of
>> generic_{get,set,list,remove}xattr inode operations though.
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D103071

Thanks for reporting.

CC'ing authors of commit d7f0b70d30ffb9bbe6b8a3e1035cf0b79965ef53
Author: Subodh Nijsure <snijsure@grid-net.com>
Date:   Fri Oct 31 13:50:30 2014 -0500

    UBIFS: Add security.* XATTR support for the UBIFS


Also xfstests' generic/062 test seems to fail (with USE_ATTR_SECURE=3Dyes)
---cut---
generic/062 1s ... - output mismatch (see
/root/xfstests/results//generic/062.out.bad)
    --- tests/generic/062.out   2015-08-18 20:13:00.714593141 +0000
    +++ /root/xfstests/results//generic/062.out.bad     2015-08-18
20:50:06.450418217 +0000
    @@ -203,6 +203,292 @@
     SCRATCH_MNT/dev/p: user.name2: No such attribute or operation not perm=
itted
     *** final list (strings, type=3Ddev/p, nsp=3Duser)

    +=3D=3D=3D TYPE reg; NAMESPACE security
    +
    +*** set/get one initially empty attribute
    +# file: SCRATCH_MNT/reg
    ...
    (Run 'diff -u tests/generic/062.out
/root/xfstests/results//generic/062.out.bad'  to see the entire diff)
Ran: generic/062
Failures: generic/062
Failed 1 of 1 tests
---cut---

Guys, how did you test this feature?

--=20
Thanks,
//richard
