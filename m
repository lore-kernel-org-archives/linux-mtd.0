Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAgxR-0003dq-O2
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 18:12:32 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: [PATCH v2 51/53] usb: fix the comment with regards to DocBook
Date: Tue, 16 May 2017 15:11:58 -0300
Message-Id: <ce4a23cca5f809a588bd53c3289e6b953bb7ccc3.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <dca1e58e3f1c82a840abaafb9328f84ae69a9926.1494935649.git.mchehab@s-opensource.com>
References: <dca1e58e3f1c82a840abaafb9328f84ae69a9926.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The USB gadget documentation is not at DocBook anymore.
The main file was converted to ReST, and stored at
Documentation/driver-api/usb/gadget.rst, but there are
still several plain text files related to gadget under
Documentation/usb.

So, be generic and just mention documentation
without specifying where it is.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 drivers/usb/gadget/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index c164d6b788c3..b3c879b75a39 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -41,7 +41,7 @@ menuconfig USB_GADGET
 	   don't have this kind of hardware (except maybe inside Linux PDAs).
 
 	   For more information, see <http://www.linux-usb.org/gadget> and
-	   the kernel DocBook documentation for this API.
+	   the kernel documentation for this API.
 
 if USB_GADGET
 
-- 
2.9.3
