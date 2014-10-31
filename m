Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xk1aT-0004I2-Rm
 for linux-mtd@lists.infradead.org; Fri, 31 Oct 2014 02:05:15 +0000
Message-ID: <5452EE06.3090502@huawei.com>
Date: Fri, 31 Oct 2014 10:03:50 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v5 1/4] ubi-utils: ubidump: add ubifs-media
References: <544788DA.9090401@huawei.com>
 <1414656102.23185.6.camel@sauron.fi.intel.com>
In-Reply-To: <1414656102.23185.6.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/10/30 16:01, Artem Bityutskiy wrote:
> On Wed, 2014-10-22 at 18:37 +0800, hujianyang wrote:
>> This is a preparatory patch for ubidump, an utility to print on-media
>> format of UBIFS partitions. This patch contains only one file named
>> ubifs-media.h which is entirely taken from linux kernel. This file
>> descibes the on-flash format of UBIFS objects and helps us to analyse
>> the data on the media.
>>
>> Note, the start up commit of this file is not a completely copy from
>> fs/ubifs/ubifs-media.h in kernel. Only the code which is used by
>> ubidump is now presented here.
> 
> I am going to push this patch instead:
> 
> 
>>From 0614ca6d41fc22bf994f1556b69c017aa676290f Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Date: Thu, 30 Oct 2014 09:55:51 +0200
> Subject: [PATCH] Move mkfs.ubifs/ubifs-media.h to include/mtd
> 
> This file will be shared with the ubidump tool in the future.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  include/mtd/ubifs-media.h | 747 ++++++++++++++++++++++++++++++++++++++++++++++
>  mkfs.ubifs/README         |   1 -
>  mkfs.ubifs/compr.c        |   1 -
>  mkfs.ubifs/mkfs.ubifs.h   |   3 +-
>  mkfs.ubifs/ubifs-media.h  | 747 ----------------------------------------------
>  5 files changed, 749 insertions(+), 750 deletions(-)
>  create mode 100644 include/mtd/ubifs-media.h
>  delete mode 100644 mkfs.ubifs/ubifs-media.h
> 
> ... snip ...
> 
> 

Seems wonderful~!

I've pulled the newest version of mtd-utils.git and compiled all the stuff
successfully.
