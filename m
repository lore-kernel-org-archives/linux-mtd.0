Date: Thu, 10 Apr 2008 17:57:08 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Nicolas Pitre <nico@cam.org>
Subject: RE: [PATCH] Fix of broken state in CFI driver caused by FL_SHUTDOWN
In-Reply-To: <alpine.LFD.1.00.0804091901270.2947@xanadu.home>
Message-ID: <Pine.LNX.4.64.0804101754370.26841@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0804040949090.2042@pentafluge.infradead.org>
	<20080404093359.GA4338@logfs.org>
	<Pine.LNX.4.64.0804041310550.10410@pentafluge.infradead.org>
	<009801c89a95$09ae4680$1d0ad380$%Tjernlund@transmode.se>
	<alpine.LFD.1.00.0804091901270.2947@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: haokexin@gmail.com, Joakim Tjernlund <Joakim.Tjernlund@transmode.se>,
	=?ISO-8859-15?Q?'J=F6rn_Engel'?= <joern@logfs.org>,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

> > >  CFI driver in 2.6.24 kernel is broken. Not so intensive read/write operations cause incomplete writes
> > > which lead to kernel panics in JFFS2.
> > >  We investigated the issue - it is caused by bug in FL_SHUTDOWN parsing code. Sometimes chip returns -
> > > EIO as if it is in FL_SHUTDOWN state when it should wait in FL_PONT (error in order of conditions).
> > > 
> > > The following patch fixes the bug in state parsing code of CFI.
> > > Also I've added comments to notify developers if they want to add new case in future.
> > > Please include it.
> > > 
> > > Signed-off-by: Alexey Korolev <akorolev@infradead.org>
> > > Reviewed-By: Joern Engel <joern@logfs.org>
> > 
> > Acked-By: Joakim Tjernlund <Joakim.Tjenrlund@transmode.se>
> > 
> > Guys, I think you should sent this directly to Linus as David seems
> > unavailable ATM. It should really go into 2.6.25
> 
> It is already in mainline.  See commit fb6d080c.
> 
Excelent, thank you very much!

> Nicolas
> 
