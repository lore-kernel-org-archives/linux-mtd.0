Received: from tomts15-srv.bellnexxia.net ([209.226.175.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Beai-0002N5-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Dec 2001 16:08:13 +0000
From: "Mike Ruthven" <mike@creonova.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
	<ilatypov@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: nftl 
Date: Wed, 5 Dec 2001 11:18:24 -0500
Message-ID: <NPENLOCCCBDDFGHLFFBLEEEOCAAA.mike@creonova.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <15764.1007566892@redhat.com>
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

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
> Woodhouse
> Sent: December 5, 2001 10:42 AM
> To: ilatypov@infradead.org
> Cc: Mike Ruthven; linux-mtd@lists.infradead.org
> Subject: Re: nftl
>
>
>
> ilatypov@infradead.org said:
> >  I encountered the same with an M-Sys-pre-formatted DOC chip.  It
> > seems that the existing MTD code will work only after re-formatting
> > the chip with the nftl_format.  Correct me if I am wrong.
>
> Shouldn't take much to make that format work with our NFTL code. Again,
> it's disabled mostly because it's not tested.
>
> --
> dwmw2
>
>
That's it.  Thanks.
Not that one case is a test, but I was able to nftl_format my DOC with erase
size 0x4000.
