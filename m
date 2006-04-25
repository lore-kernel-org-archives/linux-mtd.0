Received: from mail.dsa-ac.de ([62.112.80.99])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYHJF-0004xh-Ox
	for linux-mtd@lists.infradead.org; Tue, 25 Apr 2006 02:46:07 -0400
Received: from komserver.dsa-ac.de (KOMSERVER2.dsa-ac.de [172.28.1.4])
	by mail.dsa-ac.de (Maildaemon on Linux) with ESMTP id 2E17F9229
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Apr 2006 08:46:01 +0200 (CEST)
Received: from pcgl.dsa-ac.de (PCGL.dsa-ac.de [172.29.17.23])
	by komserver.dsa-ac.de (Postfix on Linux-Server) with ESMTP id
	7A7DE1988A for <linux-mtd@lists.infradead.org>;
	Tue, 25 Apr 2006 08:45:59 +0200 (CEST)
Date: Tue, 25 Apr 2006 08:45:59 +0200 (CEST)
From: Guennadi Liakhovetski <gl@dsa-ac.de>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.63.0604250841510.1846@pcgl.dsa-ac.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Subject: pxa2xx-flash.c return?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all

I saw on the mtd-cvs list, that earlier there was a generic pxa2xx mtd 
mapping driver, that later was removed and 2 separate drivers for 
mainstone and lubbock were added, later yet there was another patch 
submitted to re-introduce pxa2xx-flash.c and remove lubbock and mainstone 
again... This latter patch was submitted around January this year, I 
think, and it is still not in the queue for 2.6.17, AFAICS. What's the 
current status of this? Is it going in? If yes - when?

Thanks
Guennadi
---------------------------------
Guennadi Liakhovetski, Ph.D.
DSA Daten- und Systemtechnik GmbH
Pascalstr. 28
D-52076 Aachen
Germany
