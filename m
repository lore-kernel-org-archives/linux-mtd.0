Received: from na3sys009aog105.obsmtp.com ([74.125.149.75])
 by bombadil.infradead.org with smtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFXhs-0006ME-Nq
 for linux-mtd@lists.infradead.org; Fri, 08 Aug 2014 00:06:53 +0000
Received: by mail-pa0-f51.google.com with SMTP id ey11so6262191pad.38
 for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2014 17:06:30 -0700 (PDT)
Received: from dbowen3 (c-71-199-15-226.hsd1.ut.comcast.net. [71.199.15.226])
 by mx.google.com with ESMTPSA id
 jf8sm1034678pbd.5.2014.08.07.17.06.28
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Aug 2014 17:06:29 -0700 (PDT)
From: "Daniel Bowen" <dbowen@logitech.com>
To: <linux-mtd@lists.infradead.org>
Subject: Question about ubiformat
Date: Thu, 7 Aug 2014 18:06:27 -0600
Message-ID: <1a5301cfb29c$9a4ec6d0$ceec5470$@com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-language: en-us
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Let's say that I've prepared an image using mkfs.ubifs and ubinize.  Is
there any advantage, disadvantage or difference to doing ubiformat twice -
once without specifying an image file, then running it a second time with an
image file?  In other words, is there a difference between these two
sequences:

ubiformat /dev/mtd4
ubiformat /dev/mtd4 -f /mnt/source/ubi.img

and

ubiformat /dev/mtd4 -f /mnt/source/ubi.img

Thanks!
-Daniel
