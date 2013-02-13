Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U5ZiP-00046M-Rs
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2013 10:37:26 +0000
Message-ID: <1360751856.12703.132.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: torturetest: add the support for random data
 pattern
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Wed, 13 Feb 2013 12:37:36 +0200
In-Reply-To: <1360052485-11961-1-git-send-email-b32955@freescale.com>
References: <alpine.DEB.2.00.1302050900010.3736@lnxricardw.se.axis.com>
 <1360052485-11961-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: ricard.wanderlof@axis.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-02-05 at 16:21 +0800, Huang Shijie wrote:
> Add a new module parameter 'pattern'. The meaning of the pattern is:
>   (1) pattern == 0 for 55/AA pattern.
>   (2) pattern < 0 for random pattern.
>   (3) pattern > 0 for random pattern too, the value of the pattern is used
>       as the seed for the random generator.

Please, do not add parameters, make it simple - teach the test to use
both the old patterns plus additional cycles with random patterns.

-- 
Best Regards,
Artem Bityutskiy
