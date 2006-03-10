Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FHk8C-0008Mf-3n
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 11:06:29 -0500
Message-ID: <4411A3D9.6050505@yandex.ru>
Date: Fri, 10 Mar 2006 19:05:45 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
References: <20060310135431.62022.qmail@web86903.mail.ukl.yahoo.com>	<Pine.LNX.4.64.0603101027230.3274@localhost.localdomain>	<625fc13d0603100735o37c96bcfl78b213eab41b5e54@mail.gmail.com>	<44119E8F.1000504@yandex.ru>
	<625fc13d0603100753r33fde8b8n3b9ff39f24b37b72@mail.gmail.com>
In-Reply-To: <625fc13d0603100753r33fde8b8n3b9ff39f24b37b72@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Adam Ward <adamward2005@yahoo.co.uk>
Subject: Re: Read only forced on jffs2 by mtd layer?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> Sorta.  If there isn't enough physical space to write nodes out, then
> you can't really have a writeable filesystem.  It'll actually just
> return -ENOSPC for everything instead of -EROFS, but the effect is the
> same.
I mean, if I ask to mount read-write, but end-up with RO, this is bad. 
Shouldn't I explicitely request RO mount?


> Take a look at jffs2_calc_trigger_levels in build.c. 
> c->resv_blocks_deletion is the number of blocks needed to delete
> something.  c->resv_blocks_write is the number of blocks needed to
> write something.
Ok, but where is the code that switches it to RO mode in case of lack of 
eraseblocks?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
