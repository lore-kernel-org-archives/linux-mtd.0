Received: from mk-filter-3-a-1.mail.uk.tiscali.com ([212.74.100.54])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LWFi6-0000YD-11
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2009 19:53:11 +0000
Subject: Re: [PATCH] sh: maple: add support for Visual Memory Card devices,
	and make consequential changes to maple input drivers - 0/3 - v5 - diff
	stat correction
From: Adrian McMenamin <adrian@newgolddream.dyndns.info>
To: Paul Mundt <lethal@linux-sh.org>, Greg KH <greg@kroah.com>,
	dwmw2 <dwmw2@infradead.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <1234122069.6736.8.camel@localhost.localdomain>
References: <1234122069.6736.8.camel@localhost.localdomain>
Content-Type: text/plain
Date: Sun, 08 Feb 2009 19:52:17 +0000
Message-Id: <1234122737.6736.17.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-input <linux-input@vger.kernel.org>,
	MTD <linux-mtd@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	linux-sh <linux-sh@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Great start... sorry here is correct diff stat for these patches...

Signed-off-by: Adrian McMenamin <adrian@mcmen.demon.co.uk>
---
 
 drivers/input/joystick/maplecontrol.c |    4 +-
 drivers/input/keyboard/maple_keyb.c   |   37 +-
 drivers/mtd/maps/Kconfig              |   12 +-
 drivers/mtd/maps/Makefile             |    1 +
 drivers/mtd/maps/vmu-flash.c          |  827 +++++++++++++++++++++++++++++++++
 drivers/sh/maple/maple.c              |  463 ++++++++++---------
 include/linux/maple.h                 |   62 ++-
 7 files changed, 1139 insertions(+), 267 deletions(-)
