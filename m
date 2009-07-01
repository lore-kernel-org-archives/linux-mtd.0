Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MLwT5-0007SL-NL
	for linux-mtd@lists.infradead.org; Wed, 01 Jul 2009 09:51:14 +0000
Subject: Re: about ubiformat mtdblock
From: Artem Bityutskiy <dedekind@infradead.org>
To: tommy <jiujin.hong@mid-fun.com>
In-Reply-To: <1246409674.6221.1.camel@tommy-desktop>
References: <1246010592.12367.0.camel@tommy-desktop>
	<1246013172.9487.66.camel@localhost.localdomain>
	<1246074583.4250.4.camel@tommy-desktop>
	<1246102372.9487.80.camel@localhost.localdomain>
	<1246241677.7834.5.camel@tommy-desktop>
	<1246373466.20721.12.camel@localhost.localdomain>
	<1246409674.6221.1.camel@tommy-desktop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jul 2009 12:50:52 +0300
Message-Id: <1246441852.20721.13.camel@localhost.localdomain>
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

On Wed, 2009-07-01 at 08:54 +0800, tommy wrote:
> No
> root@localhost:/# mount
> rootfs on / type rootfs (rw)
> ubi0:ubifs1 on / type ubifs (rw)
> proc on /proc type proc (rw)
> sysfs on /sys type sysfs (rw)
> ubi0:ubifs1 on /dev/.static/dev type ubifs (rw)
> tmpfs on /dev type tmpfs (rw)
> ubi1:data on /media type ubifs (rw)
> tmpfs on /var type tmpfs (rw)
> root@localhost:/# 

I mean can you mount it if you do it by hand, not via
fstab. I.e., call mount -t ubifs ...

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
