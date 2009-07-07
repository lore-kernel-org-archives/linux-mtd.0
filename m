Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MO88y-0001e1-NE
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 10:43:32 +0000
Subject: Re: ubiattach problem
From: Artem Bityutskiy <dedekind@infradead.org>
To: Oren <oren_s3@VERIFONE.com>
In-Reply-To: <1246962761.1775.7.camel@tlvorens3lnx>
References: <baa101c9fe67$d7b31f0a$b65b1ec0@verifone.com>
	<1246947926.20721.299.camel@localhost.localdomain>
	<1246962761.1775.7.camel@tlvorens3lnx>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jul 2009 13:42:07 +0300
Message-Id: <1246963327.20721.306.camel@localhost.localdomain>
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

On Tue, 2009-07-07 at 13:32 +0300, Oren wrote:
> ubiformat /dev/mtd0 -s 2048 -f ubi_ncomp.img
> ubiformat: mtd0 (nand), size 16777216 bytes (16.0 MiB), 128 eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes

Err, wait, you flash an image. Then the image propbably
does not have the volume table. How do you generate the
image?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
