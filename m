Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oxkt1-0003an-JQ
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2010 18:14:44 +0000
Received: by bwz19 with SMTP id 19so6517281bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2010 11:14:41 -0700 (PDT)
Subject: Re: UBI/UBIFS interrupted write page handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <1284054669.11335.21.camel@brekeke>
References: <4C88DDD5.4060507@parrot.com> <1284054669.11335.21.camel@brekeke>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Sep 2010 21:14:38 +0300
Message-ID: <1285006478.1762.1.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-09-09 at 20:51 +0300, Artem Bityutskiy wrote:
> > On one of our test, we are in case 3. Ubifs find a valid interrupt page 
> > on mount and trust it. Latter the page become corrupted [1] because it 
> > is unstable.
> 
> OK, I see.
> 
> > To identify a interrupted write page we :
> > - could use interrupted flags for static volume
> > - handle with care data move (copy flags) : if sqnum of the copy is the 
> > biggest, we should ignore it/copy it.
> > - use upper layer for dynamic volume. For ubifs this could be a journal.
> 
> Actually, for UBIFS things are rather simple. In UBIFS every writes go
> to the journal. Even GC writes to the journal. So when we are mounting
> after an unclean reboot, we can simply refresh the last LEBs of all
> journal heads using the 'ubi_leb_change()' call. This should handle all
> the three cases you describe.
> 
> I do not think it is very difficult to do.

Matthieu, I can try to do to make some patches for you, but when you
come back on-line and start actively testing :-) I do want to help you
and improve UBIFS, but I'm not very motivated to do this unless this is
really needed. I think we have few other pending issues, and the ball is
on your side. :-)

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
