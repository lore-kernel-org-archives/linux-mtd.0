Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mvuid-0004yp-0f
	for linux-mtd@lists.infradead.org; Thu, 08 Oct 2009 15:15:55 +0000
Date: Thu, 8 Oct 2009 17:15:38 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
Subject: Re: [PATCH v2 0/3]: mtdoops fixes and improvements
Message-ID: <20091008171538.59989db4@marrow.netinsight.se>
In-Reply-To: <20091008164243.2344df24@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091008164243.2344df24@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd <linux-mtd@lists.infradead.org>,
	Aaro Koskinen <aaro.koskinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 Oct 2009 16:42:43 +0200
Simon Kagstrom <simon.kagstrom@netinsight.net> wrote:

> Here are a couple of patches to mtdoops which I've been working on for
> a while. They should be applied on top of Aaros fix for panic_on_oops.
> That one technically breaks building mtdoops as a module, so I sent a
> patch to LKML which exports panic_on_oops:
> 
>   http://patchwork.kernel.org/patch/52505/
> 
> The patches here are:

Argh, forgot to run checkpatch on that. I'll post a v3 which has the
checkpatch problems fixed.

Sorry about that.

// Simon
