Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JZkCT-0005ux-RF
	for linux-mtd@lists.infradead.org; Thu, 13 Mar 2008 09:58:14 +0000
Date: Thu, 13 Mar 2008 09:59:12 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Arnaud Patard <arnaud.patard@rtp-net.org>
Subject: Re: [PATCH] Fix oops on reboot in physmap
Message-ID: <20080313085912.GB2187@logfs.org>
References: <87fxuv816l.fsf@lechat.rtp-net.org>
	<20080313082224.GA2187@logfs.org>
	<87fxuv2aua.fsf@lechat.rtp-net.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fxuv2aua.fsf@lechat.rtp-net.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 March 2008 11:10:37 +0100, Arnaud Patard wrote:
> >
> > Added dwmw2 on Cc:.  This could be material for -stable.
> 
> -stable ? why ? iirc, the faulty commit has been merged for
> 25-rc..something so 2.6.24 is not affected. Are you talking about 2.6.25?

No, I simply didn't check when the commit happened.  But yes, this is
.25 material.

Jörn

-- 
He that composes himself is wiser than he that composes a book.
-- B. Franklin
