Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQcGd-0001Vb-Ur
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 17:30:42 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Michele Dionisio <michele.dionisio@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: testing UBIFS with zstd
Date: Wed, 06 Jun 2018 19:30:21 +0200
Message-ID: <2382189.TlthlRu3CO@blindfold>
In-Reply-To: <CAFwEtmpNBcKUBMFOyXs=RsTco8t7bBfLO6WS0NAZO6u1HwgteQ@mail.gmail.com>
References: <CAFwEtmo=tXCckkQFn2VDoNV4tto7MBr0Tj3xVqLroxfJzZ=Fkw@mail.gmail.com>
 <CAFLxGvzNoU3DETdJkQCM-oGjuy+1=dec0ocTmFSmLN3-dbE7xg@mail.gmail.com>
 <CAFwEtmpNBcKUBMFOyXs=RsTco8t7bBfLO6WS0NAZO6u1HwgteQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Michele,

Am Mittwoch, 6. Juni 2018, 18:01:17 CEST schrieb Michele Dionisio:
> I have 2 partitions on same NAND. one with LZ4 one with ztsd. Mount option are:

LZ4 or LZO?
Below you write LZO...
 
> root@flexaT:/# mount
> rootfs on / type rootfs (rw)
> ubi0:data on /opt/device/data type ubifs (rw,noatime,bulk_read)
> ubi1:spare on /opt/device/real_spare type ubifs (rw,noatime,bulk_read)
> 
> I execute the following sequence of command for test
> 
> INFILE="/dev/zero"
> rm -f /tmp/testfile
> dd if=${INFILE} of=/tmp/testfile bs=16k count=1k
> rm -f /opt/device/data/test
> df /opt/device/data
> sysctl -w vm.drop_caches=3
> time dd if=/tmp/testfile of=/opt/device/data/test bs=64k count=1k
> sync
> sysctl -w vm.drop_caches=3
> time dd if=/opt/device/data/test of=/dev/null bs=64k
> df /opt/device/data
> rm -f /opt/device/data/test
> rm -f /opt/device/real_spare/test
> df /opt/device/real_spare
> sysctl -w vm.drop_caches=3
> time dd if=/tmp/testfile of=/opt/device/real_spare/test bs=64k count=1k
> sync
> sysctl -w vm.drop_caches=3
> time dd if=/opt/device/real_spare/test of=/dev/null bs=64k
> df /opt/device/real_spare
> rm -f /opt/device/real_spare/test
> rm -f /tmp/testfile
> 
> I have that the test 2 time using INFILE="/dev/zero" and
> INFILE="/dev/urandom". Both test is not realistic because zeros is too
> much comprimable and random is not comprimibile. The result is:
> 
> ----------------------------------------------------------------------------------------
> COMPRESSION           |  time write    | time read   |   space used
> LZO (/dev/zero)             |  2.39          | 1.40        |   624 blocks
> ZSTD (/dev/zero)           |  2.63          | 1.43        |   596 blocks
> LZO (/dev/urandom)    |  13.38         | 5.88        |   16024 blocks
> ZSTD (/dev/urandom)   |  7.89          | 5.83        |   15896 blocks

What scale is time? ms?
And what is block? LEBs?

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
