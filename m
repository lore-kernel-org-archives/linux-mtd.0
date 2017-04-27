Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3gc8-0006dc-Qw
 for linux-mtd@lists.infradead.org; Thu, 27 Apr 2017 10:25:35 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 3wDCkV375nz1qqkN
 for <linux-mtd@lists.infradead.org>; Thu, 27 Apr 2017 12:25:06 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 3wDCkV1Vkrz3hhS7
 for <linux-mtd@lists.infradead.org>; Thu, 27 Apr 2017 12:25:06 +0200 (CEST)
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id jyTl6Mr5_6p5 for <linux-mtd@lists.infradead.org>;
 Thu, 27 Apr 2017 12:25:03 +0200 (CEST)
Received: from jawa (89-77-92-62.dynamic.chello.pl [89.77.92.62])
 (using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA
 for <linux-mtd@lists.infradead.org>; Thu, 27 Apr 2017 12:25:03 +0200 (CEST)
Date: Thu, 27 Apr 2017 12:25:02 +0200
From: Lukasz Majewski <lukma@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Problem with NAND memory data retention
Message-ID: <20170427122502.285d16ba@jawa>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,

I'd like to ask you for sharing your experience with NAND Flash devices
- which may be older that their data retention time.

I've a problem with Flash NAND memory (Samsung 128Mx8).

In the data sheet [1] the manufacturer claims that it has 10 years for
data retention. The device equipped with it is a bit older than 10
years.


How one can diagnose that data retention time for NAND Flash has been
exceeded?

Is that:

- The number of bit flip errors on a RW page so large that ECC cannot
  fix it?

- Or are whole RW pages erased (0xFF)/corrupted/cleared (0x00)?

- Or any other evidence?


Thanks in advance for your help.


[1] -
http://www.sst-ic.com/File/Seriea/PDF/100923163334f47b2ce6-13b7-43d0-9b8c-ec1c75ca2c6f.pdf


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
