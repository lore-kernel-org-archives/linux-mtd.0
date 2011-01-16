Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PeaOX-0008PF-7M
	for linux-mtd@lists.infradead.org; Sun, 16 Jan 2011 21:44:18 +0000
Received: by fxm19 with SMTP id 19so5199011fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Jan 2011 13:44:15 -0800 (PST)
Subject: Re: [PATCH] New ubitunefs command to adjust tunable filesystem
	parameters on ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: stefani@seibold.net
In-Reply-To: <1293790128-4986-1-git-send-email-stefani@seibold.net>
References: <1293790128-4986-1-git-send-email-stefani@seibold.net>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 16 Jan 2011 23:44:11 +0200
Message-ID: <1295214251.2470.15.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Artem.Bityutskiy@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-12-31 at 11:08 +0100, stefani@seibold.net wrote:
> From: Stefani Seibold <stefani@seibold.net>
> 
> ubitunefs allows the system administrator to adjust various tunable
> filesystem  parameters on Linux ubifs filesystems. The current values of these
> parameters can be displayed by using the -v or calling without any option.
> 
> Currently the ubitunefs supports the following parameters:
> 
> -x, --compr=<none|lzo|zlib>    compression type
> -R, --reserved=SIZE            how much space should be reserved for super-user
> 
> Maybe it will be nice to adjust also the uid and gid of the reserved owner,
> or the increase the max. size of the ubi filesystem. This will be very simple
> to implement.
> 
> Signed-off-by: Stefani Seibold <stefani@seibold.net>

Stefani,

thanks for the patch. I have not gone through it, but could we please
keep UBI and UBIFS things separate. The "ubi-utils" directory is for
UBI, could we please avoid putting this UBIFS tool there? Instead, would
it please be possible to:
  A. re-name the "mkfs.ubifs" directory into "ubifs-utils", and put your
     new tool there.
  B. re-name the tool to something which suggests a bit better that this
     is about UBIFS (not UBI), e.g.
        * tuneubifs (similar to tune2fs)
        * ubifsctl (similar to btrfsctl)

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
