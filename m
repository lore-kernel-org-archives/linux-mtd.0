Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FeZS3-0000v0-6S
	for linux-mtd@lists.infradead.org; Fri, 12 May 2006 11:21:17 -0400
Message-ID: <4464A7B1.4070605@kaigai.gr.jp>
Date: Sat, 13 May 2006 00:20:17 +0900
From: KaiGai Kohei <kaigai@kaigai.gr.jp>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <445C476A.2090506@ak.jp.nec.com>	
	<20060507171601.GA7990@wohnheim.fh-wedel.de>	
	<445EA6D4.5000909@ak.jp.nec.com>	
	<1147092567.2766.146.camel@pmac.infradead.org>	
	<4460BEEE.2070704@ak.jp.nec.com> <4463C5B8.1070708@kaigai.gr.jp>
	<1147390288.12030.16.camel@shinybook.infradead.org>
In-Reply-To: <1147390288.12030.16.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: jmorris@redhat.com, KaiGai Kohei <kaigai@ak.jp.nec.com>,
	russell@coker.com.au, linux-mtd@lists.infradead.org,
	lorenzo@gnu.org, sds@tycho.nsa.gov,
	=?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@wohnheim.fh-wedel.de>
Subject: Re: [PATCH] XATTR support on JFFS2 (version. 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Thanks for yout comments.

> It does look correct to me. The patch seems to highlight some
> inconsistency of tabs vs. spaces in the indenting though.

Sorry, it's translated by terminal emulator automatically.
The patch keeps consistency of tabs in the indenting.

> When committing to the a git tree, please remember that if I pull from
> it and then Linux pulls from it, the 'subject' of your commit should be
> meaningful in that context. So it should mention 'JFFS2' at the very
> least.

OK, I'll pay attention to attach 'JFFS2' to the subject.
But nine of previous patches which have been already commited did not
attach such a keyword. Is it necessary to update the subject of them ?
(But I don't know how to operate for this. Hmm...)

Thanks,

> That's probably not quite so important for your jffs2-xattr tree, since
> I think I'll probably import that as a _patch_ when we're ready, rather
> than just pulling the whole thing. But in general, it's a useful thing
> to remember for people committing to git trees and expecting me to pull
> from them.
-- 
KaiGai Kohei <kaigai@kaigai.gr.jp>
