Received: from repulse.teligenthost.com ([207.155.249.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15F2HH-0006xn-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Jun 2001 00:29:51 +0100
From: "Bao C. Ha" <baoha@sensoria.com>
To: "'kira brown'" <kira@linuxgrrls.org>, "'Simon Evans'" <spse@secret.org.uk>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Block device as MTD 
Date: Tue, 26 Jun 2001 16:32:54 -0700
Message-ID: <01ea01c0fe98$53bfd9a0$326c020a@SENSORIA>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.30.0106270010420.1186-100000@carrot.linuxgrrls.org>
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

Are there any journaling fs with compression besides
JFFS2?  I am primarily interested in the DOM and
JFFS2 on DOC has made life barely bearable in the
small footprint world.

Thanks.
Bao

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of kira brown
> Sent: Tuesday, June 26, 2001 4:12 PM
> To: Simon Evans
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Block device as MTD 
> 
> 
> 
> 
> On Tue, 26 Jun 2001, Simon Evans wrote:
> 
> > If you are going to put a JFFS2 fs on the device, please note that
> > it can take quite a while to mount because JFFS2 scans every block.
> > A 96MB CF card took about 2 minutes.
> 
> Why on eartl would you want to put JFFS on CF, when CF 
> provides all the
> facilities that JFFS does already?   You might as well put 
> ext3fs on it,
> it'll be much faster.
> 
> k.
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
