Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fenlz-0002yp-CO
	for linux-mtd@lists.infradead.org; Sat, 13 May 2006 02:38:49 -0400
Message-ID: <44657EB8.6030404@kaigai.gr.jp>
Date: Sat, 13 May 2006 15:37:44 +0900
From: KaiGai Kohei <kaigai@kaigai.gr.jp>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <445C476A.2090506@ak.jp.nec.com>	<20060507171601.GA7990@wohnheim.fh-wedel.de>	<445EA6D4.5000909@ak.jp.nec.com>	<1147092567.2766.146.camel@pmac.infradead.org>	<4460BEEE.2070704@ak.jp.nec.com>
	<4463C5B8.1070708@kaigai.gr.jp>	<1147390288.12030.16.camel@shinybook.infradead.org>	<4464A7B1.4070605@kaigai.gr.jp>
	<1147448312.2794.421.camel@pmac.infradead.org>
In-Reply-To: <1147448312.2794.421.camel@pmac.infradead.org>
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

Hi,

I have fixed the subject of patches in jffs2-xattr-2.6.git tree
by the following method.

> Alternatively, it's easy enough to cherry-pick patches from
> git and apply them to a new branch, then make that new branch your
> 'master'. If you do this, remember to push with the '--force' option so
> that your new tree overwrites the remote.

The all of previous 12 patches has '[JFFS2][XATTR]' prefix now.
Please confirm at http://git.infradead.org/?p=jffs2-xattr-2.6.git;a=log

Thanks for those indications at early phase.
-- 
KaiGai Kohei <kaigai@kaigai.gr.jp>
