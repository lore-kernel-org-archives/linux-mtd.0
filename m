Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2OKa-0000HZ-GX
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2018 22:18:54 +0000
Received: by mail-pf1-x434.google.com with SMTP id h79-v6so1667893pfk.8
 for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2018 15:18:40 -0700 (PDT)
MIME-Version: 1.0
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 19 Sep 2018 00:18:28 +0200
Message-ID: <CAAQYJAvt7MU-ip9k1Vj9371P0G=1Nnw4zZ4Rs0SdGVMDzEfZKg@mail.gmail.com>
Subject: [ubi-utils] - fixes for ubi-utils-klibc 2.0.2
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,

before next release please check again the patch 0002 in our git repo
[1],  about output of off_t as long long.

Then about patch 0005 you sent me last time an improved getline()
replacement for libmissing.h but I get build failures with glibc (musl
is ok) with that so I replaced with the simple fgets() again.
Can we maybe debug it? Have you that snippet still around?

Thanks
Andrea


[1] http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2
