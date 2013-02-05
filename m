Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2dWx-0007x1-AI
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2013 08:05:28 +0000
Date: Tue, 5 Feb 2013 09:05:18 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 2/2] mtd: torturetest: add the support for random data
 pattern
In-Reply-To: <1360030820-21491-2-git-send-email-b32955@freescale.com>
Message-ID: <alpine.DEB.2.00.1302050900010.3736@lnxricardw.se.axis.com>
References: <1360030820-21491-1-git-send-email-b32955@freescale.com>
 <1360030820-21491-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 5 Feb 2013, Huang Shijie wrote:

> Add a new module parameter 'pattern'. If it is set to zero, we will use 
> the 55/AA pattern to torture the nand blocks; if it is set to a non-zero 
> value, we will use the random data pattern.

Not a big issue in any way, but if you're using a numeric parameter value 
anyway, could not one use a range of the permissable values to set a seed 
for the random generation, so that the test can be repeated with the same 
set of random numbers?

Something like

0 => 55/AA
-1 => random
1 and up => random, specifying seed for random number generator.

> +MODULE_PARM_DESC(pattern, "0 for 55/AA pattern(default), else for
> +				the random pattern");

I'd suggest something like "0 for 55/AA pattern (default), non-zero for 
random pattern".

(Or "-1 for 55/AA pattern (default), else random; >=1 sets seed" if 
changed according to the above).

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
