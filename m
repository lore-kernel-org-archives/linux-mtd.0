Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DWGKZ-0005uc-RA
	for linux-mtd@lists.infradead.org; Thu, 12 May 2005 12:14:39 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Ralph Walden <ralphw@everest-co.com>
In-Reply-To: <81772B4336DEC14EBB8C519C4EC21051F80D96@pe2650.everest-co.com>
References: <81772B4336DEC14EBB8C519C4EC21051F80D96@pe2650.everest-co.com>
Content-Type: text/plain
Date: Thu, 12 May 2005 20:14:03 +0400
Message-Id: <1115914443.27158.56.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

> In an attempt to solve a problem I have been having with the stock
> 2.6.11 JFFS2 filesystem I described in an earlier post, I upgraded my
> kernel with a MTD snapshot dated 2005-04-05.
> 
> I implemented a test whereby my system will boot up then:
>        1. mount the JFFS2 filesystem,
>        2. write a 512k file to the JFFS2 filesystem.
>        3. umount the JFFS2 filesystem
>        4. reboot
> 
> 
Didn't you try to reproduce this on mtdram device? drivers/mtd/mtdram
emulates NOR flash and you may play with it even on host.


> Etc... I realize that many of these are lost by being split up by other
> intervening kernel messages and are only partial messages.  I can
> provide the whole 800k log if necessary.
Try to output to serial line and grab it. The log would be helpful.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
