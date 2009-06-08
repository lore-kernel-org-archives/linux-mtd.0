Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDdXP-0004pI-Oi
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 12:01:33 +0000
Date: Mon, 8 Jun 2009 13:01:10 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: about ubifs
Message-ID: <20090608120110.GE25684@shareable.org>
References: <1244204035.18630.0.camel@tommy-desktop>
	<71cd59b00906050542v72c228a0r883cef7795189fe9@mail.gmail.com>
	<1244206994.20718.7.camel@tommy-desktop>
	<71cd59b00906050704m650d9701q1012dc8b649d8d7f@mail.gmail.com>
	<20090608013528.GI15426@shareable.org>
	<1244440195.5847.327.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1244440195.5847.327.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, tommy <jiujin.hong@mid-fun.com>,
	Corentin Chary <corentin.chary@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> > A filesystem-generic "sync-on-close" mount option would be handy for
> > things like that.
> > 
> > Expecting users to call fsync from a shell script is probably a bit much
> > in a lot of applications.
> 
> Not sure about sync-on-every-close, but ex4-ish
> sync-on-close-if-there-was-truncate makes sense, IMO, and we even plan
> to implement this, we just do not have enough time ATM:
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_sync_exceptions

sync-on-close-if-there-was-a-truncate isn't useful for this case:

    echo 'Stuff' >> logfile
    reboot

I was thinking both sync-on-close and sync-on-close-after-truncate
would be most useful as _generic_ mount options, in the same way that
O_SYNC has generic filesystem support these days.

-- Jamie
