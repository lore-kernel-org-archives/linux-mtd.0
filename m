Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqzs2-0006x9-IL
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 08:44:44 +0000
Subject: Re: [PATCH v3 18/27] mtd: nand: omap2: Implement NAND ready using
 gpiolib
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
 <1442588029-13769-19-git-send-email-rogerq@ti.com>
 <20151026204900.GI13239@google.com> <562F2FB6.7050806@ti.com>
 <20151027091235.03dba8c5@bbrezillon>
CC: Brian Norris <computersforpeace@gmail.com>, <tony@atomide.com>,
 <dwmw2@infradead.org>, <ezequiel@vanguardiasur.com.ar>,
 <javier@dowhile0.org>, <fcooper@ti.com>, <nsekhar@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Alex Smith
 <alex.smith@imgtec.com>, Harvey Hunt <harvey.hunt@imgtec.com>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <562F393C.1030701@ti.com>
Date: Tue, 27 Oct 2015 10:43:40 +0200
MIME-Version: 1.0
In-Reply-To: <20151027091235.03dba8c5@bbrezillon>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

On 27/10/15 10:12, Boris Brezillon wrote:
> Hi Roger,
> 
> On Tue, 27 Oct 2015 10:03:02 +0200
> Roger Quadros <rogerq@ti.com> wrote:
> 
>> On 26/10/15 22:49, Brian Norris wrote:
>>>
>>> Others have been looking at using GPIOs for the ready/busy pin too. At a
>>> minimum, we need an updated DT binding doc for this, since I see you're
>>> adding this via device tree in a later patch (I don't see any DT binding
>>> patch for this; but I could just be overlooking it). It'd also be great
>>> if this support was moved to nand_dt_init() so other platforms can
>>> benefit, but I won't require that.
>>>
>>> Also, previous [0] proposers had suggested 'rb-gpios', not 'ready-gpio'
>>> (the hardware docs typically call it 'rb' for ready/busy, FWIW). I don't
>>> really care, but the name should be going into a doc, so we can choose
>>> the same one everywhere.
>>>
>>> EDIT: looks like the discussion was partly here [1] and it seems we're
>>> landing on "rb-gpios" in the latest version [2]. Can we stick with that?
>>
>> Why should it be "rb-gpios" and not "rb-gpio"?
>> I don't think there are multiple gpios for r/b# function.
> 
> Because it's supposed to be a generic binding, and some NAND chips
> embed several dies, thus exposing several CS and RB pins, hence the
> rb-gpios name.
> Also, as described here [1], the convention is to name your property
> <name>-gpios even if you only need one gpio.

Makes sense now. Thanks for the explanation.
I'll update this patch to use rb-gpios and update the binding doc as well.

--
cheers,
-roger
