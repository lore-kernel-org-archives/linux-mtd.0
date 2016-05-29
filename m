Received: from mail-oi0-x22a.google.com ([2607:f8b0:4003:c06::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b71dZ-0003Ri-GV
 for linux-mtd@lists.infradead.org; Sun, 29 May 2016 14:24:18 +0000
Received: by mail-oi0-x22a.google.com with SMTP id w184so230961518oiw.2
 for <linux-mtd@lists.infradead.org>; Sun, 29 May 2016 07:23:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <566B344A0B1AB14EB2486D887B6FF9E0331F3DB470@SRV01.ARTech.local>
References: <566B344A0B1AB14EB2486D887B6FF9E0331F3DB470@SRV01.ARTech.local>
Date: Sun, 29 May 2016 16:23:55 +0200
Message-ID: <CAFLxGvz+9JqcLZwuUqOd1UsCNbbjD52ecd5Faj8PC12YhTuYiA@mail.gmail.com>
Subject: Re: mtd locking
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Matthias Auchmann <m.auchmann@artech.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

On Sun, May 29, 2016 at 3:38 PM, Matthias Auchmann <m.auchmann@artech.at> w=
rote:
> Hi all!
>
> I have a question - sorry if it turns out to be a beginner's question. I'=
m using kernel version 3.17, but as far as I can tell my question still app=
lies.
>
> My question is how locking is ensured with MTD. I understand that usually=
 there would only be one file system attached to one mtd partition, but wha=
t if I concurrently ran multiple instances of nanddump from userspace? Is M=
TD thread-safe?
>
> I'm asking since I had an issue where when I called nanddump on two parti=
tions of the same NAND flash simultaneously, the ECC errors would count up =
for both nanddumps although only one partition had ECC errors. Experimental=
ly adding a mutex to mtdpart.c's part_read() function solved the issue.

IIRC ECC error counting is not thread safe at all.
So, yes the behavior is indented.
...at least nobody cared enough to make it better.

--=20
Thanks,
//richard
