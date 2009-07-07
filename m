Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOA9i-0006UT-8b
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 12:52:25 +0000
Subject: Re: ubiattach problem
From: Artem Bityutskiy <dedekind@infradead.org>
To: Oren <oren_s3@VERIFONE.com>
In-Reply-To: <1246968515.2208.4.camel@tlvorens3lnx>
References: <baa101c9fe67$d7b31f0a$b65b1ec0@verifone.com>
	<1246947926.20721.299.camel@localhost.localdomain>
	<1246962761.1775.7.camel@tlvorens3lnx>
	<1246963327.20721.306.camel@localhost.localdomain>
	<1246968515.2208.4.camel@tlvorens3lnx>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jul 2009 15:51:55 +0300
Message-Id: <1246971115.20721.308.camel@localhost.localdomain>
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

On Tue, 2009-07-07 at 15:08 +0300, Oren wrote:
> mkfs.ubifs/mkfs.ubifs -r ~/BRCMLinux/Linux_2_6_27/mtd-utils/myrfs
> --compr="none" -m 2048 -e 129024 -c 2047 -o images/ubifs_ncomp.img
> ubi-utils/ubinize -o images/ubi_ncomp.img -m 2048 -p 128KiB -s 2048
> images/ubinize.cfg
> 
> 
> ubinize.cfg:
> 
> [ubifs]
> mode=ubi
> image=images/ubifs_ncomp.img
> vol_id=0
> vol_size=16MiB
> vol_type=dynamic
> vol_name=rootfs
> vol_flags=autoresize
> 

Can you add -v to ubinize and see if there is a
"writing layout volume" print?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
