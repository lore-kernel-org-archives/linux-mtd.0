Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsuZ1-0002fM-7i
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 10:06:19 +0000
Received: by vxd2 with SMTP id 2so1319207vxd.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 02:06:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1298623638.2798.11.camel@localhost>
References: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
	<201101121425.49587.sr@denx.de>
	<AANLkTi=TP7T-vt_vgacRPOgGWvhHPqKkEggQNDmPDkY3@mail.gmail.com>
	<1298623638.2798.11.camel@localhost>
Date: Fri, 25 Feb 2011 13:05:39 +0300
Message-ID: <AANLkTi=euRE_EsBRrSOsOtNysPT0MpOXQKM-LZ6-07LC@mail.gmail.com>
Subject: Re: [PATCH 1/5] MTD: make MTD_CONCAT support mandatory
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/25/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2011-02-15 at 17:07 +0300, Dmitry Eremin-Solenikov wrote:
>> What about this series? Will it find it's way to kernel or should I do
>> some more steps?
>
> They still sit in my l2-mtd-2.6.git tree. You are not expected to do
> anything, David should look at them an pick them (or reject with an
> e-mail explaining the reasons) later. Usually he does this closer to the
> merge window.

Fine, thank you for the explanation. I was just asking because I did not
know the process behind MTD subsystem.

BTW: I've heard the idea about making MTD partitions also a mandatory
functionality of MTD subsystem. If I make such patches, will stand a chance
to be accepted, or it's still better to keep MTD parts an option?

-- 
With best wishes
Dmitry
