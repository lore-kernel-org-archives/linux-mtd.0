Received: from host61-50.pool80105.interbusiness.it ([80.105.50.61]
	helo=linuxbw2.bwlocal.it)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FNvdE-0001r2-TU
	for linux-mtd@lists.infradead.org; Mon, 27 Mar 2006 12:36:23 -0500
From: igor.trevisan@bluewind.it
To: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
Date: Mon, 27 Mar 2006 19:38:25 +0200
MIME-Version: 1.0
Message-ID: <44283F31.31644.285825A@localhost>
In-reply-to: <38F58D7B92CB20438DF49D28B572CC6F23BBED@budgw09a.ww300.siemens.net>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Cc: linux-mtd@lists.infradead.org
Subject: RE: jffs2 fs overload
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Tamas,

thanks for your answer.
Just another one: is it possible to have a single RFS that 's mounted
read/write?
Is it enough to specify r/w on the mtdparts section of the command 
line? (I'm using that way to define flash partitions).
In this way I could have three partitions: bootloader, kernel and RFS
with the rfs mounted rewritable but with the files that cannot be 
changed that don't have write permission.
In this way I could avoid the overload due to having two small partitions
each one with its JFFS2 tables and structures and so on.
Is it right?
Any suggestion and comment is obviously welcome!
Thanks in advance,
Igor.
  

On 20 Mar 2006 at 9:30, Selmeci, Tamas wrote:

> Hello!
> 
> > I'm defining the flash partitions content for my target
> > and I need a rewritable flash area.
> > So I formatted and mounted a flash partition as jffs2.
> > What I noted is that, on a 1MByte flash area I loose
> > about 600K immediately. If I use the command df I see
> > that only 30less than 400k are really available.
> > Is it possible that this is the normal overload if a 
> > format my flash partition with jffs2?
> > Or am I doing something wtong?
> 
> I think this is normal, JFFS2 allocates inodes (as far as I know) in
> advance like ext2 also does - in case of a very small filesystem, this
> may lead to serious capacity waste... If my assumption is wrong,
> somebody please correct me.
> 
> > Is there any good guide or document that can help me
> > building a jffs2 RW flash partition?
> 
> I would make a filesystem on a host PC, and then make a jffs2 from it
> (mkjffs). The image can be written with a download tool.
> 
> Bye
> --
> Tamas Selmeci
> 
> 

-- 
--- BlueWind 
--- Embedded Systems Design 
--- Borgo Pieve 55c interno c
--- 31033 Castelfranco V.to (TV)
--- Tel.: +39 0423 723431 Fax.: +39 0423 744738
--- mailto: igor.trevisan@bluewind.it
--- http://www.bluewind.it
------------------------------------------------------------------
