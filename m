Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TiqpS-0006rX-ST
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 18:14:47 +0000
Received: by mail-vc0-f177.google.com with SMTP id m8so1131308vcd.36
 for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2012 10:14:43 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 12 Dec 2012 13:14:43 -0500
Message-ID: <CAOd_LFycV4LUmk=Ua+f64AsL_BxFqmw_wF601RbdO9ou94_kow@mail.gmail.com>
Subject: whiteout for UBIFS
From: Cliff Brake <cliff.brake@gmail.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm trying to use overlayfs with UBIFS, and its complaining about lack
of whiteout support (with kernel 3.5).  Has anyone looked into
implementing this, and are there patches available?

Thanks,
Cliff

-- 
=================
http://bec-systems.com
