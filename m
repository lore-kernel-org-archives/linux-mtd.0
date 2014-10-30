Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjkWs-0005WT-KF
 for linux-mtd@lists.infradead.org; Thu, 30 Oct 2014 07:52:23 +0000
Message-ID: <1414655495.23185.3.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v5 1/4] ubi-utils: ubidump: add ubifs-media
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Thu, 30 Oct 2014 09:51:35 +0200
In-Reply-To: <544788DA.9090401@huawei.com>
References: <544788DA.9090401@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
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

On Wed, 2014-10-22 at 18:37 +0800, hujianyang wrote:
> This is a preparatory patch for ubidump, an utility to print on-media
> format of UBIFS partitions. This patch contains only one file named
> ubifs-media.h which is entirely taken from linux kernel. This file
> descibes the on-flash format of UBIFS objects and helps us to analyse
> the data on the media.
> 
> Note, the start up commit of this file is not a completely copy from
> fs/ubifs/ubifs-media.h in kernel. Only the code which is used by
> ubidump is now presented here.

But we already have ubifs-media.h in the tree, it is in mkfs.ubifs. Just
move it include and re-use. Let's not introduce the 2nd version.
