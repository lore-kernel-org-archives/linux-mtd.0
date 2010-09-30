Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P1KlB-0000td-96
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 15:09:26 +0000
In-Reply-To: <4CA3D92E.9060109@call-direct.com.au>
References: <20100929221401.GA32583@postdiluvian.org>
	<4CA3D92E.9060109@call-direct.com.au>
Subject: Re: Scheduler latency problems when using NAND
To: Iwo Mergler <iwo@call-direct.com.au>
Message-ID: <OF858CFBAE.35B192AE-ONC12577AE.00530886-C12577AE.0053293B@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 30 Sep 2010 17:08:20 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: Mark Mason <mason@postdiluvian.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Mark Mason wrote:
> > Hi all,
> >
> > I hope this is the right place for this question.  I'm having some
> > problems with scheduler latency when using UBIFS, and I'm hoping for
> > some suggestions.
> <snip>
> > The application is storing streaming video, almost entirely large
> > sequential files, roughly 250K to 15M, to a 1.6G filesystem.  There's
> > no seeking or rewriting, just creat, write, close, repeat.  No
> > compression is used on the filesystem.
> >
> > The problem I'm seeing is excessively large scheduler latency when
> > data is flushed to NAND.
> <snip>
> > Does anyone have any suggestions, ideas, hints, advice, etc?
>
> The Linux block cache is optimised for mechanical hard drives,
> to minimise seek times. Some of the assumptions don't make much
> sense with FLASH and streaming storage.
>
> Maybe try to flush data whenever you have written a few blocks'
> worth. Or have a look at the O_DIRECT flag (or madvise), although
> I don't know how it interacts with UBIFS.
>
> Have you considered using a different file system? UBIFS is not
> exactly optimised for your use case. JFFS2 would be better, but
> won't stomach your flash size.

Perhaps try the new LogFS? Maybe it is better suited to this workload.

      Jocke
