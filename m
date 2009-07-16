Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRPb7-0007ND-1x
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 11:58:05 +0000
Subject: Re: [PATCH 0/2] RFC: Add support for UBI and UBIFS
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentincj@iksaif.net>
In-Reply-To: <1247650724-16288-1-git-send-email-corentincj@iksaif.net>
References: <1247650724-16288-1-git-send-email-corentincj@iksaif.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Jul 2009 14:57:10 +0300
Message-Id: <1247745430.11353.133.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, tytso@mit.edu
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-15 at 11:38 +0200, Corentin Chary wrote:
> Hi,
> Here is two patch to add support for UBI and UBIFS in libblkid
> With that, if you type "blkid" it will show you UBIFS filesystem.
> 
> The thing is that I'm not sure this patch is really usefull as UBIFS
> is a "nodev" filesystem, and it doesn't deal with block devices.
> 
> I first started theses patch to be able to do stuff like:
> mount /dev/ubi0_0 /mnt/test but we need to patch UBIFS for that.

Should not be difficult to implement in UBIFS.

> So, do you think we should be able to do that ? If it's ok, these
> two patch are a first step.

No comments from my side, I do not use the library so I cannot
really comment on this.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
