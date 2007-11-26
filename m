Received: from el-out-1112.google.com ([209.85.162.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Iwioe-0006jZ-6N
	for linux-mtd@lists.infradead.org; Mon, 26 Nov 2007 18:36:27 +0000
Received: by el-out-1112.google.com with SMTP id r27so175135ele
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Nov 2007 10:36:14 -0800 (PST)
Message-ID: <6934efce0711261036t3c04cf92xe933878742316624@mail.gmail.com>
Date: Mon, 26 Nov 2007 10:36:08 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: Wrong cache invalidation in cfi_cmdset0001.c (2.6.21 kernel)
In-Reply-To: <20071126174533.GA22844@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <000a01c83051$03c9a510$7205960a@nap.st.com>
	<20071126174533.GA22844@lazybastard.org>
Cc: Massimo CIRILLO <massimo.cirillo@st.com>, linux-mtd@lists.infradead.org,
	akorolev@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > We found an issue in cfi_cmdset0001.c file of 2.6.21 kernel.
> > It is related to cache region invalidation in the buffered
> > write procedure.

What was the test setup that uncovered this?  I surprised this wasn't
found earlier.

> > The original code performs cache invalidation from "adr" to "adr + len" in
> > do_write_buffer() while we modify region from "cmd_adr" to "len2"
> > where len2 is equal to initial value of len.
>
> Could use a better name, initial_len or something like that.  And David
> would surely appreciate a Signed-off-by: line.  Otherwise appears to
> make sense.
>
> > The following is the patch to apply for 2.6.21 kernel.
> >
> > --- a/drivers/mtd/chips/cfi_cmdset_0001.c     2007-11-26 18:06:37.000000000 +0100
> > +++ b/drivers/mtd/chips/cfi_cmdset_0001.c     2007-11-26 18:06:44.000000000 +0100
> > @@ -1472,6 +1472,7 @@ static int __xipram do_write_buffer(stru
> >       int ret, wbufsize, word_gap, words;
> >       const struct kvec *vec;
> >       unsigned long vec_seek;
> > +     int len2=len;
> >
> >       wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
> >       adr += chip->start;
> > @@ -1578,7 +1579,7 @@ static int __xipram do_write_buffer(stru
> >       chip->state = FL_WRITING;
> >
> >       ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
> > -                                adr, len,
> > +                                cmd_adr, len2,
> >                                  chip->buffer_write_time);
> >       if (ret) {
> >               map_write(map, CMD(0x70), cmd_adr);
> >

If cmd_adr <= adr then shouldn't initial_len >=len?  Something like:

initial_len = (len + wbufsize) & ~(wbufsize-1);
