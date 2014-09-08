Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQxSi-0005V8-Fx
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 11:50:24 +0000
Message-ID: <1410177001.10764.158.camel@sauron.fi.intel.com>
Subject: Re: mtd-utils-1.5.1 bug report
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: David Binderman <dcb314@hotmail.com>
Date: Mon, 08 Sep 2014 14:50:01 +0300
In-Reply-To: <DUB128-W61F274D19C6B54433EDD629CC00@phx.gbl>
References: <DUB128-W61F274D19C6B54433EDD629CC00@phx.gbl>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-09-07 at 14:58 +0000, David Binderman wrote:
> Hello there,
> 
> ubi-utils/ubiformat.c:636:28: warning: logical not is only applied to the left hand side of comparison [-Wlogical-not-parentheses]
> 
>                 if (!args.subpage_size != mtd->min_io_size)
>                     normsg("may be sub-page size is "
>                            "incorrect?");
> 
> Something boolean compared to a size. Looks a possible problem to me.
> Removal of the double negative might also help.

Care to send a patch?

-- 
Best Regards,
Artem Bityutskiy
