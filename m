Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fq933-0002o5-EX
	for linux-mtd@lists.infradead.org; Tue, 13 Jun 2006 09:35:28 -0400
Message-ID: <448EBF7B.20306@kaigai.gr.jp>
Date: Tue, 13 Jun 2006 22:36:59 +0900
From: KaiGai Kohei <kaigai@kaigai.gr.jp>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Subject: Re: JFFS2/xattr problems.
References: <1148150486.3875.251.camel@pmac.infradead.org>	<44704CA9.8010604@ak.jp.nec.com>
	<448CCEC8.2080903@ak.jp.nec.com>	<1150099418.11159.44.camel@shinybook.infradead.org>	<448D3752.3090605@ak.jp.nec.com>	<1150105995.8184.17.camel@pmac.infradead.org>
	<20060612180653.GA17177@wohnheim.fh-wedel.de>
In-Reply-To: <20060612180653.GA17177@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	KaiGai Kohei <kaigai@ak.jp.nec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Jörn

> Seems you missed Ted's presentation at LCA this year.  Among the
> interesting bits:

If this presentation is public, could you tell me the URL?
This indication is highly suggestive for me.
Especially, I have not imagine yet the possibility that
malware uses xattr to hide itself.

Thanks,

> o Pretty much anything on Linux is limited to 64KiB or less.
> o Ext[23] is limited to 4KiB total for all attributes, including all
>   keys and all values.
> o The biggest user of Alternate Streams (less-limited versions of
>   xattr on Windows, Solaris, etc.) arguably is root kits.  Alternate
>   Streams have the advantage that tripwire etc. don't understand them
>   and won't look for malware there.
> o Some system administrators have no plans to upgrade to Solaris 9
>   ever, because it supports Alternate Streams.  The trouble of hidden
>   malware is not worth the gains.
> 
> Notable was also, that Ted repeated the last two points in several
> variations.  Not sure if I would follow his line of thought 100%, but
> he does have a point.
> 
> Jörn
-- 
KaiGai Kohei <kaigai@kaigai.gr.jp>
