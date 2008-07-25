Received: from mail161.messagelabs.com ([216.82.253.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KMUAo-0005pZ-Bn
	for linux-mtd@lists.infradead.org; Fri, 25 Jul 2008 20:45:58 +0000
Date: Fri, 25 Jul 2008 22:45:50 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/4] [RFC] [MTD] cfi_probe: remove Intel chip workaround
Message-ID: <20080725204550.GA6907@digi.com>
References: <1216712341-25869-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<1216712341-25869-2-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<1216712341-25869-3-git-send-email-Uwe.Kleine-Koenig@digi.com>
	<1216993939.28941.139.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1216993939.28941.139.camel@shinybook.infradead.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

David Woodhouse wrote:
> On Tue, 2008-07-22 at 09:38 +0200, Uwe Kleine-König wrote:
> > For me this workaround breaks detection of a M29W128GL flash because it
> > doesn't switch to CFI Query mode after writing 0xff.
> >
> > This workaround was introduced in 2004 between v2.6.8-rc1 and
> > v2.6.8-rc2 in CVS revision 1.77 of cfi_probe.c.  ("Send 0xFF to switch Intel
> > chips back to read mode too. Some of them ignore 0xF0")
> >
> > Alternatively writing 0xff *before* 0xf0 works with the M29W128GL.
> 
> That's probably what you should do then; your patch as it stands would
> break Intel chips, wouldn't it?
IMHO it depends on how common these chips are today.  If they still are,
I'd like to test exchanging the two commands with them before apply it.
After all it might not work for them?!  And if there were only a few and
they don't exist anymore today I would like to remove the workaround for
them.  That's why I marked my patch as RFC.

As you committed that workaround you might know which chips are/were
affected.  And you might even be able to test it and/or judge if the
workaround is still needed today.

Best regards,
Uwe

-- 
Uwe Kleine-König, Software Engineer
Digi International GmbH Branch Breisach, Küferstrasse 8, 79206 Breisach, Germany
Tax: 315/5781/0242 / VAT: DE153662976 / Reg. Amtsgericht Dortmund HRB 13962
