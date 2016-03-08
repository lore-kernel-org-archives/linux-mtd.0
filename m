Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adNw9-0005RD-D1
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 20:08:58 +0000
Received: by mail-qk0-x22d.google.com with SMTP id s5so11058754qkd.0
 for <linux-mtd@lists.infradead.org>; Tue, 08 Mar 2016 12:08:36 -0800 (PST)
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 2/3] mtd: mediatek: driver for MTK Smart Device Gen1 NAND
To: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160308172437.6eccce05@bbrezillon> <20160308181715.GJ55664@google.com>
Cc: dwmw2@infradead.org, matthias.bgg@gmail.com, robh@kernel.org,
 daniel.thompson@linaro.org, xiaolei.li@mediatek.com,
 linux-mtd@lists.infradead.org
Message-ID: <56DF3141.9040208@linaro.org>
Date: Tue, 8 Mar 2016 15:08:33 -0500
MIME-Version: 1.0
In-Reply-To: <20160308181715.GJ55664@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/08/2016 01:17 PM, Brian Norris wrote:
>> > You may want to use readl_relaxed_poll_timeout() (even though there's
>> > no way to specify a range).
>> > This comment applies to all the places where you're implementing this
>> > kind of loop.
> What's more, this timeout loop (and probably many of the others) is
> wrong. You need to do one last status check before declaring a timeout,
> since the device may become ready while you're sleeping. It's the same
> problem as we've resolved here:
>
> http://git.infradead.org/l2-mtd.git/commitdiff/9ebfdf5b18493f338237ef9861a555c2f79b0c17
> Subject: "mtd: nand: check status before reporting timeout"

I don't think it is quite the same scenario: in the case that you are describing
the wait is actually rescheduling and yes, that could kick the process out of
the CPU for a while (in the millisecond range).

In this driver however, we are either sleeping for a bounded amount of time (+/-
a margin) in microseconds OR  calling cpu_relax() which is just a memory barrier
in arm.
In the former case, I agree that sleeping for a microsecond range (since there
is not a guaranteed maximum jitter in theory) could go wild but that is highly
unlikely.

If you feel strongly about it I don't mind adding an additional check after any
form of sleep (not so sure about adding it after a cpu_relax) but I don't think
it is needed.
