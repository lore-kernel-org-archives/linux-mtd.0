Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WM0D-0001DT-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2001 18:59:49 +0100
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB8403E3DFD3@srvmail-mtl.ubisoft.qc.ca>
From: Patrick Allaire <pallaire@gameloft.com>
To: Vipin Malik <Vipin.Malik@daniel.com>,
        Patrick Allaire
	 <pallaire@gameloft.com>,
        linux-mtd@lists.infradead.org
Subject: RE: Applying MTD to 2.2.x kernel
Date: Mon, 13 Aug 2001 13:59:23 -0400
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


Hmmm, I forgot to mention that I compile every things in the Kernel, the
module are enable but I am not compiling any.

Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.



> -----Original Message-----
> From: Vipin Malik [mailto:Vipin.Malik@daniel.com]
> Sent: August 13, 2001 1:48 PM
> To: 'Patrick Allaire'; linux-mtd@lists.infradead.org
> Subject: RE: Applying MTD to 2.2.x kernel
> 
> 
> 
> >I have tried to apply some snapshot of the MTD to kernels 
> 2.2.17 2.2.18
> >without any success. If I only apply the mtd-2.2.17.patch, I 
> dont have any
> >problems with patch, but then it wont compile. 
> 
> I believe that mtd does not compile as modules in the 2.2.x 
> series. You must
> build the stuff into the kernel. If you are not using 
> modules, then it may
> help if you post an example of your compilation issues.
> 
> Vipin
> 
