Received: from moutng.kundenserver.de ([212.227.17.8])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoYX7-0000El-HK
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 12:59:58 +0000
Received: from localhost (localhost [127.0.0.1])
 by mailsrv2.adwin.jcm (Postfix) with ESMTP id C274A21C9
 for <linux-mtd@lists.infradead.org>; Thu,  5 Dec 2013 13:53:47 +0100 (CET)
Received: from mailsrv2.adwin.jcm ([127.0.0.1])
 by localhost (mailsrv2.adwin.jcm [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FHF49U1o-vGJ for <linux-mtd@lists.infradead.org>;
 Thu,  5 Dec 2013 13:53:47 +0100 (CET)
Received: from [IPv6:2001:470:7355:1:10:10:101:fe91] (pc-tb-debian.adwin.jcm
 [IPv6:2001:470:7355:1:10:10:101:fe91])
 by mailsrv2.adwin.jcm (Postfix) with ESMTP id 5D52A2107
 for <linux-mtd@lists.infradead.org>; Thu,  5 Dec 2013 13:53:47 +0100 (CET)
Message-ID: <52A0775B.3080005@ADwin.de>
Date: Thu, 05 Dec 2013 13:53:47 +0100
From: Thomas Herrmann <THerrmann@ADwin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBI+UBIFS on Read-Only NAND
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We had an old JFFS based system that had a dip switch connected to the
write-enable pin of the flash device, and it worked as expected. Users
were able to configure and use the system in r/w mode and then "lock"
the configuration.

I tried the same with our newer hardware, and UBI/UBIFS. I did not use
static volumes, since write support is essential for initial setup.
However, the system will not boot if the flash is write-protected in
hardware, because UBI assumes that it is R/W.

What is the suggested solution for such a setup? I could not find
anything in the FAQ or in the archive, but I may have been searching for
the wrong keywords...

Regards
Thomas Herrmann
