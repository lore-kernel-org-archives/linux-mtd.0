Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BbGdw-0007dZ-Bz
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2004 06:30:45 -0400
Message-ID: <40D2C445.6010402@yandex.ru>
Date: Fri, 18 Jun 2004 14:30:29 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <002301c45340$7e44ffc0$e100a8c0@ycigrnd.ycig.com>
In-Reply-To: <002301c45340$7e44ffc0$e100a8c0@ycigrnd.ycig.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: leeyang <leeyang@ycig.com>
Subject: Re: [OBORONA-SPAM]  Is it possible to reduce GC blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

leeyang wrote:
> I am kind of short of flash space in my board.
> 2M total 64k per block
> loader 1 block
> kernel 11 blocks,mtd 
> initrd 14 blocks,mtd ramdisk
> configuration section have 6 blocks only with jffs2
> but GC will take 5 of 6,only 1 blocks for data!
> 
> Is it possible to release 1 or 2 block from gc?
> 

Critical parameters may be tuned by hacking jffs2_calc_trigger_levels()
(build.c). You may try this.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
