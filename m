Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K1yIb-0004Gc-1Z
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 06:41:13 +0000
Received: by wf-out-1314.google.com with SMTP id 28so3456898wfc.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 May 2008 23:41:12 -0700 (PDT)
Message-ID: <bae050c10805292341o663991bew78c0a4cb8541d5e0@mail.gmail.com>
Date: Fri, 30 May 2008 14:41:11 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: mkfs.ubifs, ubinize, ubiupdatevol request!
In-Reply-To: <1212128506.31023.95.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10805290002gb294d4yf5a62a4331225dbc@mail.gmail.com>
	<1212128506.31023.95.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/30/08, Artem Bityutskiy <dedekind@infradead.org> wrote:
> Actually what we could do is to create a simple program which would dump
> whole _MTD_ device, and basically drop unmapped physical eraseblocks.
> This is just easier to do. Something like this:
>
> fd = open(/dev/mtdX);
> for (each physical eraseblock) {
>        read(fd, buf, peb_size);
>        /* Check if PEB is not mapped by checking that there is not VID
>           header */
>        if (vid_header_is_not_present())
>                /* This PEB is unmapped, it is safe to drop it and
>                   switch to the next PEB */
>                continue;
>        /* Write data to the output file */
>        write(output_file_descriptor, buf, peb_size);
>
> }
>
> Afterward, you will be able to just flash the resulting dump with
> "ubiformat".
>
> But of course, you will dump all volumes this way, not just one. Does
> this work for you?
That's a greate idea to create UBI image for Nand burning, but I also
have to support the volume update functions. Cause products update is
used more ofen than Nand burning.

So I have no choices but write a tool to reformate ubifs.img(generated
by mkfs.ubifs), fix ubinize, ubiupdatevol.

> This should be easy to write this tool. I could do this but I am very
> busy at the moment and basically have not time, may be later.
It's OK. I'm so happy to get your reply. That mean you have already
forgive me.  Thank you!  * ^_^ *

-- 
Best wishes,
Nancy
