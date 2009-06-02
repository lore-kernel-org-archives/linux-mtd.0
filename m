Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MBSzk-0005tV-LJ
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 12:21:39 +0000
Subject: Re: ubiformat error
From: Artem Bityutskiy <dedekind@infradead.org>
To: Manoj <manoj23@gmail.com>
In-Reply-To: <1c3f4270905281908g75069b39sbc2167b5a3d32d1b@mail.gmail.com>
References: <1c3f4270905281908g75069b39sbc2167b5a3d32d1b@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Jun 2009 15:21:19 +0300
Message-Id: <1243945279.5847.27.camel@localhost.localdomain>
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

On Thu, 2009-05-28 at 19:08 -0700, Manoj wrote:
> I am trying to flash an UBI image to NAND flash. But I get an error
> about "No such file or directory".
> 
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 01000000 00020000 "NAND-block1"
> mtd1: 01e00000 00020000 "jffs2"
> mtd2: 0d200000 00020000 "NAND-block2"
> # ubiformat /dev/mtd1
> ubiformat: error!: cannot get information about "/dev/mtd1"
>            error 2 (No such file or directory)
> # ls -l /dev/mtd1
> crw-rw-r--    1 root     root      90,   2 Dec 31 16:00 /dev/mtd1
> 
> I am able to do ubiattach with mtd1, create an empty volume and mount
> the volume as ubifs.

Hi, I've just push a fix for this to mtd-utils git. Please,
verify it. Thanks.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
