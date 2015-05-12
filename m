Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsG0z-0001Pw-4t
 for linux-mtd@lists.infradead.org; Tue, 12 May 2015 19:38:53 +0000
Received: by igbyr2 with SMTP id yr2so118565455igb.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2015 12:38:31 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 12 May 2015 22:38:31 +0300
Message-ID: <CAHafNYtURNYAxuYROnEU++1c=uF2Jq-oFEKTkDhUPQtdCnpcHQ@mail.gmail.com>
Subject: Cannot mount ubifs partition
From: Michael N <michael.niarchos@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using a Zynq7000 with NAND 512MB and I am trying to deploy Linux on NAND
memory. I use a custom built kernel with minimal features (UBI and UBIFS
support are enabled and mtd-utils installed). I can ubiformat an mtd
partition, I
can ubiattach and ubidetach it but whenever I try to mount the
partition I get this error.

           mount: mounting /dev/ubi0:ubi-rootfs on /mnt/ubifs failed:
No such device

(ubi-rootfs is the name of the partition, I am sure about it)

I am sorry if I am asking about a problem that has been reported before,
but I am
new to this list

Thanks in advance,
Michael
