Received: from mail-qc0-f169.google.com ([209.85.216.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xt0Rw-0007dG-H8
 for linux-mtd@lists.infradead.org; Mon, 24 Nov 2014 20:41:33 +0000
Received: by mail-qc0-f169.google.com with SMTP id w7so7518810qcr.14
 for <linux-mtd@lists.infradead.org>; Mon, 24 Nov 2014 12:41:10 -0800 (PST)
Received: from rodcwin7 (50-76-112-141-static.hfc.comcastbusiness.net.
 [50.76.112.141])
 by mx.google.com with ESMTPSA id f65sm12817300qga.9.2014.11.24.12.41.08
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 24 Nov 2014 12:41:09 -0800 (PST)
From: Rod Campbell <rod.campbell@telosalliance.com>
To: <linux-mtd@lists.infradead.org>
Subject: Read-only file systems using NAND/MTD
Date: Mon, 24 Nov 2014 15:41:08 -0500
Message-ID: <006d01d00826$fa33c2a0$ee9b47e0$@TelosAlliance.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Is there an update about implementing a read-only file system on NAND?  The
most recent discussion I could find was from May 2012:  

http://lists.infradead.org/pipermail/linux-mtd/2012-May/041200.html

The conclusion seemed to be to use ubi underneath something like squashfs to
provide bad-block awareness.  Is this still the recommended solution?  

Thanks,
Rod Campbell

>From the desk of:
Rod Campbell
Senior Software Engineer
Linear Acoustic Inc.
108 Foxshire Drive, Lancaster PA 17601
Tel: 717-735-3611
Fax: 717-735-3612
E-mail: Rod.Campbell@TelosAlliance.com
www.linearacoustic.com
