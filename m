Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeZdP-0001DZ-ES
	for linux-mtd@lists.infradead.org; Fri, 12 May 2006 11:33:00 -0400
Date: Fri, 12 May 2006 17:32:38 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: KaiGai Kohei <kaigai@kaigai.gr.jp>
Message-ID: <20060512153238.GB26763@wohnheim.fh-wedel.de>
References: <445C476A.2090506@ak.jp.nec.com>
	<20060507171601.GA7990@wohnheim.fh-wedel.de>
	<445EA6D4.5000909@ak.jp.nec.com>
	<1147092567.2766.146.camel@pmac.infradead.org>
	<4460BEEE.2070704@ak.jp.nec.com> <4463C5B8.1070708@kaigai.gr.jp>
	<1147390288.12030.16.camel@shinybook.infradead.org>
	<4464A7B1.4070605@kaigai.gr.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4464A7B1.4070605@kaigai.gr.jp>
Cc: jmorris@redhat.com, KaiGai Kohei <kaigai@ak.jp.nec.com>,
	russell@coker.com.au, linux-mtd@lists.infradead.org,
	lorenzo@gnu.org, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, sds@tycho.nsa.gov
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 13 May 2006 00:20:17 +0900, KaiGai Kohei wrote:
> 
> OK, I'll pay attention to attach 'JFFS2' to the subject.
> But nine of previous patches which have been already commited did not
> attach such a keyword. Is it necessary to update the subject of them ?
> (But I don't know how to operate for this. Hmm...)

Quite likely, the easiest way would be to work with two scripts.  One
to convert a git tree into a quilt series and another to convert the
quilt series back into a git tree.

Advantage of quilt is the ease with which one can cherry-pick patches,
change patches or descriptions, reorder patches, rebase them for a new
kernel, etc.

I believe tglx (added to Cc:) has some scripts like that.  And since
many kernel hacker have similar needs, google should find even more.

[ Note to self: I need them as well. ]

Jörn

-- 
This above all: to thine own self be true.
-- Shakespeare
