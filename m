Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pt1CD-0006Dv-9Z
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 17:11:13 +0000
Received: by wyf23 with SMTP id 23so1885818wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 09:11:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1298651278.2346.2.camel@koala>
References: <AANLkTimN5eBifpcyfJYo9s51U+kEi1ZemFnOm7p2rcxQ@mail.gmail.com>
	<1298637524.2798.103.camel@localhost>
	<AANLkTimvqdu1k3ZL4rqC-DBiMkNmytBXZ1YWXNE0Gs6F@mail.gmail.com>
	<1298651278.2346.2.camel@koala>
Date: Fri, 25 Feb 2011 11:11:11 -0600
Message-ID: <AANLkTikT13ZM0fKHL9tdMei2txxS5a4MzQ8e6ccXFErc@mail.gmail.com>
Subject: Re: Slab memory leak in JFFS2 filesystems
From: Johns Daniel <johns.daniel@gmail.com>
To: linux-mtd@lists.infradead.org
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

On Fri, Feb 25, 2011 at 10:27 AM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> On Fri, 2011-02-25 at 10:12 -0600, Johns Daniel wrote:
>> On Fri, Feb 25, 2011 at 6:38 AM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
>> > On Thu, 2011-02-24 at 18:41 -0600, Johns Daniel wrote:
>> >> I have discovered a kernel memory leak associated with JFFS2
>> >> filesystems. I have verified the leak in kernels 2.6.28 and 2.6.36 on
>> >> a Freescale PowerPC board using this script:
>> >>
>> >> while :; do FN=3D$(mktemp /jffs2fs/TMP.XXXXXXXX); \
>> >> =C2=A0 =C2=A0cat /proc/slabinfo |grep "dentry\|size-64 "; sleep 1; /b=
in/rm $FN; done
>> >
>> > Please, check whether they go away after:
>> >
>> > echo 3 > /proc/sys/vm/drop_caches
>> >
>> > See Documentation/sysctl/vm.txt for more information about what this
>> > means.
>>
>> Thanks for that suggestion, Artem! Here is what I tried:
>
> Hi, you can try to play with kmemleak - this is a kernel feature which
> slows down the system a lot but is great in catching memory leaks. It
> may have false positives sometimes, though. You can read about kmemleak
> in the Documentation/ directory. I think if there are leaks in JFFS2 -
> kmemleak would spot them.
>

Unfortunately, the kmemleak feature is not supported on PPC even in
2.6.36. And I don't have a supported system available with the JFFS2
filesystem.

One more data point. After running the script like this:

while :; do FN=3D$(mktemp /jffs2fs/TMP.XXXXXXXX); \
   echo 3 > /proc/sys/vm/drop_caches; sleep 1; \
   grep  "dentry\|size-64 " /proc/slabinfo; /bin/rm $FN; done

it looks like the leak may only be in "size-64" (and not "dentry").

> --
> Best Regards,
> Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
>
>
