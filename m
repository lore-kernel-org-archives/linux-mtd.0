Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIzCU-0003dA-CD
 for linux-mtd@lists.infradead.org; Fri, 01 Jul 2016 14:13:48 +0000
Received: by mail-oi0-x231.google.com with SMTP id u201so112089903oie.0
 for <linux-mtd@lists.infradead.org>; Fri, 01 Jul 2016 07:13:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <tencent_7C5FA3D5550624063EA45DF9@qq.com>
References: <tencent_7C5FA3D5550624063EA45DF9@qq.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 1 Jul 2016 16:13:24 +0200
Message-ID: <CAFLxGvzhnqB2peyJh4fcvCV8v7_3tTLdYhPTf4EY=dFeMNdYgg@mail.gmail.com>
Subject: Re: UBIFS: FileSystem Background Thread
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

On Fri, Jul 1, 2016 at 3:50 PM, =E8=BE=89=E5=B0=91 <wang502742203@qq.com> w=
rote:
> Hi,MTD lists
> I've got some questions about ubi file system background thread recently =
listed below:
> 1. If I mout ubifs again when it's already mounted, will the background t=
hread be created again?

There is one thread per UBIFS instance.

> 2. Is file written to the write-buffer then synchronized to flash media b=
y background thread in both sync mode and async mode?

No, write back is a generic Linux mechanism.

> 3. When I monut ubifs in sync mode and write files to it, it will take se=
veral minutes to finish a writting operation at some point as garbage colle=
ction, at that point, other threads are blocked by ubifs backgroud thread.B=
ut in async mode, that issue never appears. How can background thread block=
 other threads in sync mode? Doesn't context switch happen?

As I wrote in an earlier mail, this should not take minutes. Please
instrument the code to figure
where it spends so much time.
In sync mode the calling thread is blocked, i.e. your write() syscall.

--=20
Thanks,
//richard
