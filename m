Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSMLO-0007j6-IG
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 09:41:11 +0000
Subject: Re: [PATCH] ubifs: Remove unused "security.*" xattr handler
To: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>,
 linux-mtd@lists.infradead.org
References: <1440063115-10055-1-git-send-email-agruenba@redhat.com>
Cc: Subodh Nijsure <snijsure@grid-net.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Sheng Yong <shengyong1@huawei.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <55D5A09B.1080900@nod.at>
Date: Thu, 20 Aug 2015 11:40:43 +0200
MIME-Version: 1.0
In-Reply-To: <1440063115-10055-1-git-send-email-agruenba@redhat.com>
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

Am 20.08.2015 um 11:31 schrieb Andreas Gruenbacher:
> Ubifs installs a "security.*" xattr handler in sb->s_xattr but doesn't use the
> generic_{get,set,list,remove}xattr inode operations needed for processing this
> list of attribute handlers; the handler is never called.  Instead, ubifs uses
> its own xattr handlers which also process "security.*" xattrs.
> 
> Remove the dead code.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> Cc: Subodh Nijsure <snijsure@grid-net.com>
> ---
>  fs/ubifs/super.c |  1 -
>  fs/ubifs/ubifs.h |  1 -
>  fs/ubifs/xattr.c | 40 ----------------------------------------
>  3 files changed, 42 deletions(-)

I sent already a patch for that:
http://lists.infradead.org/pipermail/linux-mtd/2015-August/061242.html

Thanks,
//richard
