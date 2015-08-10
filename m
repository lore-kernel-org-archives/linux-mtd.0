Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOiVW-0001Nm-QA
 for linux-mtd@lists.infradead.org; Mon, 10 Aug 2015 08:32:35 +0000
Message-ID: <1439195531.26877.103.camel@gmail.com>
Subject: Re: [PATCH v4] ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 richard.weinberger@gmail.com,  linux-mtd@lists.infradead.org
Date: Mon, 10 Aug 2015 11:32:11 +0300
In-Reply-To: <1438304996-31502-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1438304996-31502-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Could you please describe how you tested your patch. Did you run stress
tests with atime enabled, which ones?

On Fri, 2015-07-31 at 09:09 +0800, Dongsheng Yang wrote:
> +> 	> 	> sb->s_flags |= MS_ACTIVE;
> +#ifndef CONFIG_UBIFS_ATIME_SUPPORT
> +> 	> 	> sb->s_flags |= MS_NOATIME;
> +#else
> +> 	> 	> ubifs_warn(c, "************WARNING START****************");
> +> 	> 	> ubifs_warn(c, "Ubifs is supporting atime now, that would");
> +> 	> 	> ubifs_warn(c, "probably damage your flash. If you are not");
> +> 	> 	> ubifs_warn(c, "sure about it, please set UBIFS_ATIME_SUPPORT");
> +> 	> 	> ubifs_warn(c, "to 'N'.");
> +> 	> 	> ubifs_warn(c, "************WARNING END******************");

Could we please be a little be less scary.

1. I think these starting and ending "*****" lines are unnecessary.
2. Ah, and use "UBIFS", not "Ubifs" please.
3. Let's be shorter, just this should be enough:

ubifs_warn("full atime support is enabled, which may wear out your
flash faster");

Artem.
