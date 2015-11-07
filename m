Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zv0sd-0007aD-U6
 for linux-mtd@lists.infradead.org; Sat, 07 Nov 2015 10:37:56 +0000
Subject: Re: [PATCH v7] ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com
References: <1446871571-21486-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <563DD46D.9060509@nod.at>
Date: Sat, 7 Nov 2015 11:37:33 +0100
MIME-Version: 1.0
In-Reply-To: <1446871571-21486-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Am 07.11.2015 um 05:46 schrieb Dongsheng Yang:
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
> 
> With UBIFS_ATIME_SUPPORT=y:
> 	ubifs supports the atime same with other main stream
> file systems.
> =================UBIFS_ATIME_SUPPORT=y=======================
> -o - default behavior (relatime currently)
> -o atime - atime support
> -o noatime - no atime support
> -o relatime - relative atime support
> -o strictatime - strict atime support
> -o lazyatime - lazy atime support
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> Reviewed-by: Richard Weinberger <richard@nod.at>

Applied!

Thanks,
//richard
