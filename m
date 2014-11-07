Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmZaq-0008Ay-8D
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 02:48:08 +0000
Received: by mail-pa0-f50.google.com with SMTP id eu11so2546894pac.37
 for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2014 18:47:45 -0800 (PST)
Message-ID: <545C32CF.9060502@graphitesystems.com>
Date: Thu, 06 Nov 2014 18:47:43 -0800
From: K Richard Pixley <rpixley@graphitesystems.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: jffs2 usage question: nandwrite
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm a newbie to flash file systems and I've spent my day reading. 
However, I seem to be missing something.

Several sets of instructions encourage me to build my file system using 
mkfs.jffs2, which I understand creates an image, (akin to mkisofs), 
rather than operating on a device file.  However, once I have the image, 
they recommend placing the image onto flash using nandwrite.

I can't find any doc on nandwrite, but I'm guessing that it does a "bad 
block aware" sequential copy, meaning that it simply skips any blocks 
that it recognizes as bad according to a manufacturer mark. Assuming so, 
doesn't this hole in my fresh jffs2 file system cause jffs2 grief?  I 
mean, it would cause most other file systems grief to have an extra 
block inserted in the middle of their block sequence.

What am I missing?

--rich
