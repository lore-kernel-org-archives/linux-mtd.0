Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Itej-0004P1-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 17:10:33 +0100
Date: Fri, 14 Jun 2002 18:10:31 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Ivar Zarans <iff@alcaron.ee>
Cc: linux-mtd@lists.infradead.org
Subject: Re: file copy to /dev/mtd0 hangs after write
Message-ID: <20020614181031.B10789@wohnheim.fh-wedel.de>
References: <20020614075912.GA31096@alcaron.ee> <18404.1024041848@redhat.com> <20020614130154.GA32078@alcaron.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020614130154.GA32078@alcaron.ee>; from iff@alcaron.ee on Fri, Jun 14, 2002 at 04:01:54PM +0300
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

On Fri, 14 June 2002 16:01:54 +0300, Ivar Zarans wrote:
> > >  Any ideas why this happens? Any suggestions for debugging? 
> > 
> > SysRq-P, SysRq-T
> 
> Does not respond even to this. Otherwise "magic key" is OK.
> 
> Any other suggestions? 

- use mtdblock0 instead of mtd0.
- external debugging (some jtag controller, like riscwatch)
- printk()s, if you have the time

Jörn

-- 
The cheapest, fastest and most reliable components of a computer
system are those that aren't there.
-- Gordon Bell, DEC labratories
