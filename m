Received: from ptb-relay03.plus.net ([212.159.14.214])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgRdc-0001qt-QN
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2004 12:48:05 -0500
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <41C6F923.20609@inf.u-szeged.hu>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>
	<41C19118.1020407@inf.u-szeged.hu>
	<1103558464.10788.44.camel@squizzey.bult.co.uk>
	<41C6F923.20609@inf.u-szeged.hu>
Content-Type: text/plain
Date: Mon, 20 Dec 2004 17:48:10 +0000
Message-Id: <1103564890.10796.69.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Patches applied and it seems to be working ..

After dd'ing a live FS off the key, sumtool'ing it and dd'ing it back
on, it seems to have cut mount time from 31 seconds to 11 seconds ...

This is certainly much better .. any way of making it quicker .. ;-)

Gareth.


On Mon, 2004-12-20 at 17:09 +0100, Ferenc Havasi wrote:
> Hi Gareth,
> 
> > I'm afraid this patch seems to be quite a long way from applying cleanly
> > to my source. I'm using 2.6.9 .. at least half a dozen failures or
> > more ...
> 
> It works with JFFS2 in the latest MTD CVS.
> 
> JFFS3 will contains this feature soon.
> 
> Regards,
> Ferenc
