Received: from lgeamrelo11.lge.com ([156.147.23.51])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cjl3W-0007Dp-Ot
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 11:07:29 +0000
Message-ID: <58B94E55.3080209@gmail.com>
Date: Fri, 03 Mar 2017 20:07:01 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
CC: Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd@lists.infradead.org, kernel-team@lge.com, hyc.lee@gmail.com
Subject: Re: [PATCH 0/3] ubifs: add lz4hc compression
References: <1488259008-12510-1-git-send-email-hyc.lee@gmail.com>
 <5766cc86-d4cc-230c-9d3c-073d9b8d6ec5@nod.at>
In-Reply-To: <5766cc86-d4cc-230c-9d3c-073d9b8d6ec5@nod.at>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Ricard

On 03/03/2017 05:08 PM, Richard Weinberger wrote:
> Hyunchul Lee,
> 
> Am 28.02.2017 um 06:16 schrieb Hyunchul Lee:
>> From: Hyunchul Lee <cheol.lee@lge.com>
>>
>> This patch set is for adding support for lz4hc compression.  lz4hc's
>> compression ratio is comparable to zlib, but its compression/decompression
>> speed is faster than zlib[1].
> 
> Do you have performance numbers that show the speedup on a common embedded
> system with NAND?

I am trying to build environment for a common embedded system with NAND. 
if I am done, I will report the performance result. 

> 
>> Another compression type cannot be added any more in respect that type of
>> ubifs_inode's compr_type is "unsigned:2" and there are 4 compression
>> types.  There may be overflow in assignment to compr_type, and prevision 
>> version of ubifs is trying to decompress file with wrong compression type.
> 
> As Artem noted this is only an in-memory struct.
> 
> What happens when you compress a file with lz4hc and try to access this
> UBIFS file with an older kernel?
> AFAICT ubifs_iget() will notice and return -EINVAL but please double check.
> 

yes, ubifs detects this. but I mean that if another compression type except lz4hc
is added, ubifs cannot. because ubifs_iget() assigns ubifs_ino_node's compr_type(16-bit) 
to ubifs_inode's compr_type(2-bit).
I guess that the disk format version should be incremented.

> Thanks,
> //richard
> 

Thanks,
Hyunchul
