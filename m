Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYLUq-0005XT-0Z
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 17:41:32 +0000
Received: by iaby26 with SMTP id y26so1401832iab.36
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2011 09:41:31 -0800 (PST)
MIME-Version: 1.0
From: Rishi Dhupar <rishid@gmail.com>
Date: Wed, 7 Dec 2011 12:41:10 -0500
Message-ID: <CAJbs9BFad5bgq5_eFCNF7E_qHZt4D0RXt3tjD0Qv+qg2mT0ucw@mail.gmail.com>
Subject: Using mmap() on a NOR flash device
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have trying to figure out if this is possible, I have a NOR flash
chip (Intel CFI) that is I/O peripheral mapped to my processor to
exist in the 0xA000_0000 to 0xA1FF_FFFF range. =A0I was hoping to be
able to perform quick reads from the chip by reading directly from NOR
through using this address space. =A0I was trying to use mmap() in a
user-space app to do this but does not seem to be working.

Is there support available to do this? =A0Or is the only option to read
NOR flash from user-space, is through a combination of lseek() and
read() system calls?
