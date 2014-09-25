Received: from mail-la0-x244.google.com ([2a00:1450:4010:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXDCy-0007iS-1q
 for linux-mtd@lists.infradead.org; Thu, 25 Sep 2014 17:52:00 +0000
Received: by mail-la0-f68.google.com with SMTP id q1so395904lam.3
 for <linux-mtd@lists.infradead.org>; Thu, 25 Sep 2014 10:51:37 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 25 Sep 2014 19:51:37 +0200
Message-ID: <CALBbqb==UfUzBJU315U71e15TiHh0JXZC8q7h3gLtjuKca2WMg@mail.gmail.com>
Subject: NOR Flash regions mapped to non contiguous physical memory
From: Rams Subramanian <rams.rsu@gmail.com>
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

We have a special case where the chip selects for external memory
interface has the addressing range of 32MB per chip select.  We have
interfaced 128MB NOR flash and our addressable regions are
non-contiguous.

 E.g Flash Map

       * CS0 : 0x30000000 - 0x32000000 : (32MB)

       * CS1 : 0x34000000 - 0x36000000 : (32MB)

       * CS2 : 0x38000000 - 0x3A000000 : (32MB)

       * CS3 : 0x3C000000 - 0x3E000000 : (32MB)



We tried to define mtd map to force it to detect 4 physical chips so
that mtdconcat can handle the rest.  But mtdconcat does not work well
for this case as we dont have 4 physical chips.  The mtd driver does
parallel accesses assuming 4 physical chips.  So we could not have
flash file system spanning over 4 regions.  It is fine to work with
single region at a time.

What we actually want is to define a flash which has 4 non contiguous
regions.  Can this be done with existing mtd drivers?

Is that possible to get contiguous virtual memory from non contiguous
physical memory?



Thanks in advance
Rams
