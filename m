Received: from mxs2.siemens.at ([194.138.12.133])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FLFne-0001DR-1h
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 03:31:50 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Mar 2006 09:30:49 +0100
Message-ID: <38F58D7B92CB20438DF49D28B572CC6F23BBED@budgw09a.ww300.siemens.net>
From: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
To: <igor.trevisan@bluewind.it>, <linux-mtd@lists.infradead.org>
Cc: 
Subject: RE: jffs2 fs overload
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

> I'm defining the flash partitions content for my target
> and I need a rewritable flash area.
> So I formatted and mounted a flash partition as jffs2.
> What I noted is that, on a 1MByte flash area I loose
> about 600K immediately. If I use the command df I see
> that only 30less than 400k are really available.
> Is it possible that this is the normal overload if a=20
> format my flash partition with jffs2?
> Or am I doing something wtong?

I think this is normal, JFFS2 allocates inodes (as far as I know) in
advance like ext2 also does - in case of a very small filesystem, this
may lead to serious capacity waste... If my assumption is wrong,
somebody please correct me.

> Is there any good guide or document that can help me
> building a jffs2 RW flash partition?

I would make a filesystem on a host PC, and then make a jffs2 from it
(mkjffs). The image can be written with a download tool.

Bye
--
Tamas Selmeci
