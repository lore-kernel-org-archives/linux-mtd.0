Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Joyxq-00023g-F1
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 10:46:06 +0000
Subject: Re: [RFC][patch] NAND partial page read functionality
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <Pine.LNX.4.64.0804241057520.6029@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
	<1209018876.11721.100.camel@sauron>
	<20080424074526.GA21709@cloud.net.au>
	<Pine.LNX.4.64.0804241057520.6029@pentafluge.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Thu, 24 Apr 2008 13:45:53 +0300
Message-Id: <1209033953.11721.131.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Hamish Moffatt <hamish@cloud.net.au>, Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2008-04-24 at 11:25 +0100, Alexey Korolev wrote:
> Oh I'm glad to hear that this patch is needful. In fact I did
> not drop it. We did some more investigations about integration subpage
>  read in background. We tried to remove some drawback caused by
> invalidation of prestored page in do_read_ops function. (We have found
> that on large read requests nand subpage read causes ~10% of read perform=
ance degradation. I
> wanted to remove but changes made code ugly and saved only 5%)

Err, are you referring this chip->pagebuf cache? Have you considered
making it more complex and keep track of individual sub-pages within the
pagebuf? You say it introduces a lot of ugliness? May be you could
somehow separate this ugliness out nicely somehow?

> Also we investigated possibility to make more universal solution which in=
cludes both sub-page=20
> read and partial page write. As it was discussed in December. In fact the=
 partial page write did not
> give any benefits at all as file system operates write_size. If we reduce=
 writesize JFFS2 will write data by=20
> small chunks only and it will cause strong performance degradation. (it
> brings more cons than pros until serious hacks in JFFS2 will be
> implemented)

Well, in any case, if you have something for writes, this should be a
separate story.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
