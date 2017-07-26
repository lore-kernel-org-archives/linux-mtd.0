Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1daSZC-0003DU-EP
 for linux-mtd@lists.infradead.org; Wed, 26 Jul 2017 20:06:00 +0000
Subject: Re: Regarding UBI/UBIFS corruptions during random power-cuts.
To: Ritesh Harjani <riteshh@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, bhuvanchandra.dv@toradex.com
References: <c44fc096-c994-5b63-2647-1774e8406c0c@codeaurora.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <1ad7c77f-98e3-5d70-aa62-b72431000415@nod.at>
Date: Wed, 26 Jul 2017 22:05:34 +0200
MIME-Version: 1.0
In-Reply-To: <c44fc096-c994-5b63-2647-1774e8406c0c@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ritesh,

Am 25.07.2017 um 13:16 schrieb Ritesh Harjani:
> Hi Richard,
> 
> Recently we also encountered a similar problem which is discussed in this thread. This was encountered on board with kernel 3.18.
> This is happening with external power supply power cut testing.
> 
> https://patchwork.ozlabs.org/patch/719544/
> 
> Can you kindly help with what happened on this issue?
> Were we able to identify any bug in kernel for this? Since I don't have any later conversations, it will be good to know if this problem is fixed in the latest kernel or not.

Bhuvan and I are still looking into this.

> If yes, then could you please point me to the patches/discussion on this, if any.
> 
> 
> Issue logs :-
> https://pastebin.com/TL2b0ZbH

Do you see this in the same hardware?
The error you're facing is rather generic.
In our case we can reproduce the issue very reliable when we enable the UBIFS /sys/kernel/debug/ubifs/chk_fs debugfs knob.
Can you please also try? Please note that chk_fs will make mounting UBIFS very slow.

I'm very interested in your results, maybe it helps tracking down the root cause.

Thanks,
//richard
