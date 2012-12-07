Received: from mail-ia0-f175.google.com ([209.85.210.175])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TgzoW-0000IF-QE
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2012 15:26:10 +0000
Received: by mail-ia0-f175.google.com with SMTP id z3so711069iad.34
 for <linux-mtd@lists.infradead.org>; Fri, 07 Dec 2012 07:26:06 -0800 (PST)
MIME-Version: 1.0
Sender: jphilippe.francois@gmail.com
Date: Fri, 7 Dec 2012 16:26:06 +0100
Message-ID: <CAGGh5h23djGTUynnoVUaGAQCuWVCDAW=PLQsvnyBVKGDfwERAQ@mail.gmail.com>
Subject: U-boot bch4_sw vs omap bch4_hw
From: jean-philippe francois <jp.francois@cynove.com>
To: ivan.djelic@parrot.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ivan,

I have applied your patches for hardware bch ecc support on
OMAP. On the linux side, everything is fine. However I have some trouble
when it comes to u-boot and kernel interoperability.

A nand page written with bch4_sw ecc by U-boot fails the ecc step when
read by the kernel. Looking at a nanddump, OOB placement and size of
the ecc data are the same.

Do you know of any patch for u-boot that would make the  bch4_sw ecc
identical to the kernel one ?

Thank you,
Jean-Philippe Fran=C3=A7ois
