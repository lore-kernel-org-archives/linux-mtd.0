Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MR321-0006cI-VR
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 11:52:24 +0000
Subject: Re: Mounting more than one ubifs fails on 2.6.31-rc2
From: Artem Bityutskiy <dedekind@infradead.org>
To: Tobias Diedrich <ranma+kernel@tdiedrich.de>
In-Reply-To: <20090715113210.GB16289@yamamaya.is-a-geek.org>
References: <20090715113210.GB16289@yamamaya.is-a-geek.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Jul 2009 14:52:11 +0300
Message-Id: <1247658731.11353.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-15 at 13:32 +0200, Tobias Diedrich wrote:
> I get the following error when trying to mount a second ubifs:
> "mount: File exists"
> Apparently the problem is that ubifs is registered in /sys/class/bdi
> with it's name 'ubifs' instead of the ubi device major/minor and
> so can only be registered once.
> 
> navi:/home/ranma# mount -t ubifs ubi1:rootfs /mnt/ubi1
> navi:/home/ranma# mount -t ubifs ubi0:rootfs /mnt/ubi0
> mount: File exists
> navi:/home/ranma# umount /mnt/ubi1
> navi:/home/ranma# mount -t ubifs ubi0:rootfs /mnt/ubi0
> navi:/home/ranma# mount -t ubifs ubi1:rootfs /mnt/ubi1
> mount: File exists
> 
> The corresponding kernel error messages is:
> sysfs: cannot create duplicate filename '/class/bdi/ubifs'
> 

Was fixed recently:

http://git.infradead.org/ubifs-2.6.git?a=commit;h=7fcd9c3ecbf09c0a77db7ba01aac75b32fb79a93

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
