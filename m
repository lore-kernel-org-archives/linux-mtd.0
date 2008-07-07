Received: from ocean.emcraft.com ([213.221.7.182])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KFtNW-0005uB-B6
	for linux-mtd@lists.infradead.org; Mon, 07 Jul 2008 16:15:50 +0000
Message-ID: <48724132.3050004@emcraft.com>
Date: Mon, 07 Jul 2008 20:15:46 +0400
From: Sergei Poselenov <sposelenov@emcraft.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: JFFS2: real free capacity of the partition
References: <486CFB83.3010301@emcraft.com>
In-Reply-To: <486CFB83.3010301@emcraft.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

Seems I found why is that happens.
In jffs2_statfs() the wasted_size is excluded
from calculation:
...
    avail = c->dirty_size + c->free_size;
...

Could someone explain for what reason?
Have I understand it right - on the certain conditions, the
wasted space can be converted to dirty space?

Regards,
Sergei

Sergei Poselenov wrote:
> Hello,
> 
> Probably this is a trivial question and won't take much of your time.
> 
> A simple test on a JFFS2 partition:
> 
> # df
> Filesystem           1k-blocks      Used Available Use% Mounted on
> /dev/mtdblock1            1024       376       648  37% /etc
> # dd if=/dev/urandom of=tmp bs=1024 count=2900
> dd: tmp: No space left on device
> # rm tmp
> # df
> Filesystem           1k-blocks      Used Available Use% Mounted on
> /dev/mtdblock1            1024       372       652  36% /etc
> 
> Why additional space appeared?
> 
> I've noted, that this effect:
> - appeared only on the well-used partition, not on the
>   fresh-created one.
> - appeared only after filling up the device
> - appeared only once. On subsequent tests, the free space was
> reported without magic increases.
> 
> 
> Is this is an effect of the JFFS2 garbage collector?
> Is there any method to learn the real available capacity of the
> mounted partition?
> 
> Thanks in advance,
> Sergei
> 
