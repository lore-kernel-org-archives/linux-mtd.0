Received: from inpbox.inp.nsk.su ([193.124.167.24])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bp6d4-0004tV-50
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2004 10:39:06 -0400
Date: Mon, 26 Jul 2004 21:35:54 +0700
From: "Dmitry A. Fedorov" <D.A.Fedorov@inp.nsk.su>
To: Andy Hawkins <a.hawkins@cabletime.com>
In-Reply-To: <1090851116.2219.5.camel@adh>
Message-ID: <Pine.SGI.4.10.10407262126150.569820-100000@Sky.inp.nsk.su>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem writing to NOR flash
Reply-To: D.A.Fedorov@inp.nsk.su
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 26 Jul 2004, Andy Hawkins wrote:

> > Porting of current MTD snapshot that oriented to 2.6 kernel is not
> > simple task. I did it for my hardware and have some patch set.
> > 
> > > What would people recommend we do in order to get working MTD support
> > > for the chips on our board for a 2.4 kernel?
> > 
> > Ask me for these patches, extend it for your hardware set and try to
> > push it back to MTD source.
> 
> Can I have a copy of these patches then?

Some time later (a few days).

> Have you had any problems writing to NOR?

No, after upgrade from the MTD snapshot.
There were problems with erase (ioctl call did not wait of
completion of erase operation) and jffs2 did not allowed to
write. Now it works properly.
