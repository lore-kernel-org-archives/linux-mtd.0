Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Yohl-00054V-00
	for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2001 14:02:57 +0100
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB8403F81671@srvmail-mtl.ubisoft.qc.ca>
From: Patrick Allaire <pallaire@gameloft.com>
To: David Woodhouse <dwmw2@infradead.org>,
        Patrick Allaire
	 <pallaire@gameloft.com>
Cc: MTD <linux-mtd@lists.infradead.org>
Subject: RE: DOC 2000 
Date: Mon, 20 Aug 2001 09:02:37 -0400
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

Thank you ... I did tryed that and it was not working ... I finaly found out
that I was doing this modification in /usr/src/linux/drivers/mtd ... but
this file is updated by the cvs download ... 


Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.



> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: August 17, 2001 4:34 PM
> To: Patrick Allaire
> Cc: MTD
> Subject: Re: DOC 2000 
> 
> 
> 
> pallaire@gameloft.com said:
> > doc2000.c:1102: parse error before `cleanup_doc2000'
> 
> #define __exit
> 
> --
> dwmw2
> 
> 
