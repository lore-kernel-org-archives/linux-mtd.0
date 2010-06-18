MIME-Version: 1.0
In-Reply-To: <AANLkTinNqtnL3LRFsPuUQXcTnRda0_B059bRLGlJuzlh@mail.gmail.com>
References: <AANLkTilhattkx7AiyG-R4zbWSZ3-qkPIM6VhyFW4lk4D@mail.gmail.com>
	<AANLkTinNqtnL3LRFsPuUQXcTnRda0_B059bRLGlJuzlh@mail.gmail.com>
Date: Fri, 18 Jun 2010 16:51:30 +0800
Message-ID: <AANLkTikqhHK2snjdEb1jDURueQm5WclZ3xnGNsgew08X@mail.gmail.com>
Subject: Re: [PATCH 06/25] pxa3xx_nand: unify prepare command
From: Lei Wen <adrian.wenl@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <david.woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 18, 2010 at 2:52 PM, Eric Miao <eric.y.miao@gmail.com> wrote:
> On Fri, Jun 18, 2010 at 1:34 PM, Haojian Zhuang
> <haojian.zhuang@gmail.com> wrote:
>> From ac05ddc3c13d2b80b243e91cba9922572841f34a Mon Sep 17 00:00:00 2001
>> From: Lei Wen <leiwen@marvell.com>
>> Date: Mon, 22 Mar 2010 12:04:22 +0800
>> Subject: [PATCH 06/25] pxa3xx_nand: unify prepare command
>>
>> Make the interface simpler which could make both debug
>> and enhancement easier.
>
> What is the benefit of combining them into one big several pages lengthy
> function? I dislike lengthy function :-/

The reason why I combine those function is to make a common patch for
all command to quick
identify error during driver development and make code more robust...
Another reason is to share some common setting for different command,
and make code more concise.
