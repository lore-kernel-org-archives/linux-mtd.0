Received: from fireext.wenk.be ([193.190.145.130] helo=hardy.denayer.wenk.be)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Axq6j-00044i-DL
	for linux-mtd@lists.infradead.org; Mon, 01 Mar 2004 16:17:29 +0000
From: Gerrit Van de Velde <gvd@denayer.wenk.be>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1078157135.6336.823.camel@hades.cambridge.redhat.com>
References: <1078156118.4832.7.camel@nios>
	 <1078157135.6336.823.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Message-Id: <1078158019.4832.9.camel@nios>
Mime-Version: 1.0
Date: 01 Mar 2004 17:20:19 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 strange behaveour
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Nothing strange there. There's no JFFS file system; JFFS fails to mount.
> Why did you even build it into your kernel?


ok !

i rebuilt the kernel with only jffs2 and not both versions in it
all is ok now, thx for the quick response ;)

Kind regards,
Gerrit Van de Velde
