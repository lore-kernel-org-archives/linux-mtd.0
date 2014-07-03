Received: from mail-la0-x231.google.com ([2a00:1450:4010:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2bw7-00066i-G7
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 08:00:08 +0000
Received: by mail-la0-f49.google.com with SMTP id gf5so7645117lab.8
 for <linux-mtd@lists.infradead.org>; Thu, 03 Jul 2014 00:59:44 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 3 Jul 2014 09:59:44 +0200
Message-ID: <CAAQYJAs6ky1CvZWoh9NjPLYbUVcjQCh7SW3NrFUzLcXvcHLZRw@mail.gmail.com>
Subject: [RFC] ubi-utils: improve compatibility with klibc
From: Andrea Adami <andrea.adami@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
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

I have put together a patchset allowing to compile the ubi utils
statically against klibc.

The patches are based on today's mtd-utils master, please have a preview here:

https://github.com/andrea-adami/meta-openembedded/tree/master/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc

Please let me know if there is something to change before sending them
to the mailing list.

Thanks

Andrea
