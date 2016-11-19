Received: from tux.runtux.com ([176.9.82.136])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8DIS-00087c-6u
 for linux-mtd@lists.infradead.org; Sat, 19 Nov 2016 21:35:41 +0000
Received: from localhost (localhost [127.0.0.1])
 by tux.runtux.com (Postfix) with ESMTP id A2DC46F1E9
 for <linux-mtd@lists.infradead.org>; Sat, 19 Nov 2016 22:25:10 +0100 (CET)
Received: from tux.runtux.com ([127.0.0.1])
 by localhost (tux2.runtux.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id E-JOfkR_IIJI for <linux-mtd@lists.infradead.org>;
 Sat, 19 Nov 2016 22:25:09 +0100 (CET)
Received: from bee.priv.zoo (91-118-140-5.dsl.dynamic.surfer.at [91.118.140.5])
 (Authenticated sender: postmaster@runtux.com)
 by tux.runtux.com (Postfix) with ESMTPSA id 6ED906EFC7
 for <linux-mtd@lists.infradead.org>; Sat, 19 Nov 2016 22:25:09 +0100 (CET)
Date: Sat, 19 Nov 2016 22:25:08 +0100
From: Ralf Schlatterbeck <rsc@runtux.com>
To: linux-mtd@lists.infradead.org
Subject: init_constants_early: too small LEBs?
Message-ID: <20161119212508.GA5237@runtux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to get an ubifs on a 2MB NOR flash.

I'm following the usual steps for generating everything from inside the 
embedded system:
ubiformat /dev/mtd7
ubiattach /dev/ubi_ctrl -m 7 -d 7
ubimkvol /dev/ubi7 -N testvol -s 1968KiB

But when I try to mount I'm getting:
# mount -t ubifs /dev/ubi7_0 /mnt/
mount: mounting /dev/ubi7_0 on /mnt/ failed: Invalid argument

and the kernel log tells me:
Nov 19 21:07:33 board kernel: UBIFS error (pid 1504):
init_constants_early: too small LEBs (3968 bytes), min. is 15360 bytes

Any advice on what to try next?

Should I use a jffs2 on top of UBI using gluebi or run jffs2 on the
naked md device instead? I'd really like to be bad block tolerant but
don't know if this makes sense with NOR-Flash (of this size) at all.

Thanks
Ralf
-- 
Dr. Ralf Schlatterbeck                  Tel:   +43/2243/26465-16
Open Source Consulting                  www:   http://www.runtux.com
Reichergasse 131, A-3411 Weidling       email: office@runtux.com
