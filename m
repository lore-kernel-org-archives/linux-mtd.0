Received: from wx-out-0506.google.com ([66.249.82.227])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HQcTj-0000CG-PA
	for linux-mtd@lists.infradead.org; Mon, 12 Mar 2007 00:49:50 -0400
Received: by wx-out-0506.google.com with SMTP id s16so1586474wxc
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Mar 2007 21:49:45 -0700 (PDT)
Message-ID: <91b24a870703112149ucba512ahc8976d0f10a6e625@mail.gmail.com>
Date: Mon, 12 Mar 2007 12:49:45 +0800
From: "Marteo Tim" <tim.marteo@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@lazybastard.org>
Subject: Re: Does mtd support two-plane page program for nand flash?
In-Reply-To: <20070309114246.GA4897@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <49eab5c80703062257m7b26d09cha8c996aa2c8d5e07@mail.gmail.com>
	<20070307143414.GA16439@lazybastard.org> <45F11641.1010507@nokia.com>
	<20070309114246.GA4897@lazybastard.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MLC NAND Flash has already become the mainstream flash for
large-capacity on the market. But due to its low writting speed, there
will be introduced more parallel writting features such as multi-bank,
interleave, etc. So I think it is very necessary to modify MTD
structure to support multi-plane & interleave feature for speed
issure.

It is a good method to shield the details of flash type by composing
two or more page as a large page. Although it will be more slower for
small segment data read/write. But for large-capacity flash,
continuate writting speed maybe is more concerned.

Regards,
marteo

2007/3/9, J=F6rn Engel <joern@lazybastard.org>:
> On Fri, 9 March 2007 10:09:37 +0200, Adrian Hunter wrote:
> >
> > OneNAND DDP does this too (google: onenand "2x program")
>
> Thanks!
>
> > I presume the possibility exists to have the driver pretend that the
> > page size is twice as large and there are half as many erase blocks.
> > It would have to map the addressses accordingly - and everything
> > else would have to be willing to accept a 4KiB page with 8
> > subpages and 128 bytes of oob.
>
> That would be the quick way to get extra bandwidth.
>
> Interleaving writes to both planes can also help latency.  It is
> possible to write to one plane while the other is erasing.  It is
> possible to do two writes in parallel.  Keeping things seperate would
> keep writesize and erasesize low.  And by combining two or more planes,
> the slowest of them always decides how long a write/erase will take.
>
> So in the long run, I would prefer to keep planes seperate and add
> intelligence to filesystems, LogFS in particular.
>
> J=F6rn
>
> --
> It does not matter how slowly you go, so long as you do not stop.
> -- Confucius
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
