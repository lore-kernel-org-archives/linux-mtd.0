Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zt44y-000101-5K
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 01:38:37 +0000
Message-ID: <5636BCE2.70607@cn.fujitsu.com>
Date: Mon, 2 Nov 2015 09:31:14 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
CC: <david@sigma-star.at>
Subject: Re: [RFC] UBIFS unpacker v0
References: <1446290160-30696-1-git-send-email-richard@nod.at>
In-Reply-To: <1446290160-30696-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,
	I updated my work, then I can't apply your
patch on my latest branch now. Could you rebase them
against:

https://github.com/yangdongsheng/mtd-utils ubifs_dump_v2.1

I will give a try to play with the unpack tool :).

Yang

On 10/31/2015 07:15 PM, Richard Weinberger wrote:
> Hi!
>
> This is the first public release of the UBIFS unpack tool.
> Using this tool you can unpack an UBIFS to a local directory,
> it can operate directly on UBI volumes (i.e. /dev/ubiX_Y)
> or nanddumps (without OOB!). If you dump from a nandump,
> you have to specify the UBI volume ID you want to dump from.
> So far it is rather strict and refuses to unpack if the filesystem
> is corrupted. We plan to implement also a "fuzzy unpack" mode.
>
> The patches apply on Yang's mtd-utils restructure work.
>
> Thanks,
> //richard
>
> David Gstir (10):
>        ubifs: fix typo in ubifs_read
>        Make cli byte parsing from ubi-utils available for all tools
>        ubifs: add decompression functions
>        ubifs: remove ununsed ubifs context from key helpers
>        ubifs: keep scan buffer in ubifs_info
>        ubifs: extend master scanning code
>        ubifs: add missing include to defs.h
>        ubifs: Add more key helper functions
>        ubifs: add emubi, a minimal UBI emulation layer
>        ubifs: add ubifs_unpack
>
> Richard Weinberger (1):
>        ubifs: add complete version of list.h
>
>   Makefile                                |  11 +-
>   include/common.h                        |  90 ++++
>   ubi-utils/include/ubiutils-common.h     |   2 -
>   ubi-utils/mtdinfo.c                     |   6 +-
>   ubi-utils/ubiattach.c                   |   6 +-
>   ubi-utils/ubiformat.c                   |   8 +-
>   ubi-utils/ubimkvol.c                    |   6 +-
>   ubi-utils/ubinfo.c                      |  10 +-
>   ubi-utils/ubinize.c                     |  10 +-
>   ubi-utils/ubirsvol.c                    |   2 +-
>   ubi-utils/ubiutils-common.c             |  93 ----
>   ubifs-utils/include/compr.h             |   1 +
>   ubifs-utils/include/defs.h              |   1 +
>   ubifs-utils/include/emubi.h             |  82 +++
>   ubifs-utils/include/io.h                |   2 +
>   ubifs-utils/include/key.h               | 102 +++-
>   ubifs-utils/include/list.h              | 305 +++++++----
>   ubifs-utils/include/list_sort.h         |  11 +
>   ubifs-utils/include/master.h            |   7 +
>   ubifs-utils/include/ubifs.h             |  62 +++
>   ubifs-utils/lib/compr.c                 |  75 +++
>   ubifs-utils/lib/emubi.c                 | 371 ++++++++++++++
>   ubifs-utils/lib/io.c                    |  65 ++-
>   ubifs-utils/lib/list_sort.c             | 157 ++++++
>   ubifs-utils/lib/master.c                | 311 ++++++++++++
>   ubifs-utils/lib/scan.c                  |  20 +-
>   ubifs-utils/mkfs.ubifs/mkfs.ubifs.c     |  66 +--
>   ubifs-utils/ubifs_dump/ubifs_dump.c     |  89 +---
>   ubifs-utils/ubifs_unpack/index.c        | 648 ++++++++++++++++++++++++
>   ubifs-utils/ubifs_unpack/replay.c       | 865 ++++++++++++++++++++++++++++++++
>   ubifs-utils/ubifs_unpack/ubifs_unpack.c | 619 +++++++++++++++++++++++
>   ubifs-utils/ubifs_unpack/ubifs_unpack.h | 107 ++++
>   32 files changed, 3832 insertions(+), 378 deletions(-)
> .
>
