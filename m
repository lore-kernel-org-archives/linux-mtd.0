Received: from host-82-135-62-35.customer.m-online.net ([82.135.62.35]
 helo=mail.embedded-brains.de)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sz2NG-00033Q-IO
 for linux-mtd@lists.infradead.org; Wed, 08 Aug 2012 09:16:20 +0000
Received: from [192.168.96.64] (eb0024.eb.z [192.168.96.64])
 by mail.embedded-brains.de (Postfix) with ESMTP id D7878652A97
 for <linux-mtd@lists.infradead.org>; Wed,  8 Aug 2012 11:16:05 +0200 (CEST)
Message-ID: <50222E55.5070204@embedded-brains.de>
Date: Wed, 08 Aug 2012 11:16:05 +0200
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: ARM: LPC32XX SLC ECC Handling
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

the LPC32XX SLC controller has a ECC feature that covers only the main data 
area, but not the OOB data.  Is it the responsibility of the user to protect 
its OOB data via an ECC?  The LPC32XX MLC controller on the other hand covers 
the complete OOB data with its ECC.  How can a user determine if it has to 
protect its OOB data?

-- 
Sebastian Huber, embedded brains GmbH

Address : Obere Lagerstr. 30, D-82178 Puchheim, Germany
Phone   : +49 89 18 90 80 79-6
Fax     : +49 89 18 90 80 79-9
E-Mail  : sebastian.huber@embedded-brains.de
PGP     : Public key available on request.

Diese Nachricht ist keine geschäftliche Mitteilung im Sinne des EHUG.
