Received: from [212.58.137.10] (helo=trajan.ag-netcom.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AFeLm-0006U8-A5
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2003 18:50:22 +0000
Received: from 192.168.0.4 (dsl-217-155-44-202.zen.co.uk [217.155.44.202])
	by trajan.ag-netcom.net (8.12.8p1/8.12.8) with ESMTP id h9VIogRs046684
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2003 18:50:42 GMT
	(envelope-from david@avoncliff.com)
From: david stevenson <david@avoncliff.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 31 Oct 2003 18:49:09 +0000
References: <200310302103.42918.david@avoncliff.com>
	<1067616737.3423.283.camel@hades.cambridge.redhat.com>
In-Reply-To: <1067616737.3423.283.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200310311849.09315.david@avoncliff.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: zlib versions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 31 October 2003 4:12 pm, David Woodhouse wrote:
> On Thu, 2003-10-30 at 21:03 +0000, david stevenson wrote:
> > Could someone please educate me on zlib?
> >
> > I can compile kernel 2.4.21 with MTD updated from tarball 20031021 with
> > jff2 with no errors.
> > But when I try and compile the utils from the same tar ball, using the
> > same kernel headers I get error file not found zlib.h.
>
> Do you have the zlib-devel package installed? Are you compiling natively
> or cross-compiling?

I am cross compiling - well actually it is from pentium to i386.

I do not know about zlib-devel, which probably means I don't have it.
But the kernel code includes include/linux/zlib.h which is included by 
/fs/jffs2/compr_zlib.c and this compiles OK. So I assumed I had all that was 
needed.

However in the util tree compr_zlib.c is looking for include/zlib.h, and I 
belive a different version.

If I need to get zlib-devel can you give a reference to where I get it from as 
I have seen confusing alternatives.

Thanks
David
