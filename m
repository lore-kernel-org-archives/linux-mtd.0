Received: from an-out-0708.google.com ([209.85.132.245])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HeXAv-0000Oq-R2
	for linux-mtd@lists.infradead.org; Thu, 19 Apr 2007 09:59:55 -0400
Received: by an-out-0708.google.com with SMTP id d40so1121551and
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 Apr 2007 06:59:51 -0700 (PDT)
Message-ID: <fe810cf0704190659r7dc01ebdgb93cfc3f248c0682@mail.gmail.com>
Date: Thu, 19 Apr 2007 17:59:51 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] [JFFS2] Non-contiguous write bug fix (Sibley)
In-Reply-To: <1176908804.21611.37.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <fe810cf0704170414r59900903rc8ed2e52d22eb833@mail.gmail.com>
	<1176908804.21611.37.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/18/07, David Woodhouse <dwmw2@infradead.org> wrote:
> On Tue, 2007-04-17 at 15:14 +0400, Alexander Belyakov wrote:
> > Yes, the bug still exists. The patch fixes JFFS2 non-contiguous write
> > error on Sibley.
>
> Sorry, I missed (or have forgotten) this. Can you explain in a little
> more detail?

I'm hitting BUG() in jffs2_flash_writev() working with JFFS2 on
Sibley. The issue is 100% reproducible and seems to be critical for
everyone who uses the recent MTD source on Sibley.

The problem was noticed first time after MTD migration from cvs to
git. It seems several pieces of code were cleaned at that time
including wbuf fixup.

There was one unfinished discussion
http://lists.infradead.org/pipermail/linux-mtd/2006-June/016043.html

another corresponding thread is here
http://lists.infradead.org/pipermail/linux-mtd/2006-April/015340.html


> Hm, is this because the cleanmarker size in Sibley is also the wbuf
> size? So you were hitting the BUG() after writing the cleanmarker to a
> newly-erased block (hence setting wbuf_ofs to point there), but then
> moving on to actually _write_ elsewhere?
>
> If that's the case, perhaps the code which writes the cleanmarker
> shouldn't be using jffs2_flash_writev() to write it -- perhaps it should
> be bypassing the wbuf handling altogether?

The idea behind this patch is just to restore working piece of code
(wbuf fixup) now.

But you're probably right and there is another way to fix the problem.
It is worth to think about it.

Thanks,
Alexander
