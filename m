Received: from fg-out-1718.google.com ([72.14.220.156])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MwdNC-0005OW-9y
	for linux-mtd@lists.infradead.org; Sat, 10 Oct 2009 14:56:47 +0000
Received: by fg-out-1718.google.com with SMTP id 16so54790fgg.0
	for <linux-mtd@lists.infradead.org>;
	Sat, 10 Oct 2009 07:56:39 -0700 (PDT)
MIME-Version: 1.0
Sender: hramrach@gmail.com
Date: Sat, 10 Oct 2009 16:56:39 +0200
Message-ID: <a5d587fb0910100756i1ed21291u2aea66ba06247844@mail.gmail.com>
Subject: broken dependency of drivers/mtd/maps/gpio-addr-flash.o
From: Michal Suchanek <hramrach@centrum.cz>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

It tried building the 2.6.32-rc3 kernel for i386.

This file fails to compile if gpiolib is not configured but it is
possible to select compilation of that file without selecting gpiolib.

I guess I do not need this file because I do not have gpio and it
really depends on it but drivers in the MTD section seemed to be
mostly enabled in distribution config and this was a new driver since
2.6.30.

If you want additional information please CC me.

Thanks

Michal
