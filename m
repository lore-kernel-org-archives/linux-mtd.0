Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1My5Wz-0005qx-0g
	for linux-mtd@lists.infradead.org; Wed, 14 Oct 2009 15:12:54 +0000
Date: Wed, 14 Oct 2009 17:12:40 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v6 5/5]: mtdoops: refactor as a kmsg_dumper
Message-ID: <20091014171240.49d0963f@marrow.netinsight.se>
In-Reply-To: <20091014154124.5d9c366e@marrow.netinsight.se>
References: <20091012113758.GB11035@elte.hu>
	<20091012140149.6789efab@marrow.netinsight.se>
	<20091012120951.GA16799@elte.hu>
	<1255349748.10605.13.camel@macbook.infradead.org>
	<20091012122023.GA19365@elte.hu>
	<20091012150650.51a4b4dc@marrow.netinsight.se>
	<20091012131528.GC25464@elte.hu>
	<20091012153937.0dcd73e5@marrow.netinsight.se>
	<alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
	<20091012110954.67d7d8d8.akpm@linux-foundation.org>
	<20091012182346.GH17138@elte.hu>
	<alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
	<20091014153458.05e31db6@marrow.netinsight.se>
	<20091014154124.5d9c366e@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>, "Koskinen Aaro
	\(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	Ingo Molnar <mingo@elte.hu>, David Woodhouse <dwmw2@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 14 Oct 2009 15:41:24 +0200
Simon Kagstrom <simon.kagstrom@netinsight.net> wrote:

> -static void __exit mtdoops_console_exit(void)
> +static void __exit mtdoops_exit(void)
>  {
>  	struct mtdoops_context *cxt = &oops_cxt;
>  
>  	unregister_mtd_user(&mtdoops_notifier);
> -	unregister_console(&mtdoops_console);
>  	kfree(cxt->name);

The kfree should go as well since cxt->name is no longer allocated. I'll
await further comments and send a new patch tomorrow.

// Simon
