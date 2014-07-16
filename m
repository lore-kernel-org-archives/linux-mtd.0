Received: from mail-vc0-x22f.google.com ([2607:f8b0:400c:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7NyK-000534-Pp
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 12:06:09 +0000
Received: by mail-vc0-f175.google.com with SMTP id hu12so1377273vcb.6
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jul 2014 05:05:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1405508933.1906.29.camel@sauron.fi.intel.com>
References: <CAEGnBBSC=k5kkQYkLn37Q8KLLC+n43KiNr9ZZ-8NPJaGkGf0Qg@mail.gmail.com>
 <1405508933.1906.29.camel@sauron.fi.intel.com>
Date: Wed, 16 Jul 2014 14:05:46 +0200
Message-ID: <CAFLxGvyfYs923VOpgWvrjjiN3tehV-YvbEUvr8ptDfhFkWv=-w@mail.gmail.com>
Subject: Re: ubifs issue about xattr node when replay journal
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?546L5LiB?= <walklook@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 16, 2014 at 1:08 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Sat, 2014-07-12 at 21:36 +0800, =E7=8E=8B=E4=B8=81 wrote:
>> -------- kernel 3.10 log --------
>> [   64.916532] UBIFS: background thread "ubifs_bgt0_16" started, PID 92
>> [   64.926411] UBIFS: recovery needed
>> [   65.013786] UBIFS error (pid 91): ubifs_read_node: bad node type
>> (255 but expected 3)
>> [   65.021595] UBIFS error (pid 91): ubifs_read_node: bad node at LEB
>> 88:39680, LEB mapping status 1
>> [   65.030431] Not a node, first 24 bytes:
>> [   65.034073] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>> ff ff ff ff ff ff ff ff ff
>
> There was a similar report recently (but not about xattr) and I suspect
> "fastmap". Please, check if you use it - it is new and I did not see any
> report that it was extensively tested WRT power cuts.

To be more precisely, is CONFIG_MTD_UBI_FASTMAP=3Dy and was the image attac=
hed
by fastmap?
The kernel log would contain the message "attached by fastmap".

--=20
Thanks,
//richard
