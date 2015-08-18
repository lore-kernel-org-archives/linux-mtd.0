Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRcVh-0004Rb-FZ
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 08:44:46 +0000
Message-ID: <1439887462.31419.111.camel@gmail.com>
Subject: Re: [PATCH v5] ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, richard.weinberger@gmail.com
Cc: linux-mtd@lists.infradead.org
Date: Tue, 18 Aug 2015 11:44:22 +0300
In-Reply-To: <1439872825-4988-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1439872825-4988-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-08-18 at 12:40 +0800, Dongsheng Yang wrote:
> To make ubifs support atime flexily, this commit introduces
> a Kconfig option named as UBIFS_ATIME_SUPPORT.
> 
> With UBIFS_ATIME_SUPPORT=n:
> 	ubifs keeps the full compatibility to no_atime from
> the start of ubifs.
> =================UBIFS_ATIME_SUPPORT=n=======================
> -o - no atime
> -o atime - no atime
> -o noatime - no atime
> -o relatime - no atime
> -o strictatime - no atime
> -o lazyatime - no atime

And please, do include fsdevel when sending this patch.

Artem.
