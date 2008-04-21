Received: from wf-out-1314.google.com ([209.85.200.175])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JnsYn-0003MI-G2
	for linux-mtd@lists.infradead.org; Mon, 21 Apr 2008 09:43:41 +0000
Received: by wf-out-1314.google.com with SMTP id 29so1324938wff.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Apr 2008 02:43:40 -0700 (PDT)
Message-ID: <bae050c10804210243l848eeb6m97a33c5a65d5dfc6@mail.gmail.com>
Date: Mon, 21 Apr 2008 17:43:40 +0800
From: Nancy <nancydreaming@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: ubi-utils
In-Reply-To: <1208769345.5965.363.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10804210148g7e36db07vd7df62e286da6490@mail.gmail.com>
	<1208769345.5965.363.camel@sauron>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi,
>
> On Mon, 2008-04-21 at 16:48 +0800, Nancy wrote:
> > Hi all,
> >     Is there ubi-utils which can dump the specify volume mapped LEBs
> > to a file (volume.img), then I can use ubiupdatevol to put the dummped
> > file (volume.img) to Nand?
>
> unubi should do this, but last time I tried it - it did not work for me.

unubi need a image file as one of its parameter, its job seems like
ubiupdatevol do, but I need an opposite function. I need a tool to
generate a volume image

-- 
Best wishes,
Nancy
