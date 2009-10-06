Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mv9IL-0003ir-T6
	for linux-mtd@lists.infradead.org; Tue, 06 Oct 2009 12:37:39 +0000
Date: Tue, 6 Oct 2009 14:37:21 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 3/3]: mtdoops: store all kernel messages in a circular
	buffer
Message-ID: <20091006143721.3daf6425@marrow.netinsight.se>
In-Reply-To: <20091002160741.6afac48b@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091002160741.6afac48b@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2 Oct 2009 16:07:41 +0200
Simon Kagstrom <simon.kagstrom@netinsight.net> wrote:

> The last messages which happens before a crash might contain interesting
> information about the crash. This patch reworks mtdoops to keep a
> circular buffer of _all_ kernel messages, not just those that are
> printed when an oops is initiated.
> 
> A handler that is called on panic is also added instead of
> mtdoops_console_sync so that panic_on_oops and true panics are stored.

I found two small bugs in this patch, so a new version is coming up.

// Simon
