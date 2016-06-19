Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEe4F-0002nn-99
 for linux-mtd@lists.infradead.org; Sun, 19 Jun 2016 14:51:22 +0000
Received: by mail-oi0-x22b.google.com with SMTP id a64so25469620oii.2
 for <linux-mtd@lists.infradead.org>; Sun, 19 Jun 2016 07:50:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <tencent_6E3BACF519D6BE3A72292C36@qq.com>
References: <tencent_6E3BACF519D6BE3A72292C36@qq.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 19 Jun 2016 16:50:57 +0200
Message-ID: <CAFLxGvxbmUqFAq7QS=S3n0_yO4tsUHdbbL3-Fq4bHuJTBmEpPA@mail.gmail.com>
Subject: Re: ubifs:Questions About Garbage Collection
To: =?UTF-8?B?6L6J5bCR?= <wang502742203@qq.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
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

Hi!

On Sun, Jun 19, 2016 at 3:56 PM, =E8=BE=89=E5=B0=91 <wang502742203@qq.com> =
wrote:
> Hi=EF=BC=8CMTD  lists
> I meet some problems while using UBI file system recently.I make an exper=
iment in which I write 2 files(1KB each) to UBI frequently.Normally it take=
s only several millseconds to finish writting 2 files every time=EF=BC=8Cbu=
t what puzzles me is that it takes about 4 minutes to write once nearly eve=
ry 20 to 30 minutes.I am wondering how can this problem happen=EF=BC=9FDoes=
 Garbage Collection lead to this? I mount UBIFS to a 33MiB MTD partion with=
 "o -sync" option.By the way,if UBI is mounted in asynchronous mode, this p=
roblem never happens. Does GC(Garbage Collecton) differ in synchronous mode=
 andasynchronous mode?  What I've leared from some documents is that GC thr=
ead is sleeping while writting files without interval until UBIFS is full i=
n synchronous mode and at that point writing will become very slow, but in =
asynchronous mode, before data is  moved into flash media, GC thread will w=
ork when there is not enough free space, am I right?

You observe the issue only in sync mode because every write is done
immediately and therefore the garbage collector needs to
produce empty space. This can take some time and as you are in sync
mode the caller (where you measure the time) will be blocked
until GC produce some space.
In asynchronous mode you will hardly notice since writing do the flash
will be done in a different thread by the write back mechanism.

--=20
Thanks,
//richard
