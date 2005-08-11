Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E37fl-0000X4-SJ
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 03:40:24 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Alex Karev <lineum@mail.ru>
In-Reply-To: <42FAFEC9.1090306@mail.ru>
References: <42FAFEC9.1090306@mail.ru>
Content-Type: text/plain
Date: Thu, 11 Aug 2005 11:39:40 +0400
Message-Id: <1123745980.16052.48.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 and nand mtd
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-08-11 at 11:31 +0400, Alex Karev wrote:
> Hello
> 
> While we mount empty jffs2 and then copying  files it's ok, after 
> remount/reboot. the files have zero gaps ~2kb at some (stable?) 
> locations, and filesytem is broken that way.
> install procedure following:
> 
> #flash_eraseall -j /dev/mtd0
> #mount -t jffs2 /dev/mtdblock0 /mnt
> #cp ...
>     at this stage files looks ok.
> #umount
> #mount
>     zero gaps appear in data on flash and lot of debug info with some 
> Eeps, sometimes kernel panic.
Hmm, could you please report which MTD snapshot do you use (date) ?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
