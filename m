Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6QcE-0007tx-GR
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2005 04:58:02 -0500
Date: Wed, 2 Mar 2005 09:57:49 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Peter Grayson <pgrayson@realmsys.com>
In-Reply-To: <1109710021.5043.55.camel@pgrayson1.realmsys.com>
Message-ID: <Pine.LNX.4.58.0503020956420.26599@phoenix.infradead.org>
References: <1109643247.5043.26.camel@pgrayson1.realmsys.com>
	<1109645229.3805.11.camel@tglx.tec.linutronix.de>
	<1109700711.5043.53.camel@pgrayson1.realmsys.com>
	<1109704571.8540.26.camel@tglx.tec.linutronix.de>
	<1109710021.5043.55.camel@pgrayson1.realmsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: Can you really write a jffs2 image with nandwrite?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Grayson wrote:
 > This was definitely useful. I am now able to write images with
> nandwrite. Here are the magic steps I am taking:
> 
> 
> 1) mkfs.jffs2 \
> 	--eraseblock=128KiB \
> 	--pad \
> 	--output=image.jffs2 \
> 	--compression-mode=priority \
> 	--no-cleanmarkers \
> 	--big-endian \
> 	--squash \
> 	--verbose \
> 	--root=$ROOT_DIR

Peter, if you don't want to have problems in future, please use --pad=2048 
option instead of --pad. The latter is only acceptable in case of NOR 
flash. This is fairly confusing and we definitely have to either notice 
this in the mks.jffs2 help output or just hack mkfs.jffs2 code and assume 
--pad=Page Size by default for NANDs. You're welcome to do either of this 
and to send your patch :-).

Please, refer to 
http://lists.infradead.org/pipermail/linux-mtd/2004-December/011051.html 
for more details. HTH.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
