Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKD5C-0002Os-0V
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 05:48:39 -0400
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: tglx@linutronix.de,
 Michael Moedt <xemc@yahoo.com>
Date: Wed, 20 Oct 2004 10:40:41 +0100
References: <20041019214518.26339.qmail@web52703.mail.yahoo.com>
	<1098222917.12223.1020.camel@thomas>
In-Reply-To: <1098222917.12223.1020.camel@thomas>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <E4E1C5BE221F@baydel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bad Blocks On JFFS2/NAND
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This 5 error business is only if you have relatively new code. Old code 
generates an incorrect and permanent bad block after 1 failure. I am testing 
the suggestion by Thomas that this is a page cache problem by always marking 
an erase page as invalid. No errors as yet but I will keep you posted.

Cheers

Simon.

On Tuesday 19 Oct 2004 10:55 pm, Thomas Gleixner wrote:
> On Tue, 2004-10-19 at 23:45, Michael Moedt wrote:
> > 1. Do you know what usually causes the "Newly-erased block contained
> > word   "... error?
> > Is it caused by a interrupted (or otherwise failed) erase?  Would
> > power-fail cause this?
>
> It's caused by a failed erase. If the chip interface is correct then it
> is usually a problem of a bad page/block. If not (e.g. wrong timing) it
> might return too early from an erase.
>
> > 2. Would this cause good blocks to be incorrectly [and permanently]
> > marked as bad?
>
> Only if failes 5 times after mount. The counter is reset with each
> mount.
>
> > I think I may have seen something similar on my system.  I'm
> > considering writing a test to see if this is a problem for me, but
> > I'd like to learn more about this also.
>
> Which version of the mtd/nand code ?
>
> There was a problem with the page cache, which was not invalidated on
> erase some time ago, but its fixed.
>
> tglx
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
