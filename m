Received: from [212.209.10.216] (helo=krynn.axis.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GJGp-00006o-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 13:27:28 +0000
From: johan.adolfsson@axis.com
Message-ID: <02c301c2948a$9c5662e0$a3b270d5@homeip.net>
Reply-To: <johan.adolfsson@axis.com>
To: <johan.adolfsson@axis.com>, "David Woodhouse" <dwmw2@infradead.org>,
   <andersen@codepoet.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: mkfs.jffs2.c rework (doh)
Date: Mon, 25 Nov 2002 14:57:36 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Doh..
Should have mentioned that the diff is against the old version,
but at least you get the picture.

/Johan


----- Original Message -----
From: <Johan.Adolfsson@axis.com>
To: "David Woodhouse" <dwmw2@infradead.org>; <andersen@codepoet.org>
Cc: <linux-mtd@lists.infradead.org>
Sent: den 25 november 2002 14:50
Subject: Re: mkfs.jffs2.c rework


> >
> > Also, could we have an option to write cleanmarkers to the beginning of
> > each block?
> >
> > --
> > dwmw2
>
> Here is a patch to add cleanmarkers and some minor bugfix:
> Here is what I would use as a comment:
> --
> Added support for adding cleanmarkers to start of every eraseblock.
> --no-cleanmarkers disables it.
> --cleanmarker=SIZE changes the cleanmarker size.
>
> Clean up hardcoded 16 to sizeof(ffbuf).
> Added missing pad_block_if_less_than() in output_reg().
> --
> Please apply if it looks ok.
> /Johan
>
>
