Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MLxe0-0006sD-WA
	for linux-mtd@lists.infradead.org; Wed, 01 Jul 2009 11:06:35 +0000
Subject: Re: about ubiformat mtdblock
From: Artem Bityutskiy <dedekind@infradead.org>
To: tommy <jiujin.hong@mid-fun.com>
In-Reply-To: <1246445931.10969.4.camel@tommy-desktop>
References: <1246010592.12367.0.camel@tommy-desktop>
	<1246013172.9487.66.camel@localhost.localdomain>
	<1246074583.4250.4.camel@tommy-desktop>
	<1246102372.9487.80.camel@localhost.localdomain>
	<1246241677.7834.5.camel@tommy-desktop>
	<1246373466.20721.12.camel@localhost.localdomain>
	<1246409674.6221.1.camel@tommy-desktop>
	<1246441852.20721.13.camel@localhost.localdomain>
	<1246445026.10830.0.camel@tommy-desktop>
	<1246445133.20721.15.camel@localhost.localdomain>
	<1246445931.10969.4.camel@tommy-desktop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jul 2009 14:06:11 +0300
Message-Id: <1246446371.20721.22.camel@localhost.localdomain>
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

On Wed, 2009-07-01 at 18:58 +0800, tommy wrote:
> ps:
> 
> if my board nfs boot ,not ubifs boot,following is ok!
> nfs@root:ubiattach /dev/ubi_ctrl -m 2
> nfs@root:mount -t ubifs ubi0_0 /mnt /
> it it ok!

Try adding:

ubi.mtd=0 root=ubi0_0 rootfstype=ubifs

to the kernel boot line.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
