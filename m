Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16NeLt-0002a7-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jan 2002 18:18:29 +0000
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB84064B132B@srvmail-mtl.montreal.ubisoft.org>
From: Patrick Allaire <pallaire@gameloft.com>
To: David Woodhouse <dwmw2@infradead.org>,
        Patrick Allaire
	 <pallaire@gameloft.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: How to Sync properly ? 
Date: Mon, 7 Jan 2002 13:29:18 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Do you know any of the standard FS that will support sync ??

because for the moment the dirver for my ST falsh will only write 128k at a
time ... I would have to change my hardware to use Intel Flash, to be able
to use JFFS 1 or 2.



Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.



> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: January 7, 2002 9:35 AM
> To: Patrick Allaire
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: How to Sync properly ? 
> 
> 
> 
> pallaire@gameloft.com said:
> >  Ok, I am using Minix FS ... to minimized space used by the 
> meta data
> > (short file name ...)
> 
> > What would be the FS suggested to minimize space used ? 
> 
> I'd be inclined to modify JFFS2 so that it aligns writes to 8 
> bytes and 
> doesn't mark nodes obsolete. It shouldn't be more more than a 
> one-liner for 
> each change, I believe. 
> 
> You'll need to make sure your flash chip driver implements writev(). 
> 
> --
> dwmw2
> 
> 
