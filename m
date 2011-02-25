Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsujN-0002is-Hc
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 10:17:02 +0000
Received: by wwb29 with SMTP id 29so1314074wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 02:16:59 -0800 (PST)
Subject: Re: [PATCH 1/5] MTD: make MTD_CONCAT support mandatory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <AANLkTi=euRE_EsBRrSOsOtNysPT0MpOXQKM-LZ6-07LC@mail.gmail.com>
References: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
	<201101121425.49587.sr@denx.de>
	<AANLkTi=TP7T-vt_vgacRPOgGWvhHPqKkEggQNDmPDkY3@mail.gmail.com>
	<1298623638.2798.11.camel@localhost>
	<AANLkTi=euRE_EsBRrSOsOtNysPT0MpOXQKM-LZ6-07LC@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 12:15:37 +0200
Message-ID: <1298628937.2798.28.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-25 at 13:05 +0300, Dmitry Eremin-Solenikov wrote:
> On 2/25/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Tue, 2011-02-15 at 17:07 +0300, Dmitry Eremin-Solenikov wrote:
> >> What about this series? Will it find it's way to kernel or should I do
> >> some more steps?
> >
> > They still sit in my l2-mtd-2.6.git tree. You are not expected to do
> > anything, David should look at them an pick them (or reject with an
> > e-mail explaining the reasons) later. Usually he does this closer to the
> > merge window.
> 
> Fine, thank you for the explanation. I was just asking because I did not
> know the process behind MTD subsystem.

It should probably be documented. But how it works is that there is
David who is the maintainer. But he is very busy. And there is me who
helps him. I collect patches in my l2 tree. I review those I can and put
my signed-off-by or some other tag. I do not review all patches, and
those I did not review do not have my signed-off-by.

Then at some point David takes a look at my tree and takes patches from
there. If there are patches he dislikes, he usually replies with a
comment and does not take the patch.

So, in your case, the patches are still waiting for his attention. In
the worst case, he picks patches from my tree when the merge window
opens.

> BTW: I've heard the idea about making MTD partitions also a mandatory
> functionality of MTD subsystem. If I make such patches, will stand a chance
> to be accepted, or it's still better to keep MTD parts an option?

In my humble opinion which I think was supported by other people - yes,
the config option is useless and only contributes to mess. I personally
believe we need to kill this.

And I just asked David, he does not mind.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
