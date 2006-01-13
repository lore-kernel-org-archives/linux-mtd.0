Received: from zproxy.gmail.com ([64.233.162.199])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ExRdt-0002fG-BW
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2006 11:19:30 -0500
Received: by zproxy.gmail.com with SMTP id i11so688350nzi
	for <linux-mtd@lists.infradead.org>;
	Fri, 13 Jan 2006 08:19:06 -0800 (PST)
Message-ID: <625fc13d0601130819w707d8155md095c6e5acef0948@mail.gmail.com>
Date: Fri, 13 Jan 2006 10:19:05 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Nikhil <nikhils@cdac.in>
In-Reply-To: <twig.1137164167.21280@cdac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <twig.1137164167.21280@cdac.in>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Question regading Cleanmarker.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/13/06, Nikhil <nikhils@cdac.in> wrote:
>
> Hi all,
>
> I am analysing the jffs2 methodology for updating the flash memory. I
> understand that the jffs2_sb_info maintains three list i.e free_list,
> clean_list and dirty_list.

And the bad_list.

>
> the garbage collector acts on the blocks on the dirty_list and on erasing
> those blocks writes a CLEANMARKER to the first 12 bytes indicating
> succesful erase and move the block from dirty_list to free_list.
>

Yep.

> So all the blocks in the free_list are empty with first twelve bytes
> having a CLEANMARKER. Whenever some node has to be written on the flash, =
a
> block from the free_list is picked and written.

Yep.

>
> whether it will overwrite the CLEANMARKER bytes... if so then it has to
> perform erase of the whole block again...

No, it isn't erased again.

>
> else the block is appended after the CLEANMARKER bytes... if so, then
> after some time when this block moves from clean_list to dirty_list (by
> some updations on the file data or else) how will the garbage collector
> identify the block as clean/unclean as the the CLEANMARKER will be
> present.

The node for the cleanmarker is obsoleted.

>
> whether the garbage collector neglects this CLEANMARKER when is it gettin=
g
> updated or removed? else after some point of time, all the eraseblocks
> will have a CLEANMARKER which will defeat the basic purpose of having a
> CLEANMARKER.

It detects that it's obsoleted.  The garbage collector won't GC an
obsoleted node since that would be a waste of time.

> there is one more query about delayed write. What is the size of the
> buffer which gets written on the flash? is it the page size or the erase
> block size or is it a function of time?

The write buffer is used on NAND, DataFlash, and NOR flash with
transparent ECC.  For plain NOR flash (minus the new Sibley flashes)
the wbuf isn't used.  The size of the buffer depends on the chip.  For
NAND, it is the page size.  For NOR+ECC, it is the minimum write size
which is quite small.  I'm not sure about DataFlash or Sibley.

>
> Can you help in clearing my doubt?

Hope that helps.

josh
