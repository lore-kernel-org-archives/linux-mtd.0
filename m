Received: from mail-pl0-x236.google.com ([2607:f8b0:400e:c01::236])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQasV-0000eQ-MG
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 16:01:45 +0000
Received: by mail-pl0-x236.google.com with SMTP id w17-v6so4094068pll.9
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2018 09:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAFwEtmo=tXCckkQFn2VDoNV4tto7MBr0Tj3xVqLroxfJzZ=Fkw@mail.gmail.com>
 <CAFLxGvzNoU3DETdJkQCM-oGjuy+1=dec0ocTmFSmLN3-dbE7xg@mail.gmail.com>
In-Reply-To: <CAFLxGvzNoU3DETdJkQCM-oGjuy+1=dec0ocTmFSmLN3-dbE7xg@mail.gmail.com>
From: Michele Dionisio <michele.dionisio@gmail.com>
Date: Wed, 6 Jun 2018 18:01:17 +0200
Message-ID: <CAFwEtmpNBcKUBMFOyXs=RsTco8t7bBfLO6WS0NAZO6u1HwgteQ@mail.gmail.com>
Subject: Re: testing UBIFS with zstd
To: richard.weinberger@gmail.com
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have 2 partitions on same NAND. one with LZ4 one with ztsd. Mount option are:

root@flexaT:/# mount
rootfs on / type rootfs (rw)
ubi0:data on /opt/device/data type ubifs (rw,noatime,bulk_read)
ubi1:spare on /opt/device/real_spare type ubifs (rw,noatime,bulk_read)

I execute the following sequence of command for test

INFILE="/dev/zero"
rm -f /tmp/testfile
dd if=${INFILE} of=/tmp/testfile bs=16k count=1k
rm -f /opt/device/data/test
df /opt/device/data
sysctl -w vm.drop_caches=3
time dd if=/tmp/testfile of=/opt/device/data/test bs=64k count=1k
sync
sysctl -w vm.drop_caches=3
time dd if=/opt/device/data/test of=/dev/null bs=64k
df /opt/device/data
rm -f /opt/device/data/test
rm -f /opt/device/real_spare/test
df /opt/device/real_spare
sysctl -w vm.drop_caches=3
time dd if=/tmp/testfile of=/opt/device/real_spare/test bs=64k count=1k
sync
sysctl -w vm.drop_caches=3
time dd if=/opt/device/real_spare/test of=/dev/null bs=64k
df /opt/device/real_spare
rm -f /opt/device/real_spare/test
rm -f /tmp/testfile

I have that the test 2 time using INFILE="/dev/zero" and
INFILE="/dev/urandom". Both test is not realistic because zeros is too
much comprimable and random is not comprimibile. The result is:

----------------------------------------------------------------------------------------
COMPRESSION           |  time write    | time read   |   space used
LZO (/dev/zero)             |  2.39          | 1.40        |   624 blocks
ZSTD (/dev/zero)           |  2.63          | 1.43        |   596 blocks
LZO (/dev/urandom)    |  13.38         | 5.88        |   16024 blocks
ZSTD (/dev/urandom)   |  7.89          | 5.83        |   15896 blocks

to have an idea about compression I have try to use one sqlite3 db and
the size of the same file on both database is:
LZO : 2688 bloks
ZSTD: 1356 bloks


Il giorno mer 6 giu 2018 alle ore 15:06 Richard Weinberger
<richard.weinberger@gmail.com> ha scritto:
>
> On Wed, Jun 6, 2018 at 2:55 PM, Michele Dionisio
> <michele.dionisio@gmail.com> wrote:
> > I'm testing ubifs with zstd compression. In my opinion it is a good
> > idea to start to insert this "new" compression algorithem because the
> > performance is paragonable with LZ4 and the compression is much
> > better.
>
> Numbers, please. :-)
> Also see:
> http://lists.infradead.org/pipermail/linux-mtd/2018-January/078742.html
>
> --
> Thanks,
> //richard
