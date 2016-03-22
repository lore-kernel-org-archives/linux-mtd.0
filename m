Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiMwZ-00014V-Re
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2016 14:06:00 +0000
Date: Tue, 22 Mar 2016 15:05:37 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Archit Taneja <architt@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, cernekee@gmail.com, sboyd@codeaurora.org,
 linux-mtd@lists.infradead.org, dehrenberg@google.com,
 andy.gross@linaro.org, computersforpeace@gmail.com
Subject: Re: [PATCH v8 2/3] mtd: nand: Qualcomm NAND controller driver
Message-ID: <20160322150537.7cc394ca@bbrezillon>
In-Reply-To: <56F14457.4010606@codeaurora.org>
References: <1453360399-32029-1-git-send-email-architt@codeaurora.org>
 <1454489991-14717-1-git-send-email-architt@codeaurora.org>
 <1454489991-14717-3-git-send-email-architt@codeaurora.org>
 <20160318164904.45a77338@bbrezillon>
 <20160318174817.0f47ac20@bbrezillon>
 <56ED269B.5020102@codeaurora.org>
 <20160319113413.1f0f3e5f@bbrezillon>
 <56F14457.4010606@codeaurora.org>
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

On Tue, 22 Mar 2016 18:40:47 +0530
Archit Taneja <architt@codeaurora.org> wrote:
> >> Is this something that's blocking your mtd_ooblayout_ops work?
> >
> > Nope, I think I got it right, but maybe you can check/test it.
> > Here is my branch containing the whole rework [1], and here are
> > the qcom relate patches[2][3].
> 
> They look good to me. I tried out your branch and I see correct
> behavior. Thanks for the patches.
> 
> Tested-by: Archit Taneja <architt@codeaurora.org>

Thanks for testing.

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
