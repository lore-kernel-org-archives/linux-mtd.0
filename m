Received: from wr-out-0506.google.com ([64.233.184.231])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JqRs1-0002MF-Mb
	for linux-mtd@lists.infradead.org; Mon, 28 Apr 2008 11:50:10 +0000
Received: by wr-out-0506.google.com with SMTP id c46so4243436wra.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Apr 2008 04:50:08 -0700 (PDT)
Message-ID: <bae050c10804280450g591c74bfn711f668863b693f1@mail.gmail.com>
Date: Mon, 28 Apr 2008 19:50:08 +0800
From: Nancy <nancydreaming@gmail.com>
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: UBI: badblock management confusion!
In-Reply-To: <48158370.9090001@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10804242354s722c9a58r1ed4e1ad1afaff90@mail.gmail.com>
	<4811B6BF.9020200@nokia.com>
	<bae050c10804250508g68df553qcce03bb6551aa5c5@mail.gmail.com>
	<48158370.9090001@nokia.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Oh, thank you for ponting out my mistake!
> > You mean UBI admit the amount of current badblocks are part of
> > reserved PEBs, right?
> >
>
> Not exactly.  It is just that UBI does not mind if there are not enough
> PEBs to meet the number desired for bad-block handling.
>
> > If the answer is yes, then the volume size I'm goting to create should
> > be equal to
> >
> > (total number of PEB this ubi device has - total number of reserved
> > PEBs) * LEB size
> >
> > not what UBI think:
> > (number of good PEBs - total number of reserved PEBs) * LEB size
> >
> > Am I right?
> >
>
> I am not sure what you are trying to achieve.  You can always use
> the -m option of ubimkvol to set volume size to maximum available size.
>
Let me clarify the problem I met:
	there are so many Nand flash for burning. Each one of them may have
different numbers of badblocks, but that number do not exceed the reserved
badblock number. Each one of them should have the same maximum avaliable
volume size. But the practice tell no, the maximum avaliable volume size
effect by number of badblocks the current MTD partition has. That's wrong.
You can try by yourself.

-- 
Best wishes,
Nancy
