Received: from ug-out-1314.google.com ([66.249.92.172])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FuyrE-0004c6-CU
	for linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 17:43:13 -0400
Received: by ug-out-1314.google.com with SMTP id q2so1617465uge
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Jun 2006 14:42:58 -0700 (PDT)
Message-ID: <625fc13d0606261442p605d2291q5ec4b0ad4868e7b3@mail.gmail.com>
Date: Mon, 26 Jun 2006 16:42:58 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "David Brownell" <david-b@pacbell.net>
Subject: Re: DataFlash & writesize
In-Reply-To: <200606261333.11632.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4497A89F.4010202@yandex.ru>
	<1151058432.27505.60.camel@fuzzie.sanpeople.com>
	<1151059415.16043.45.camel@sauron.oktetlabs.ru>
	<200606261333.11632.david-b@pacbell.net>
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/26/06, David Brownell <david-b@pacbell.net> wrote:
> On Friday 23 June 2006 3:43 am, Artem B. Bityutskiy wrote:
> > On Fri, 2006-06-23 at 12:27 +0200, Andrew Victor wrote:
> > > Since the writesize change is now in mainline git, here is a trivial
> > > patch to set mtd->writesize for DataFlash.
> > > [writesize = erasesize = pagesize]
> > >
> >
> > Andrew,
> >
> > I made the same yesterday and it is in GIT, but thank you anyway!
>
> What are the intended semantics for "writesize" by the way?
>
> I noticed I was getting that first BUG_ON in mtdcore:add_mtd_device
> since, with NOR CFI cmdset 1 flash, with current GIT.  Seems like
> writesie should have been set up already.

Which git tree and when?  That was a bug that should have been fixed
last week in the mtd-2.6.git tree.  And it should also go to Linus
ASAP.

josh
