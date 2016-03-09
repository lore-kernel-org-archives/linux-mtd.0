Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adavE-0000rB-1z
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 10:00:54 +0000
Date: Wed, 9 Mar 2016 11:00:30 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: Brian Norris <computersforpeace@gmail.com>, dwmw2@infradead.org,
 matthias.bgg@gmail.com, robh@kernel.org, daniel.thompson@linaro.org,
 xiaolei.li@mediatek.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/3] mtd: mediatek: driver for MTK Smart Device Gen1 NAND
Message-ID: <20160309110030.225e8f9d@bbrezillon>
In-Reply-To: <56DF3CC8.7070400@linaro.org>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160308172437.6eccce05@bbrezillon>
 <20160308181715.GJ55664@google.com> <56DF3141.9040208@linaro.org>
 <20160308202036.GL55664@google.com> <56DF3CC8.7070400@linaro.org>
MIME-Version: 1.0
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

On Tue, 8 Mar 2016 15:57:44 -0500
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> On 03/08/2016 03:20 PM, Brian Norris wrote:
> >> > If you feel strongly about it I don't mind adding an additional check after any
> >> > form of sleep (not so sure about adding it after a cpu_relax) but I don't think
> >> > it is needed.
> > It is non-negotiable that your timeout loops must be logically correct.
> > That is, you must recheck the exit condition before you declare a
> > timeout.
> 
> Hi Brian,
> 
> My point was that the current timeout loops (except one which is just
> implementing its own version of readx_poll_timeout) are logically correct as
> they are since they are not involving the scheduler: so doing the additional
> check after cpu_relax() is unnecessary - cpu_relax is a dmb instruction.
> 
> >
> > If you just follow Boris's suggestion of using the helper macros, then
> > you'll be fine.
> 
> I am sorry (not trying to be difficult here) but relaxed_poll_timeout calls
> usleep_range and involving the scheduler brings in a level of undeterminism (so
> we could have slept for 100 useconds or 1000)
> am I wrong? is under that case that we need to check after exiting the loop.
> 
> a different discussion is if using cpu_relax (busy loop) at all is a good idea:
> the way I see it, that should depend on the case but I suppose a silver bullet
> solution via the helper macros is ok too - and certainly more readable and
> easier to maintain - so will do as you suggest (correct all loops).
> 

Note that if you want to avoid sleeping between each test, you can use
readx_poll_timeout_atomic(), which are replacing usleep_range() calls
by udelay().


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
