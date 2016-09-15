Received: from nbd.name ([2a01:4f8:131:30e2::2])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkT5G-0006sw-Tk
 for linux-mtd@lists.infradead.org; Thu, 15 Sep 2016 09:35:56 +0000
Subject: Re: [PATCH v2 0/4] ubifs: Add overlayfs support
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <1473884932-23689-1-git-send-email-richard@nod.at>
Cc: linux-kernel@vger.kernel.org, dedekind1@gmail.com, adrian.hunter@intel.com
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <786eb0b8-f62a-8bac-951a-3f86bde4b7f3@nbd.name>
Date: Thu, 15 Sep 2016 11:35:23 +0200
MIME-Version: 1.0
In-Reply-To: <1473884932-23689-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2016-09-14 22:28, Richard Weinberger wrote:
> To support overlayfs in a proper way a filesystem has to offer support
> for DT_CHR, RENAME_WHITEOUT and RENAME_EXCHANGE.
> While UBIFS supports DT_CHR it lacks support for RENAME_WHITEOUT and
> RENAME_EXCHANGE. This patch series implement the missing bits.
> RENAME_WHITEOUT itself depends on O_TMPFILE, therefore O_TMPFILE is now
> also supported.
> 
> Changes since v1:
>  - Build fix for CONFIG_LOCKDEP=y
>  - Fix for wrong dentry name length calculation in ubifs_jnl_xrename()
>  - Fix for wrong directory link count after RENAME_EXCHANGE
> 
> Richard Weinberger (4):
>   ubifs: Implement O_TMPFILE
>   ubifs: Implement RENAME_WHITEOUT
>   ubifs: Implement RENAME_EXCHANGE
>   ubifs: Use move variable in ubifs_rename()
Tested-by: Felix Fietkau <nbd@nbd.name>
