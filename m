Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmriE-0005Y9-Ak
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 15:41:53 +0000
Date: Thu, 26 Mar 2009 16:41:42 +0100
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
Message-ID: <20090326154142.GA15963@Chamillionaire.breakpoint.cc>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
	<1237874727.14602.95.camel@localhost.localdomain>
	<20090324085530.GA21444@Chamillionaire.breakpoint.cc>
	<1237962807.14602.99.camel@localhost.localdomain>
	<20090326134418.GB21993@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20090326134418.GB21993@shareable.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Jamie Lokier | 2009-03-26 13:44:18 [+0000]:

>Artem Bityutskiy wrote:
>> It sounds wrong to me to make flash_eraseall depend on how JFFS2 is
>> compiled...
>
>It sounds wrong to me as well.
>
>What if you're running flash_eraseall on one kernel - it might not
>even have JFFS2 - and then use the flash later with a different kernel
>with a different setting.

I'm sorry. That is actually my point. The layout of the cleanmarker
(which are used only by JFFS2) depends on a specific kernel switch in
case of NOR flash which is not BIT_WRITEABLE and userland can't know
that.
I've sent a patch to remove the -j option because the generated
cleanmaker *may* be wrong. Artem replied that he would like to see this
fixed.
So here is an attempt to fix this: black listed ubi & data flash but I
dunno how fix the NOR case where does not have BIT_WRITEABLE bit. A
commandline switch for those who know what they do?
Why don't rip out -j and let the kernel create clean marker if it
needs it?

>-- Jamie

Sebastian
