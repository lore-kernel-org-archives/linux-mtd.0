Received: from smtp-out4.atlngahp.sys.nuvox.net ([70.43.63.22]
	helo=smtp04.atlngahp.sys.nuvox.net)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JwHj2-0003jo-V0
	for linux-mtd@lists.infradead.org; Wed, 14 May 2008 14:13:01 +0000
Received: from webmail.nuvox.net (webmail.nuvox.net [64.89.70.59])
	by smtp04.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m4EECpt6016823
	for <linux-mtd@lists.infradead.org>; Wed, 14 May 2008 10:12:51 -0400
Message-ID: <57616.137.237.242.138.1210774371.squirrel@webmail.nuvox.net>
Date: Wed, 14 May 2008 10:12:51 -0400 (EDT)
Subject: Porting to Intel P33 flash 
From: jkimble@one.net
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Does anyone know at what kernel release this particular flash (Intel
256P33B StrataFlash) was supported (if any)?

I can't go to the latest kernel and back porting the MTD section form
2.6.24 to 2.6.10 turned out to be impractical. There's just too many basic
structures (like devices Vs platform_devices) that I'm not prepared to
change in 2.6.10.

I just need to know when/if P33 was supported. It would be good to have a
version I know works to work from.

Thanks,

James Kimble
