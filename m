Received: from fed1mtao02.cox.net ([68.6.19.243])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181bGc-0008Dz-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2002 00:38:27 +0100
Subject: Re: Hoping for a little insight
From: Russ Dill <Russ.Dill@asu.edu>
To: justin.wojdacki@analog.com
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
In-Reply-To: <3DACA2ED.4FACBDFD@analog.com>
References: <3DAC9026.B3F4550B@analog.com>
	<11684.1034720007@passion.cambridge.redhat.com>
	<3DACA2ED.4FACBDFD@analog.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 15 Oct 2002 16:41:15 -0700
Message-Id: <1034725275.21133.8.camel@timmy>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 2002-10-15 at 16:21, Justin Wojdacki wrote:
> David Woodhouse wrote:
> > 
> > justin.wojdacki@analog.com said:
> > >  I am trying to copy a largish file (well, relative to the flash size)
> > > and after a variable point in the copy, "cp" goes to sleep and never
> > > wakes up again.
> > 
> > SysRq-T.
> > 
> > --
> > dwmw2
> 
> Sorry, no luck getting SysRq-T to work. I think the host OS
> (WindowsXP) or terminal program (TeraTerm) might be swallowing it. 

send a serial break, followed by a t
