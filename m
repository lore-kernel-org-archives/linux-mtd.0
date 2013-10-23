Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYxzR-0005ac-09
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 12:56:45 +0000
Received: by mail-wg0-f52.google.com with SMTP id f12so767934wgh.7
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2013 05:56:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <300471382514034@web11h.yandex.ru>
References: <55541379679397@web20h.yandex.ru>
 <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
 <183031382371160@web6m.yandex.ru>
 <CAP+RiCDKgRqi8_Y4OMqyJyCUpKJW5BVE=hNwp3WzQ7PuOMWGMw@mail.gmail.com>
 <139841382436609@web24g.yandex.ru>
 <CAP+RiCDVTMb6RE5kGCYSyMCF9JMpSUAM5jS4YPObkbBu=zD59g@mail.gmail.com>
 <300471382514034@web11h.yandex.ru>
Date: Wed, 23 Oct 2013 07:49:24 -0500
Message-ID: <CAP+RiCBSPAHc2aM9byRjhFVePRU-1ODL9aJvN2Y65S4Ddj4sDA@mail.gmail.com>
Subject: Re: lz4hc compression in UBIFS?
From: Brent Taylor <motobud@gmail.com>
To: Konstantin Tokarev <annulen@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 23, 2013 at 2:40 AM, Konstantin Tokarev <annulen@yandex.ru> wrote:
>
>
> 23.10.2013, 09:26, "Brent Taylor" <motobud@gmail.com>:
>> Konstantin,
>>    I did my testing with data from /dev/urandom (which I now realize
>> wasn't the best choice of data source), but if I use /dev/zero (which
>> actually causes data compression to occur), the decompressor fails.  I
>> don't know the internal workings of the lz4hc compressor or the lz4
>> decompressor.  I couldn't find any examples of any code in the kernel
>> actually using the compressor.  I've cc'ed the maintainers of the
>> lz4hc_compress.c to see if they my have some more insight to the
>> issue.
>
> Does decompressor fail for you with the same error messages?
>
> Have you tried to copy my file to the volume? It looks like minimal test case
> for my board, if I remove any line decompressor works fine.
>
> --
> Regards,
> Konstantin

Yes, I get the same error, here's a dump from UBIFS when I cat a file
filled with data from /dev/zero:

UBIFS error (pid 4288): ubifs_decompress: cannot decompress 12 bytes,
compressor lz4hc, error -22
UBIFS error (pid 4288): read_block: bad data node (block 0, inode 71)
        magic          0x6101831
        crc            0xff61a078
        node_type      1 (data node)
        group_type     0 (no node group)
        sqnum          2700
        len            60
        key            (71, data, 0)
        size           512
        compr_typ      3
        data size      12
        data:
        00000000: 1f 00 01 00 ff e8 50 00 00 00 00 00
UBIFS error (pid 4288): do_readpage: cannot read page 0 of inode 71, error -22
cat: /opt/data/zero.bin: Input/output error

Steps to reproduce are:
1.  Create a file with all zeros: dd if=/dev/zero bs=512 count=1
of=/opt/data/zero.bin
2.  Unmount ubifs and detach ubi partition
3.  attach ubi partition and mount ubifs
4. cat /opt/data/zero.bin
