Received: from fg-out-1718.google.com ([72.14.220.152])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LJoBs-0004YU-Jg
	for linux-mtd@lists.infradead.org; Mon, 05 Jan 2009 12:04:16 +0000
Received: by fg-out-1718.google.com with SMTP id 13so543774fge.26
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Jan 2009 04:04:14 -0800 (PST)
Message-ID: <c70ff3ad0901050404p72ac5a5dt61792e4d77449ab@mail.gmail.com>
Date: Mon, 5 Jan 2009 14:04:14 +0200
From: "saeed bishara" <saeed.bishara@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: flash_unlock fails to unlock my m25p32 flash
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
    I'm using kernel based in version 2.6.26.5, and my board has a 4M
Flash ST-M25P32-VMF6P connected through spi.
    I have read access, and write access works when I do protect off
from uboot. but I can't do unlock from linux (flash_unlock fails on
-1 EOPNOTSUPP (Operation not supported)). the mtd-utils version is
20080508-1.

   Is this version of the kernel support unlocking? if yes, what does
my system missing?
