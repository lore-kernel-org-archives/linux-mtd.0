Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7KDS-0001ZD-VD
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 08:05:32 +0000
Message-ID: <1405497907.1920.27.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 6/7] New utility ubidump
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Wed, 16 Jul 2014 11:05:07 +0300
In-Reply-To: <53BA4B98.1080000@huawei.com>
References: <53BA491E.8060502@huawei.com> <53BA4B98.1080000@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-07-07 at 15:26 +0800, hujianyang wrote:
> +"-h, --help		print help message\n"
> +"-n, --lnum		logic eraseblock num to dump\n"

I envision that in the future people may want to specify PEB number
instead of LEB number, and '-n' becomes a confusing name for the option.
Could you please only support '--lnum', and drop '-n' altogether. Then
in the future someone may add '--pnum' support.

> +"-i, --info		show explicit information about NODEs\n"

I do not understand what this means from the description. Would you
please try to describe it better in the help text?

> +"-H, --header		show only header information\n"
> +"-N, --node		show only NODEs information\n"

Same for these.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
