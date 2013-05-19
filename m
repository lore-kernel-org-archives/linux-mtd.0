Received: from mail-oa0-f44.google.com ([209.85.219.44])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ue9jf-0006pA-Oa
 for linux-mtd@lists.infradead.org; Sun, 19 May 2013 19:57:42 +0000
Received: by mail-oa0-f44.google.com with SMTP id n12so6954896oag.17
 for <linux-mtd@lists.infradead.org>; Sun, 19 May 2013 12:57:18 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 20 May 2013 01:27:18 +0530
Message-ID: <CAAnsJE-YmNEgyEGE1w6aAKbfbhV-ayDTD1Fg89vjqrc_U5OprA@mail.gmail.com>
Subject: Dynamically creating the volume based on the size of ubifs image size
From: Sibin K C <sibinkc@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a requirement to create a new volume (it can be static) based
on the size of the ubifs image (say rootfs.ubifs) which I am going to
write into that volume. The aim is to create the volume with the
minimum possible size required to write 'rootfs.ubifs' to that volume
and boot the device from it.

Can somebody please help me in this regard.

Regards,
Sibin
