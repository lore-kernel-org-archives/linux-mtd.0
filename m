Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQhBk-0003MO-JG
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 04:47:11 -0400
Date: Tue, 4 Apr 2006 10:46:59 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-ID: <20060404084659.GA11384@wohnheim.fh-wedel.de>
References: <20060329232520.1677d2b3.akpm@osdl.org>
	<442C0494.2040609@zytor.com>
	<20060330114014.53150d1b.akpm@osdl.org>
	<442C6B78.3060706@zytor.com> <m3hd5anj51.fsf@maxwell.lnxi.com>
	<4431E304.6020908@zytor.com>
	<20060404083019.GA9747@wohnheim.fh-wedel.de>
	<4432318E.5050002@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4432318E.5050002@yandex.ru>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: blkmtd and name_to_dev_t
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 4 April 2006 12:42:54 +0400, Artem B. Bityutskiy wrote:
> 
> This is a bit out of context and I'm not arguing. Just wanted to note. 
> Mount and linux long support device-less mount. The beset way to mount 
> JFFS2 would be to do like this:
> 
> mount mtd0 /mnt/jffs2 -t jffs2
> 
> No need to have any fake block device, no need to have any device node 
> at all. JFFS2 seems to (not sure) not support this but it is trivial to add.
> 
> I tend to think that this mtdblock fake stuff is some ancient crap and 
> has to go and not confuse people.

Artem, this is the other way around.  You are talking about having a
fake block device to mount jffs2 on mtd.  mtd->bd

I was talking about having a fake mtd on top of a block device to
mount jffs2 on it.  bd->mtd

Yes, the whole translate this into that business around mtd is rather
confusing.  It is unfortunate that a struct block_device is not
sufficient for flash purposes (yet?).

Jörn

-- 
Sometimes, asking the right question is already the answer.
-- Unknown
