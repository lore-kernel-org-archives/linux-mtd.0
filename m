Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTcy5-0002sy-AT
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2013 19:29:20 +0000
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
 [192.168.8.180])
 by mail-out.m-online.net (Postfix) with ESMTP id 3cvTBS4vrCz3hhjb
 for <linux-mtd@lists.infradead.org>; Tue,  8 Oct 2013 21:28:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
 by mail.m-online.net (Postfix) with ESMTP id 3cvTBR74VLzbbkg
 for <linux-mtd@lists.infradead.org>; Tue,  8 Oct 2013 21:28:47 +0200 (CEST)
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
 port 10024)
 with ESMTP id 5oCHgyHbG0f1 for <linux-mtd@lists.infradead.org>;
 Tue,  8 Oct 2013 21:28:47 +0200 (CEST)
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
 [80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA
 for <linux-mtd@lists.infradead.org>; Tue,  8 Oct 2013 21:28:46 +0200 (CEST)
Received: from gemini.denx.de (unknown [10.0.0.2])
 by diddl.denx.de (Postfix) with ESMTP id CB3A11A20A5
 for <linux-mtd@lists.infradead.org>; Tue,  8 Oct 2013 21:28:46 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
 by gemini.denx.de (Postfix) with ESMTP id A25E7380A65
 for <linux-mtd@lists.infradead.org>; Tue,  8 Oct 2013 21:28:46 +0200 (MEST)
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: Grow UBI device?
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
Date: Tue, 08 Oct 2013 21:28:46 +0200
Message-Id: <20131008192846.A25E7380A65@gemini.denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm looking for a clever way to migrate devices (in the field) from
JFFS2 to UBI/UBIFS.  In the end result, I want to have single UBI
device (which covers the whole NAND chip) with several volumes used
with UBIFS.  Unfortunately I must keep some of the existing data.

It would be nice if I could start with a UBI device that is smaller
than the NAND, so I can keep an existing MTD partition with a JFFS2
file system. After copying the data from JFFS2 to a UBIFS volume, I
would like to free and reuse the space of this JFFS2 partition.

Is there a way to "grow" the existing UBI device so that it now also
covers the rest of the NAND chip?  Or is my only option to create a
second UBI device?

Thanks in advance.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Unix is like a toll road on which you have to stop every 50  feet  to
pay another nickel. But hey! You only feel 5 cents poorer each time.
                 - Larry Wall in <1992Aug13.192357.15731@netlabs.com>
