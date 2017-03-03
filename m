Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjiNu-0000RN-K2
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 08:16:20 +0000
Subject: Re: [BUG?] ubi.fm_autoconvert=1 on first boot
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20161125113412.3ozyc7bjjecjahnb@pengutronix.de>
 <4d53ffff-a294-8238-bab1-004416e8d7be@nod.at>
 <20161125135152.f4npajnz5x76f5x7@pengutronix.de>
 <6708b0f4-63e4-663f-794a-13b95f38a928@nod.at>
 <20170228145045.jlutsmkbrzrq4zam@pengutronix.de>
 <20170301094243.4x6nivi55wy5qiqi@pengutronix.de>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <036b186e-45e8-8b32-d594-845617c29052@nod.at>
Date: Fri, 3 Mar 2017 09:15:55 +0100
MIME-Version: 1.0
In-Reply-To: <20170301094243.4x6nivi55wy5qiqi@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sascha,

Am 01.03.2017 um 10:42 schrieb Sascha Hauer:
>> The patch works.
> 
> Hm, this patch works on mainline, but not on my 3.10 Frankenkernel. I
> wonder if there's anything in mainline that makes sure that the wearlevel
> worker has actually produced free PEBs before they are needed?

So it works every tine on mainline but never on 3.10?
Just trying to make sure that it is not a timing issue.

In 3.10 Fastmap was very buggy and saw in later kernels many fixes,
did you backport all of them? Sadly in the early days of Fastmap
we did not mark patches for stable because it was experimental.
...which was a major error on our side.
In doubt you can backport the whole UBI subsystem.
This is rather easy because it has not much dependencies and does not change
that fast.

Thanks,
//richard
