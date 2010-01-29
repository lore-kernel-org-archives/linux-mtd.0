Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NawMt-0008TA-2o
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 19:19:03 +0000
Received: by ewy23 with SMTP id 23so133457ewy.4
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jan 2010 11:18:57 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 29 Jan 2010 14:18:56 -0500
Message-ID: <dbdb2ea61001291118v78722d73gee24345e61e41766@mail.gmail.com>
Subject: ubiformat image verification
From: twebb <taliaferro62@gmail.com>
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

Can the image that is written to NAND using ubiformat be read back
(using nanddump) and compared identically to the original image file?
I want to somehow verify that the image was written error-free to NAND
flash.

Thanks,
twebb
