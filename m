Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmmFf-0004SH-Cv
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 09:52:02 +0000
Subject: Re: ubifs version 1 compatibility
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20090326074443.GA7842@cloud.net.au>
References: <20090326051508.GA4760@cloud.net.au>
	<1238049297.3321.20.camel@localhost.localdomain>
	<20090326074443.GA7842@cloud.net.au>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Mar 2009 11:50:23 +0200
Message-Id: <1238061023.3321.67.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-03-26 at 18:44 +1100, Hamish Moffatt wrote:
> Yes our version 1 media is from pre-mainline UBIFS and we took our
> chances by including it. We are shipping one product using 2.6.24 with
> old backported UBIFS and it's working very well. I don't have any
> expectations of support for the old version, so thanks for your
> assistance thus far.
> 
> Fortunately the kernel upgrade is for a newer product where we have some
> more flexibility in fixing this problem.
> 
> We can upgrade our boot loader to 2.6.29 also so that it can read UBIFS
> v4 media. This has to be co-ordinated with the main firmware image but
> this is reasonable.
> 
> We do have one volatile UBIFS volume that we want to preserve. Is there
> any way we could convert it? For example a user-space utility that could
> read the old media version?

I was looking at the version changes, and this bugfix:

http://git.infradead.org/users/dedekind/ubifs-historical-3.git?a=commit;h=b9903987e8efb5252b692ffc7c2b190f4a0e83b8

makes it very difficult to turn old image into new one. This will
basically mean we need:

1. extract files from the old image
2. feed them to mkfs.ubifs.

> Maybe before upgrade we could run mkfs.ubifs using the contents of the
> existing volume to create the new format, unmount it and ubiupdatevol it..

The easiest way to do this is to boot the old kernel,
e.g. in vmware, extract the files using the nandsim technique:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_nandsim

then feed them to mkfs.ubifs.

But yes, a user-space utility to extract files from an image would be
of course nicer, but again it is something which is not easy to do.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
