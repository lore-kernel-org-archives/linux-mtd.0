Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hvw6C-0005Um-Hl
	for linux-mtd@lists.infradead.org; Wed, 06 Jun 2007 10:02:58 -0400
Date: Wed, 6 Jun 2007 15:58:14 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Alexander Belyakov <abelyako@googlemail.com>
Subject: Re: LogFS take four
Message-ID: <20070606135814.GB3764@lazybastard.org>
References: <20070603183845.GA8952@lazybastard.org>
	<fe810cf0706060650p48df811dw9f1dd90b2b9f145d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe810cf0706060650p48df811dw9f1dd90b2b9f145d@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 6 June 2007 17:50:44 +0400, Alexander Belyakov wrote:
> 
> Small question about compr.c. Sorry not posting in proper thread -
> just have no original message to reply to.
> 
> Why do you use __exit macros with logfs_compr_exit()? You will get an
> build-time error if logfs is compiled as part of the kernel (not
> module) just because logfs_init() calls logfs_compr_exit().

Indeed, that is a bug.  Thanks.

Jörn

-- 
Linux [...] existed just for discussion between people who wanted
to show off how geeky they were.
-- Rob Enderle
