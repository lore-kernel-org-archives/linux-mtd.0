Received: from bay17-f16.bay17.hotmail.com ([64.4.43.66] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EOUMk-0006Vk-7W
	for linux-mtd@lists.infradead.org; Sun, 09 Oct 2005 02:09:09 -0400
Message-ID: <BAY17-F16E854B08AE4BE53C22062E8860@phx.gbl>
In-Reply-To: <20051003142851.GE4639@wohnheim.fh-wedel.de>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de, dedekind@yandex.ru
Date: Sun, 09 Oct 2005 14:08:55 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 4)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>
> > >> What was (c->cleanmarker_size == 0) used for?
> > >
> > > For the flash that don't need a clean marker.
> > No, that worked for NAND this way (c->cleanmarker_size was 0)
>
>So why is this part unnecessary now?  Or should it just be replaced by
>something else?

It's true that "c->cleanmarker_size was 0" for NAND flash.
But besides  NAND flash, "c->cleanmarker_size was 0" is also true
for dataflash. That means that cleanmarker was not needed for
dataflash for some reason that I don't know :)
Now eraseblock header is needed for any kind of flash. So I removed
the original (c->cleanmarker_size == 0).

Thanks,
Forrest
