Received: from nf-out-0910.google.com ([64.233.182.187])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KTwAZ-0007So-9Y
	for linux-mtd@lists.infradead.org; Fri, 15 Aug 2008 10:04:31 +0000
Received: by nf-out-0910.google.com with SMTP id d21so852169nfb.22
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Aug 2008 03:04:30 -0700 (PDT)
Message-ID: <ac9c93b10808150304k14f054faw402a7f67e868d2a@mail.gmail.com>
Date: Fri, 15 Aug 2008 12:04:30 +0200
From: "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
In-Reply-To: <1218793271.3184.77.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>
	<1218472202.2977.12.camel@pmac.infradead.org>
	<ac9c93b10808120153m7435424ci3e49a70d3599cc06@mail.gmail.com>
	<1218535872.2977.133.camel@pmac.infradead.org>
	<alpine.DEB.0.99.0808142007340.6572@frans-desktop>
	<48A48330.70105@boundarydevices.com>
	<ac9c93b10808150141o6627e350pd23895d56426d59c@mail.gmail.com>
	<1218789997.3184.64.camel@pmac.infradead.org>
	<ac9c93b10808150223h6fb6032co61ffa7babba57884@mail.gmail.com>
	<1218793271.3184.77.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/8/15, David Woodhouse <dwmw2@infradead.org>:
> On Fri, 2008-08-15 at 11:23 +0200, Frans Meulenbroeks wrote:
>  > 2008/8/15, David Woodhouse <dwmw2@infradead.org>:
>
> No need -- if you've thought about it and believe it should work, that's
>  probably enough. I just saw some 'unsigned long' data types, which are
>  going to have a different size between 32-bit and 64-bit systems, and
>  wondered if that would introduce differences.

I was unaware of that. For me unsigned long is more or less a synonym
for 32 bit. Maybe I'm just getting too old :-(
Anyway, if you have a suggestion for a better type, I'll happily change things.
Would uint32_t be better?

>
>
>  > Yikes. Can you email me the error log?
>
>
> patching file Documentation/nand/ecc.txt
>  patching file drivers/mtd/nand/nand_ecc.c
>  Hunk #1 FAILED at 1.
>  Hunk #2 FAILED at 28.
>  2 out of 2 hunks FAILED -- saving rejects to file drivers/mtd/nand/nand_ecc.c.rej
>
>  I see stuff like this in the patch file:
>
>
>   }
>   EXPORT_SYMBOL(nand_correct_data);
>
>   MODULE_LICENSE("GPL");
>  -MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com>");
>  +MODULE_AUTHOR("Frans Meulenbroeks <fransmeulenbroeks@gmail.com>");
>   MODULE_DESCRIPTION("Generic NAND ECC support");
>
>
> But those lines at the end of the file aren't indented by a space,
>  although the patch seems to expect them to be.

This is odd, as the patch of ecc.txt did succeed. Just browsed back to
the email I did sent
did not have a space between the + and the text in ecc.txt either. and
patch did not make a fuzz out of that one.
Btw the patch is made with diff (the std one from ubuntu 7.10). No
fancy new stuff like quilt here (I'm just an old fart :-) )

> You'd do better with just
>   git clone git://git.infradead.org/mtd-2.6.git
>   cp ~/nand_ecc.c drivers/mtd/nand
>   git-diff drivers/mtd/nand/nand_ecc.c | mail dwmw2

Will try this tonight (which is in 8 hrs or so).
Not sure if the | mail will work.
I mostly use web based mail, and for this I installed alpine to avoid
html makeup and line wrapping. Alpine is coupled to my gmail account.

Anyway, I'll execute the commands you gave to me and send the result
of git-diff to you inlined as well as in an attachment.
>
>  But I actually suspect it was mangled in transit in the patch -- an
>  attachment might survive, although you should really work out what's
>  eating your mail.

I'll dig into this. It could also be that the nand_ecc.c I pulled from
git through the browser got mangled. Will get back to you. Thanks for
your patience & help!

Frans.
