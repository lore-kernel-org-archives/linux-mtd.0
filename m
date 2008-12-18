Received: from aibo.runbox.com ([87.238.52.70])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LDJ1z-0006MD-B1
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 13:35:11 +0000
Received: from [10.9.9.162] (helo=pepper.runbox.com)
	by greyhound.runbox.com with esmtp (Exim 4.50) id 1LDJ1p-0004bG-Qb
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 14:35:02 +0100
Received: from [74.94.155.177] (helo=[192.168.12.139])
	by pepper.runbox.com with esmtpsa (uid:263104 )
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1LDJ1m-0006oq-37
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 14:34:58 +0100
Message-ID: <494A517E.2000405@runbox.com>
Date: Thu, 18 Dec 2008 08:34:54 -0500
From: Cal Page <pagcal@runbox.com>
MIME-Version: 1.0
To: ubifs <linux-mtd@lists.infradead.org>
Subject: ubifs: another scheduling while atomic back trace
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

I tracked it down to fs/ubifs/journal.c in make_reservation()?

the code is:
    again:
       down_read()
       err = reserve_space()
       if ( !err) return 0
       up_read()

shouldn't we to the up as part of the if? ie

    if ( !err ) { up_read(); return 0; };

Also, I notice fs/fs-writeback.c in writeback_inodes does a 
down_read_trylock. Won't this interfear with the down_read above?

Cal Page
