Received: from inpbox.inp.nsk.su ([193.124.167.24])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bp68Z-000485-PM
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2004 10:07:38 -0400
Date: Mon, 26 Jul 2004 21:00:10 +0700
From: "Dmitry A. Fedorov" <D.A.Fedorov@inp.nsk.su>
To: Andy Hawkins <a.hawkins@cabletime.com>
In-Reply-To: <1090848742.2219.3.camel@adh>
Message-ID: <Pine.SGI.4.10.10407262048000.569820-100000@Sky.inp.nsk.su>
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

> We're using a 2.4.20 derived kernel, and a while back updated to a
> recent MTD snapshot

The same for 2.4.26.

> To see if this problem has now been fixed, I have just downloaded the
> latest snapshot to try. However, I can no longer get this to compile.
> After changing some Makefiles, I have now found that the new code uses
> 'kvec' in place of 'iovec'. Is this a 2.6 feature?
> 
> If so, are there any plans to make the current MTD code work with 2.4?

Porting of current MTD snapshot that oriented to 2.6 kernel is not
simple task. I did it for my hardware and have some patch set.

> What would people recommend we do in order to get working MTD support
> for the chips on our board for a 2.4 kernel?

Ask me for these patches, extend it for your hardware set and try to
push it back to MTD source.
