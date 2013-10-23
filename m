Received: from forward5h.mail.yandex.net ([84.201.186.23])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYyfn-0006oF-Nj
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 13:40:32 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Brent Taylor <motobud@gmail.com>
In-Reply-To: <CAP+RiCBSPAHc2aM9byRjhFVePRU-1ODL9aJvN2Y65S4Ddj4sDA@mail.gmail.com>
References: <55541379679397@web20h.yandex.ru>
 <CAP+RiCAVuUEfyjg02+ZjeFXgUuaRW+fuMB490Ce2Hq_4qHBL=A@mail.gmail.com>
 <183031382371160@web6m.yandex.ru>
 <CAP+RiCDKgRqi8_Y4OMqyJyCUpKJW5BVE=hNwp3WzQ7PuOMWGMw@mail.gmail.com>
 <139841382436609@web24g.yandex.ru>
 <CAP+RiCDVTMb6RE5kGCYSyMCF9JMpSUAM5jS4YPObkbBu=zD59g@mail.gmail.com>
 <300471382514034@web11h.yandex.ru>
 <CAP+RiCBSPAHc2aM9byRjhFVePRU-1ODL9aJvN2Y65S4Ddj4sDA@mail.gmail.com>
Subject: Re: lz4hc compression in UBIFS?
MIME-Version: 1.0
Message-Id: <133391382535580@web11h.yandex.ru>
Date: Wed, 23 Oct 2013 17:39:40 +0400
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r
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



23.10.2013, 16:49, "Brent Taylor" <motobud@gmail.com>:
> On Wed, Oct 23, 2013 at 2:40 AM, Konstantin Tokarev <annulen@yandex.ru> wrote:
>
>> š23.10.2013, 09:26, "Brent Taylor" <motobud@gmail.com>:
>>> šKonstantin,
>>> ššššI did my testing with data from /dev/urandom (which I now realize
>>> šwasn't the best choice of data source), but if I use /dev/zero (which
>>> šactually causes data compression to occur), the decompressor fails. šI
>>> šdon't know the internal workings of the lz4hc compressor or the lz4
>>> šdecompressor. šI couldn't find any examples of any code in the kernel
>>> šactually using the compressor. šI've cc'ed the maintainers of the
>>> šlz4hc_compress.c to see if they my have some more insight to the
>>> šissue.
>> šDoes decompressor fail for you with the same error messages?
>>
>> šHave you tried to copy my file to the volume? It looks like minimal test case
>> šfor my board, if I remove any line decompressor works fine.
>>
>> š--
>> šRegards,
>> šKonstantin
>
> Yes, I get the same error, here's a dump from UBIFS when I cat a file
> filled with data from /dev/zero:
>
> UBIFS error (pid 4288): ubifs_decompress: cannot decompress 12 bytes,
> compressor lz4hc, error -22
> UBIFS error (pid 4288): read_block: bad data node (block 0, inode 71)
> ššššššššmagic ššššššššš0x6101831
> ššššššššcrc ššššššššššš0xff61a078
> ššššššššnode_type ššššš1 (data node)
> ššššššššgroup_type šššš0 (no node group)
> ššššššššsqnum ššššššššš2700
> ššššššššlen ššššššššššš60
> šššššššškey ššššššššššš(71, data, 0)
> ššššššššsize šššššššššš512
> ššššššššcompr_typ ššššš3
> ššššššššdata size ššššš12
> ššššššššdata:
> šššššššš00000000: 1f 00 01 00 ff e8 50 00 00 00 00 00
> UBIFS error (pid 4288): do_readpage: cannot read page 0 of inode 71, error -22
> cat: /opt/data/zero.bin: Input/output error
>
> Steps to reproduce are:
> 1. šCreate a file with all zeros: dd if=/dev/zero bs=512 count=1
> of=/opt/data/zero.bin
> 2. šUnmount ubifs and detach ubi partition
> 3. šattach ubi partition and mount ubifs
> 4. cat /opt/data/zero.bin

Reproduced here.

-- 
Regards,
Konstantin
