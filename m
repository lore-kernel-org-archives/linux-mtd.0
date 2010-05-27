Received: from ey-out-1920.google.com ([74.125.78.149])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OHcJW-000808-1t
	for linux-mtd@lists.infradead.org; Thu, 27 May 2010 12:35:54 +0000
Received: by ey-out-1920.google.com with SMTP id 13so340885eye.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 May 2010 05:35:53 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 27 May 2010 16:35:52 +0400
Message-ID: <AANLkTilnoHOkPiAUnQ9dqUZnJAVcB_x8GW12lB1du6WV@mail.gmail.com>
Subject: protecting and unprotecting of NOR flash
From: Sergey Lapin <slapinid@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi, all!
I'm new to mtd kernel code base, where could I fond code, which
protects and unprotects my NOR
flash chip? it is AT49BV642D
u-boot is capable of protecting it with protect command, I need to
find where it is being
un-protected in Linux, because I can erase and write blocks which I
protected in u-boot before
I don't want for kernel to touch protection status
so I'd like to find which code to disable and protect/unprotect chip
using boot loader.

Thanks a lot,
S.
