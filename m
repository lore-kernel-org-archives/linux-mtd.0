Received: from mgw-x1.nokia.com ([131.228.20.21])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AlUiS-0007Jr-3s
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2004 15:01:24 +0000
Received: from esvir05nok.ntc.nokia.com (esvir05nokt.ntc.nokia.com
	[172.21.143.37])i0RF1DV14495	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jan 2004 17:01:13 +0200 (EET)
Date: Tue, 27 Jan 2004 15:48:35 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: MTD List <linux-mtd@lists.infradead.org>
Message-ID: <20040127134835.GA9404@angel.research.nokia.com>
References: <20040127100613.GA16078@angel.research.nokia.com>
	<1075202008.1633.26.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1075202008.1633.26.camel@hades.cambridge.redhat.com>
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 case insensitivity
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 27, 2004 at 11:13:28AM +0000, David Woodhouse wrote:>
> What precisely is the problem you're trying to solve?

User space people want the file name case insensitivity.  I guess the
old files are likely to be selected from a list on an embedded device.
However case insensitivity is a desirable feature when adding new file
names.

My primary concern was to estimate the cost or pain of implementing
file name case insensitivity and find arguments against doing it in
the kernel.

Jarkko Lavinen
