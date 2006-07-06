Received: from fw3.q-free.com ([62.92.116.8])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FyK22-00078J-NI
	for linux-mtd@lists.infradead.org; Wed, 05 Jul 2006 22:56:06 -0400
Received: from gale.q-free.com ([192.168.14.3])
	by fw3.q-free.com (NAVGW 2.5.1.2) with SMTP id M2006070604384908271
	for <linux-mtd@lists.infradead.org>; Thu, 06 Jul 2006 04:38:50 +0200
Received: from localhost.localdomain (h192-168-14-30.q-free.com
	[192.168.14.30] (may be forged))
	by gale.q-free.com (8.11.6/8.11.6) with ESMTP id k662ePw10708
	for <linux-mtd@lists.infradead.org>; Thu, 6 Jul 2006 12:40:26 +1000
Received: from [10.50.172.101] (unknown [10.50.172.101])
	by localhost.localdomain (Postfix) with ESMTP id F2D89FE008C
	for <linux-mtd@lists.infradead.org>;
	Thu,  6 Jul 2006 12:40:23 +1000 (EST)
Message-ID: <44AC7817.6090209@Q-Free.com>
Date: Thu, 06 Jul 2006 12:40:23 +1000
From: Thiago Figueiro <Thiago.Figueiro@Q-Free.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: DiskOnChip 2000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

    Hi, all.  I have been lurking for some time but couldn't get this 
straight.

    I see that the current DOC implementation purposedly ignores DOC2000 
chips because the INFTL implementation doesn't handle the BBT.  I think 
this goes back to 2003 so my guess is that this is not so easy to 
implement or there's no community interest in doing it.

    I am not locked to the DOC because my hardware supports other memories:

NVSRAM (Dallas, SGS, Simtek)
EEROM (SST, Atmel)
FLASH (AMD, Atmel, SST, SGS - 29F256/512/010/020/040' style)
EPROM (AMD, SGS - 27C256/512/010/020/040' style)

    Which of the above would you guys recommend?  I would like to boot 
from it and mount the root FS on it (it would have basically read-only 
data).

Many thanks,

-- 

Thiago Figueiro - Q-Free Australia Pty Ltd.
--
Thiago.Figueiro@Q-Free.com
--
Unit 17 / 1 Talavera Rd.
North Ryde 2113 NSW
Australia
--
Ph:  +61 2 9887 8216
Fax: +61 2 9888 6800
Mob: +61 405 700 814
--
