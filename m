Received: from wproxy.gmail.com ([64.233.184.206])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CorPC-0004gt-Lb
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 17:55:59 -0500
Received: by wproxy.gmail.com with SMTP id 36so639538wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2005 14:55:57 -0800 (PST)
Message-ID: <6934efce05011214553465438@mail.gmail.com>
Date: Wed, 12 Jan 2005 14:55:57 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1105569824.3896.44.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<Pine.LNX.4.58.0501121708100.10617@phoenix.infradead.org>
	<6934efce0501121430471e55a8@mail.gmail.com>
	<1105569824.3896.44.camel@weaponx.rchland.ibm.com>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> That's not true.  Eraseblocks can go bad during operation.  That doesn't
> mean that the whole device returns bad data.

Sure, during an erase...  How does a checksum help you here?

> CRCs are needed.  Or rather, some form of checksum is needed.  Bits flip
> during operation on NOR as well.  I've seen it happen.  It's rare, but
> as David put it in an IRC conversation "it's a sanity check on the
> hardware".
>
> There's sort of multiple threads on this topic, so maybe check some of
> those.  We even got Joern to agree they're needed :).

I respectfully disagree.  I don't think checksums are needed to
protect you from NOR read errors *unless* the checksums are the only
thing protecting the filesystem from bad things like crashes, power
failures, and bugs.
