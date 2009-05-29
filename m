Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MA4Ok-0006M3-9k
	for linux-mtd@lists.infradead.org; Fri, 29 May 2009 15:53:40 +0000
Subject: Re: UBIFS ubimkvol issue and some others...
From: Artem Bityutskiy <dedekind@infradead.org>
To: Stanislav Popov <s.popov@rsc.bg>
In-Reply-To: <4A1EC95A.1090806@rsc.bg>
References: <4A1E8740.9050208@rsc.bg>
	<1243523800.11172.63.camel@localhost.localdomain>
	<4A1EC95A.1090806@rsc.bg>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 29 May 2009 18:53:16 +0300
Message-Id: <1243612396.11172.119.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-05-28 at 20:26 +0300, Stanislav Popov wrote:
> > How? It is not trivial. Did you use my old 2.6.21 backport tree?
> >   
> Yes, I ported it with the backport patch.

What you mean by "the backport patch"? Please, start from my old
back-port which you can find here:

http://git.infradead.org/users/dedekind/ubifs-v2.6.21.git

Make sure it works. Then you will have to back port important fixes
which are not there.

> >
> > Not sure. Probably related to your back-port. You'll have
> > to debug this yourself.
> >   
> Do you have any ideas how can I start debuging it ?

Well, inserting printk's to where it oopses, and investigate
why. Sorry, I'm not very interested to fix problem very old
kernels like 2.6.21. You are on your own here. But I suggest
you to start from taking UBIFS stuff from
git://git.infradead.org/users/dedekind/ubifs-v2.6.21.git

Vs the ubiformat failure - I'll investigate this. I think
I screwed up ubiformat in this commit:

http://git.infradead.org/mtd-utils.git?a=commit;h=32252f2b902d88f2991d260f2982b10b2016c33b

so you may try to git-reset to an earlier one so far. But
I'll investigate the issue later.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
