Received: from bay17-f13.bay17.hotmail.com ([64.4.43.63] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHuAO-0002Ra-0H
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 22:17:15 -0400
Message-ID: <BAY17-F135E742AF3080EE7F27B59E8940@phx.gbl>
In-Reply-To: <1127213984.20014.34.camel@sauron.oktetlabs.ru>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@infradead.org, joern@wohnheim.fh-wedel.de
Date: Wed, 21 Sep 2005 10:16:58 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Add JFFS2 eraseblock header support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > > 6 new JFFS2 binary, when mounting an old JFFS2 image, will reject
> > > mounting unless the old JFFS2 image doesn't use 1:N(N>1)mapping.
> >
> > I wouldn't waste code on this.
>I would just reject mounting old images as well.
>
For trying to keep compatibility, I think there's no reason for new 
JFFS2 binary to reject mounting old JFFS2 image(with clean marker) if
this image use 1:1 mapping. So I'd insist on this. Does it make sense
to you?
In fact I didn't waste many code on this, it's only a little code
for it :)

Thanks,
Forrest
