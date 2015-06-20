Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z6JPG-0005qO-Rf
 for linux-mtd@lists.infradead.org; Sat, 20 Jun 2015 14:06:03 +0000
Received: by qkfe185 with SMTP id e185so75924260qkf.3
 for <linux-mtd@lists.infradead.org>; Sat, 20 Jun 2015 07:05:37 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 21 Jun 2015 00:05:37 +1000
Message-ID: <CAC7eWMVmta_docSDskDJHE_jT29OgoD6z2XUT4CrRJEoc9oYbg@mail.gmail.com>
Subject: integck
From: Smitha Rathnam <rathnam.smitha@gmail.com>
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

Hi,

I built and ran integck on the target.
I did the following:
./integck -p -m 5 /mnt/nand
integck: error!: cannot find file-system info
integck: error!: condition '0' failed in get_tested_fs_info() at integck.c:2942
integck: error 0 (Success)
./integck[0x9b00]
./integck[0x10f8c]
/lib/libc.so.6(__libc_start_main+0x114)[0x2aaf84d4]

The ubi logfs is present on mtd5.

What am I doing wrong here?

Regards,
Smitha.
