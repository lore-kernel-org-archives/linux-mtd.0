Received: from smtp.flash.net.br ([201.46.240.48] helo=smtp.gru.flash.tv.br)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LxFNV-0000l7-I3
	for linux-mtd@lists.infradead.org; Fri, 24 Apr 2009 06:59:35 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp.gru.flash.tv.br (Postfix) with ESMTP id 7CE541E66D3
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Apr 2009 03:58:57 -0300 (BRT)
Received: from smtp.gru.flash.tv.br ([127.0.0.1])
	by localhost (smtp.gru.flash.tv.br [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 8N+P91rStsBU for <linux-mtd@lists.infradead.org>;
	Fri, 24 Apr 2009 03:58:44 -0300 (BRT)
Received: from chagas.nectar.ath.cx (unknown [187.22.248.170])
	by smtp.gru.flash.tv.br (Postfix) with ESMTPA id 9F36A1E66DB
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Apr 2009 03:58:30 -0300 (BRT)
Date: Fri, 24 Apr 2009 03:58:16 -0300
From: =?utf-8?Q?Rog=C3=A9rio?= Brito <rbrito@ime.usp.br>
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Regarding the linkstation defconfig
Message-ID: <20090424065816.GA15525@ime.usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Kumar Gala <galak@kernel.crashing.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Guennadi, Kumar & Co.

Guennadi, since you seem to be the one responsible for the
linkstation/kurobox in the kernel, I would like to ask you a few things
that I couldn't quite understand. Please, forgive my ignorance here
while I ask you some things:

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 01. why is anticipatory the default scheduler for linkstations when CFQ
     is the default scheduler for the rest of the kernel?

 02. since kuroboxes/linkstations are meant to store files, is there any
     reason why they don't have support for large blk devs enabled by
     default?

 03. why is CONFIG_MIGRATION enabled in such low memory devices?

 04. why is CONFIG_BLK_DEV_RAM enabled by default?

 05. why is SCSI_LOWLEVEL enabled, if no device under that tree is used?

 06. idem for CONFIG_NETDEV_10000.

 07. idem for CONFIG_WIRELESS.

 08. idem for CONFIG_HWMON.

 09. idem for CONFIG_CRYPTO_HW.

 10. any reason why CONFIG_VIDEO_OUTPUT_CONTROL is configured as a
     module?

 11. any reason why CIFS is not configured with extended attributes,
     while both ext3 and nfs are?

 12. wouldn't it be a good thing to enable CONFIG_PRINTK_TIME?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Perhaps similar remarks would apply to the other device that you
maintain? I forgot its name.

Again, please, forgive my ignorance here regarding the questions above.
I'm really looking for some clarification and to get things in shape
both on my systems and in the default kernel configuration, in general.


Thank you very much for your contributions, Rogério Brito.

-- 
Rogério Brito : rbrito@{mackenzie,ime.usp}.br : GPG key 1024D/7C2CAEB8
http://www.ime.usp.br/~rbrito : http://meusite.mackenzie.com.br/rbrito
Projects: algorithms.berlios.de : lame.sf.net : vrms.alioth.debian.org
