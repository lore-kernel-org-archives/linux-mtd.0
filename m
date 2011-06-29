Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbocJ-0004u0-BG
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 06:51:20 +0000
Received: by pvg20 with SMTP id 20so681057pvg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 23:51:10 -0700 (PDT)
Subject: Re: [PATCH] UBI: new module ubiblk: block layer on top of UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Wagner <david.wagner@free-electrons.com>
Date: Wed, 29 Jun 2011 09:52:01 +0300
In-Reply-To: <4E09BC89.40306@free-electrons.com>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1308922482-14967-2-git-send-email-david.wagner@free-electrons.com>
	<1309202771.24805.11.camel@koala> <4E09BC89.40306@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309330325.23597.123.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-28 at 13:35 +0200, David Wagner wrote:
> Hi,
> 
> On 06/27/2011 09:26 PM, Artem Bityutskiy wrote:
> > On Fri, 2011-06-24 at 15:34 +0200, david.wagner@free-electrons.com
> > wrote:
> >> +	/* Stolen from mtd_blkdevs.c */
> >> +	/* Create processing thread */
> >> +	dev->thread = kthread_run(ubi_ubiblk_thread, dev, "%s%d_%d",
> >> +				  "kubiblkd", dev->ubi_num, dev->vol_id);
> >> +	if (IS_ERR(dev->thread)) {
> >> +		ret = PTR_ERR(dev->thread);
> >> +		goto out_thread;
> >> +	}
> > 
> > Why we need a kernel thread? Could you please describe when exactly it
> > is needed and why we cannot avoid having it?
> 
> Do you mean that there could be another/better way ?

No, I just do not understand why it is there. I think this is juts block
layer's design, but I wanted you to explain this - the design, how block
requests are handled, and where exactly the thread is needed. I expected
you just have the explanation.

-- 
Best Regards,
Artem Bityutskiy
