Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DWGRO-00065w-O4
	for linux-mtd@lists.infradead.org; Thu, 12 May 2005 12:21:39 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Ralph Walden <ralphw@everest-co.com>
In-Reply-To: <81772B4336DEC14EBB8C519C4EC21051F80D96@pe2650.everest-co.com>
References: <81772B4336DEC14EBB8C519C4EC21051F80D96@pe2650.everest-co.com>
Content-Type: text/plain; charset=KOI8-R
Date: Thu, 12 May 2005 20:21:05 +0400
Message-Id: <1115914865.27158.59.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: kernel BUG at fs/jffs2/gc.c:190!
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

В Чтв, 12/05/2005 в 11:04 -0500, Ralph Walden пишет:
> In an attempt to solve a problem I have been having with the stock
> 2.6.11 JFFS2 filesystem I described in an earlier post, I upgraded my
> kernel with a MTD snapshot dated 2005-04-05.
> 
> I implemented a test whereby my system will boot up then:
>        1. mount the JFFS2 filesystem,
>        2. write a 512k file to the JFFS2 filesystem.
>        3. umount the JFFS2 filesystem
>        4. reboot
And it would be nice if you insert printk at gc.c:190 and print ic-
>state there.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
