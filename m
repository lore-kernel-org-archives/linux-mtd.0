Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FHkfN-0001Bl-Aa
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 11:40:50 -0500
Received: from xanadu.home ([66.131.142.204]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IVX0084I7NLGX80@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 11:40:33 -0500 (EST)
Date: Fri, 10 Mar 2006 11:40:33 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <625fc13d0603100821i22409112xc60e8a26f4167191@mail.gmail.com>
To: Josh Boyer <jwboyer@gmail.com>
Message-id: <Pine.LNX.4.64.0603101139270.3274@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20060310135431.62022.qmail@web86903.mail.ukl.yahoo.com>
	<Pine.LNX.4.64.0603101027230.3274@localhost.localdomain>
	<625fc13d0603100735o37c96bcfl78b213eab41b5e54@mail.gmail.com>
	<44119E8F.1000504@yandex.ru>
	<625fc13d0603100753r33fde8b8n3b9ff39f24b37b72@mail.gmail.com>
	<4411A3D9.6050505@yandex.ru>
	<625fc13d0603100821i22409112xc60e8a26f4167191@mail.gmail.com>
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org,
	Adam Ward <adamward2005@yahoo.co.uk>
Subject: Re: Read only forced on jffs2 by mtd layer?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 10 Mar 2006, Josh Boyer wrote:

> On 3/10/06, Artem B. Bityutskiy <dedekind@yandex.ru> wrote:
> > Josh Boyer wrote:
> > > Sorta.  If there isn't enough physical space to write nodes out, then
> > > you can't really have a writeable filesystem.  It'll actually just
> > > return -ENOSPC for everything instead of -EROFS, but the effect is the
> > > same.
> > I mean, if I ask to mount read-write, but end-up with RO, this is bad.
> > Shouldn't I explicitely request RO mount?
> 
> Oh, the mount will still show it as being RW from what I recall.  But
> you won't actually be able to write anything.  Which is also
> confusing.  Especially in the case where it won't even let you
> _delete_ things.

Sure, but what is important here is the exact error returned, be it 
-ENOSPC or -EROFS.


Nicolas
