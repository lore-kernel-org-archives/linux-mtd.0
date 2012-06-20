Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ShHZN-00044V-MV
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2012 09:51:26 +0000
Message-ID: <4FE19D18.1040100@parrot.com>
Date: Wed, 20 Jun 2012 11:51:20 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: ubifs error : read_znode: bad indexing node
References: <4FD5F9D6.9020800@parrot.com> <1340052317.1971.14.camel@koala>
In-Reply-To: <1340052317.1971.14.camel@koala>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Artem Bityutskiy a écrit :
> Hi,
> 
> On Mon, 2012-06-11 at 15:59 +0200, Matthieu CASTET wrote:
>> we have products where rw ubifs partition are corrupted.
>> They all failed with the "read_znode: bad indexing node at LEB 558:22056, error
>> 6" or "read_znode: bad indexing node at LEB 446:62888, error 2".
> 
> So we read the indexing node, and its CRC is correct, but then we
> validate it by checking that various fields are withing possible limits,
> and we see that there is some garbage.
> 
> This smells more like memory corruption somewhere - we write garbage or
> corrupted buffers to the media.
Yes after some investigation corrupted bad look like kernel addresses :

branch to 0x144:0x10468 len 160 type 0x0 0xcffc5418 0
branch to 0x131:0x0 len 4144 type 1 0x4210 0x20000000
branch to 0x131:0x1030 len 108 type 1 0x4210 0x20000001
branch to 0x144:0x14800 len 160 type 0 0x4213 0x0
branch to 0x131:0xf800 len 4144 type 1 0x4213 0x20000000

branch to 0xd0:0x5278 len 4144 type 1 0x6fd1 0x20000003
branch to 0xd0:0x62a8 len 4144 type 1 0x6fd1 0x20000004
branch to 0xd0:0x72d8 len 4144 type 1 0x6fd1 0x20000005
branch to 0xd0:0xc0309638 len -1070091304 type 1 0x6fd1 0x20000006
branch to 0xd0:0x9338 len 4144 type 1 0x6fd1 0x20000007
branch to 0xd0:0xa368 len 4144 type 1 0x6fd1 0x20000008
branch to 0xd0:0xb398 len 3737 type 1 0x6fd1 0x20000009
branch to 0xc1:0xd9c0 len 160 type 0 0x6fd7 0x0

We may have a driver that corrupt the heap/memory.
> 
> I guess it would be a good improvement to UBIFS if we validated when we
> write, not only read, then we could catch issues earlier.
Yes, and there is already assert in debug mode that does such check.
But there is no guarantee that the corruption won't be done after the check ;)

> 
>> The last ubifs stable commit we have is
>> http://git.infradead.org/users/dedekind/ubifs-v2.6.32.git/commit/7eb3b6c0999bd2cbc37adb2bd0fb8127f98240ea
> 
> Does not look like something which could cause those errors. Is that
> problem reproducible? Only on these devices or on other too?
For a product we have many case of such corruption : bad index, bad  master node
, bad lpt, ...

But I don't believe it is a ubifs problem, but a bug on our side.

Thanks for your help,


Matthieu
