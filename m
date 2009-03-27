Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ln52r-0002pP-NV
	for linux-mtd@lists.infradead.org; Fri, 27 Mar 2009 05:56:05 +0000
Subject: Re: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20090326154142.GA15963@Chamillionaire.breakpoint.cc>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
	<1237874727.14602.95.camel@localhost.localdomain>
	<20090324085530.GA21444@Chamillionaire.breakpoint.cc>
	<1237962807.14602.99.camel@localhost.localdomain>
	<20090326134418.GB21993@shareable.org>
	<20090326154142.GA15963@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 27 Mar 2009 07:55:32 +0200
Message-Id: <1238133332.3321.98.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Jamie Lokier <jamie@shareable.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-03-26 at 16:41 +0100, Sebastian Andrzej Siewior wrote:
> * Jamie Lokier | 2009-03-26 13:44:18 [+0000]:
> 
> >Artem Bityutskiy wrote:
> >> It sounds wrong to me to make flash_eraseall depend on how JFFS2 is
> >> compiled...
> >
> >It sounds wrong to me as well.
> >
> >What if you're running flash_eraseall on one kernel - it might not
> >even have JFFS2 - and then use the flash later with a different kernel
> >with a different setting.
> 
> I'm sorry. That is actually my point. The layout of the cleanmarker
> (which are used only by JFFS2) depends on a specific kernel switch in
> case of NOR flash which is not BIT_WRITEABLE and userland can't know
> that.
> I've sent a patch to remove the -j option because the generated
> cleanmaker *may* be wrong. Artem replied that he would like to see this
> fixed.
> So here is an attempt to fix this: black listed ubi & data flash but I
> dunno how fix the NOR case where does not have BIT_WRITEABLE bit. A
> commandline switch for those who know what they do?
> Why don't rip out -j and let the kernel create clean marker if it
> needs it?

I looked into your patch closer, and there is no such dependency
actually. Now it looks fine for me.

I can apply them if there are not complaints. But how you have
tested them? I would not want to break 'flash_eraseall' once again :-)

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
