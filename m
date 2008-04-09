Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JjjIF-0001wH-OH
	for linux-mtd@lists.infradead.org; Wed, 09 Apr 2008 23:01:28 +0000
Date: Wed, 9 Apr 2008 16:01:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Joakim Tjernlund" <Joakim.Tjernlund@transmode.se>
Subject: Re: [PATCH] Fix of broken state in CFI driver caused by FL_SHUTDOWN
Message-Id: <20080409160105.cd5b9d50.akpm@linux-foundation.org>
In-Reply-To: <009801c89a95$09ae4680$1d0ad380$@Tjernlund@transmode.se>
References: <Pine.LNX.4.64.0804040949090.2042@pentafluge.infradead.org>
	<20080404093359.GA4338@logfs.org>
	<Pine.LNX.4.64.0804041310550.10410@pentafluge.infradead.org>
	<009801c89a95$09ae4680$1d0ad380$@Tjernlund@transmode.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: haokexin@gmail.com, akorolev@infradead.org, nico@cam.org, joern@logfs.org,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 10 Apr 2008 00:57:07 +0200
"Joakim Tjernlund" <Joakim.Tjernlund@transmode.se> wrote:

> > -----Original Message-----
> > From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> > Of Alexey Korolev
> > Sent: den 4 april 2008 14:22
> > To: J__rn Engel
> > Cc: nico@cam.org; haokexin@gmail.com; dwmw2@infradead.org; akpm@linux-foundation.org; linux-
> > mtd@lists.infradead.org
> > Subject: Re: [PATCH] Fix of broken state in CFI driver caused by FL_SHUTDOWN
> > 
> > Hi
> > 
> > 
> >  CFI driver in 2.6.24 kernel is broken. Not so intensive read/write operations cause incomplete writes
> > which lead to kernel panics in JFFS2.
> >  We investigated the issue - it is caused by bug in FL_SHUTDOWN parsing code. Sometimes chip returns -
> > EIO as if it is in FL_SHUTDOWN state when it should wait in FL_PONT (error in order of conditions).
> > 
> > The following patch fixes the bug in state parsing code of CFI.
> > Also I've added comments to notify developers if they want to add new case in future.
> > Please include it.
> > 
> > Signed-off-by: Alexey Korolev <akorolev@infradead.org>
> > Reviewed-By: Joern Engel <joern@logfs.org>
> 
> Acked-By: Joakim Tjernlund <Joakim.Tjenrlund@transmode.se>
> 
> Guys, I think you should sent this directly to Linus as David seems
> unavailable ATM. It should really go into 2.6.25
> 

I don't have a copy of the patch.
