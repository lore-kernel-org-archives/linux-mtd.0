Received: from nf-out-0910.google.com ([64.233.182.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KTvWx-00005z-92
	for linux-mtd@lists.infradead.org; Fri, 15 Aug 2008 09:23:35 +0000
Received: by nf-out-0910.google.com with SMTP id d21so840723nfb.22
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Aug 2008 02:23:34 -0700 (PDT)
Message-ID: <ac9c93b10808150223h6fb6032co61ffa7babba57884@mail.gmail.com>
Date: Fri, 15 Aug 2008 11:23:34 +0200
From: "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
In-Reply-To: <1218789997.3184.64.camel@pmac.infradead.org>
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
Cc: linux-mtd@lists.infradead.org, Troy Kisky <troy.kisky@boundarydevices.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/8/15, David Woodhouse <dwmw2@infradead.org>:
> Frans, thank you very much for your work. One question -- has this been
>  tested on 64-bit machines?

Good question, and more difficult than I thought.
Yes, It has been tested on 64 bit hardware. More specific a DELL 9150
with a D920 (presler) dual core processor.
However, not too sure if this system runs 64bit linux. Basically it
runs an out-of-the-box install of Ubuntu 7.10.

Note also that I tested this on this PC by running a test application
and comparing the results with the original code as my PC does not
have (user accessible) NAND flash.

If desired I can install and test on a 64 bit kernel.
Then again, I do not really expect issues (it is only an algorithm
with simple operations).
Also 64 bit is not that interesting. I doubt if we will ever see
systems 64 bit processors that use NAND flash without hardware ECC
calculations...

>
>  The patch still doesn't apply, unfortunately -- something seems to be
>  mangling it. In general, it's a good idea to send patches to yourself in
>  email first, then save them off from your own INBOX and try to apply
>  them to a clean kernel tree.

Yikes. Can you email me the error log?
I know about sending patches to myself and testing them, but again
things are more complicated here.
I've developed this on a fresh kernel from kernel.org. The previous
version failed because the mtd git has a change from beginning of june
where all cvs comments have been removed. This change has not
propagated to mainline yet (2.6.26.2 still contains the cvs comment).
As I have no git experience, what I did was pull a copy of nand_ecc.c
(the only file I change) from the mtd git using my browser
(http://git.infradead.org/mtd-2.6.git?a=blob_plain;f=drivers/mtd/nand/nand_ecc.c;hb=HEAD)
and overwrite the one in 2.6.26.2. The only thing I can imagine is
that something went wrong with that. (e.g. tabs and spaces).

>
>  Please could you let me have a copy as an attachment, or just a straight
>  copy of both files?

I'll send you both files later today (they are on a different system).

Best regards, Frans. (and apologies for the trouble I caused with this).
