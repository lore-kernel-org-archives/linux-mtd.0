Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjkxR-000219-45
 for linux-mtd@lists.infradead.org; Thu, 30 Oct 2014 08:19:49 +0000
Message-ID: <1414657165.23185.10.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v5 3/4] ubi-utils: ubidump: introduce ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Thu, 30 Oct 2014 10:19:25 +0200
In-Reply-To: <54478A47.3080102@huawei.com>
References: <544788DA.9090401@huawei.com> <54478A47.3080102@huawei.com>
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

On Wed, 2014-10-22 at 18:43 +0800, hujianyang wrote:
> +static const char optionsstr[] =
> +"-h, --help            print help message\n"
> +"-l, --lnum            logic eraseblock num to dump\n"
> +"-i, --info            show explicit information about ubifs-level\n"

So what does this '-i' option do? I cannot grasp this from the comment.
