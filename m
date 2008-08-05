Date: Tue, 5 Aug 2008 15:41:55 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Uwe.Kleine-koenig@digi.com, Alexander Belyakov <abelyako@googlemail.com>,
	dwmw2@infradead.org
Subject: Re: [PATCH 2/4] [RFC] [MTD] cfi_probe: remove Intel chip
 workaround
In-Reply-To: <alpine.LFD.1.10.0807281453090.27480@casper.infradead.org>
Message-ID: <alpine.LFD.1.10.0808051535170.24454@casper.infradead.org>
References: <1216712341-25869-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<1216712341-25869-2-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<1216712341-25869-3-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<fe810cf0807280021y798b91f0h63bae54cd0082bb1@mail.gmail.com>
	<alpine.LFD.1.10.0807281453090.27480@casper.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> 
> > > For me this workaround breaks detection of a M29W128GL flash because it
> > > doesn't switch to CFI Query mode after writing 0xff.
> > >
> > > This workaround was introduced in 2004 between v2.6.8-rc1 and
> > > v2.6.8-rc2 in CVS revision 1.77 of cfi_probe.c.  ("Send 0xFF to switch Intel
> > > chips back to read mode too. Some of them ignore 0xF0")
> > >
> > > Alternatively writing 0xff *before* 0xf0 works with the M29W128GL.
> > >
> > 
> > As far as I know M29W128GL is only chip having troubles with 0xFF.
> > Even M29DW128GL works fine with that.
> > 
> > Writing 0xFF before 0xF0 works fine both M29W128GL, M29DW128GL and
> > Intel's flash (we have tried with M18). Not sure though if it would
> > work for *all* flash parts.
> 
> Several days ago I have asked our specialists about what chips require
> 0xFF just after 0xF0. Probably it was some early revisions of L30.
> Unfortunately the fixup description do not tell us what it was exactly. It was long time ago and it is
> not so simple to find out what chips require this. Please stand by for
> 2-3 days I still believe I could be able to find what it was the chip
> exactly. If it was some beta revisions - then it make sence to kill 0xFF
> lines. If not it might be necessary to use another fix. 
>

I've lost any hope to reach info about what chips are require sending
0xFF just after reset. About 10 different persons were asked - nobody
knows. 
So we don't know exactly what chips require 0xFF. So it might be risky to kick off
these 0xFF lines since it may affect users. 
May be it would be better to make a kind of cfi_fixup routine to provide
more or less generic QRY procedure for "odd" chips at the stage of
probing?
It make sence at least because there is one more chip requires special
routine for QRY. ST M29DW should send 0x98 command not at 0x55 offset
but at 0x555 offset.
So using existing routines for ST M29DW causes failure. 

I've made patch and verified it on ST M29W, ST M29DW, M18. Please find
the patch in next messsage. Hope it will help.

Thanks,
Alexey
 
