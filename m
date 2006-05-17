Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FgFrN-0003c9-NY
	for linux-mtd@lists.infradead.org; Wed, 17 May 2006 02:50:29 -0400
Message-ID: <446AC77C.4010407@yandex.ru>
Date: Wed, 17 May 2006 10:49:32 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <1147178706.16853.6.camel@sauron.oktetlabs.ru>	
	<1147249742.16853.16.camel@sauron.oktetlabs.ru>	
	<20060510133510.GD31935@wohnheim.fh-wedel.de>	
	<1147269251.16853.50.camel@sauron.oktetlabs.ru>	
	<20060510135814.GG31935@wohnheim.fh-wedel.de>	
	<1147635584.2551.20.camel@shinybook.infradead.org>	
	<1147702746.20604.10.camel@sauron.oktetlabs.ru>
	<1147822221.30771.6.camel@shinybook.infradead.org>
In-Reply-To: <1147822221.30771.6.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@wohnheim.fh-wedel.de>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] reserved pool
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> I cleaned it up so it looks like this.... and then decided not to apply
> it. I don't like this kind of thing being a mount option. Make a new
> node type for 'filesystem options'. Make it an RWCOMPAT_COPY node type.
> Store the reserved size in it and do it through an ioctl like chattr
> does on ext2 -- and make mkfs.jffs2 write it too. 
> 
> We'll want compression types stored in that node type too, I suspect.
Well, looks fair.

Note: you have trickily decided to kill two birds with one stone, 
exploiting me to add a superblock node facility to JFFS2.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
