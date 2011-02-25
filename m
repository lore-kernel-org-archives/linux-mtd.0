Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Psv2A-0002mx-Cd
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 10:36:27 +0000
Received: by wwb29 with SMTP id 29so1325494wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 02:36:24 -0800 (PST)
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
Date: Fri, 25 Feb 2011 12:35:02 +0200
Message-ID: <1298630102.2798.40.camel@localhost>
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
> 
> BTW: I've heard the idea about making MTD partitions also a mandatory
> functionality of MTD subsystem. If I make such patches, will stand a chance
> to be accepted, or it's still better to keep MTD parts an option?

Yeah, it is obvious that CONFIG_MTD_PARTITIONS is a problem:

[dedekind@eru linux-2.6 (master)]$ grep -r CONFIG_MTD_PARTITIONS drivers/mtd/* | wc -l
128

If you could clean this up, that would be great!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
