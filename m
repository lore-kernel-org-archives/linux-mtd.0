Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2f8Y-00066p-1w
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2013 09:48:23 +0000
Date: Tue, 5 Feb 2013 10:48:19 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2] mtd: torturetest: add the support for random data
 pattern
In-Reply-To: <1360052485-11961-1-git-send-email-b32955@freescale.com>
Message-ID: <alpine.DEB.2.00.1302051047380.3736@lnxricardw.se.axis.com>
References: <alpine.DEB.2.00.1302050900010.3736@lnxricardw.se.axis.com>
 <1360052485-11961-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
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

> Add a new module parameter 'pattern'. The meaning of the pattern is:
>  (1) pattern == 0 for 55/AA pattern.
>  (2) pattern < 0 for random pattern.
>  (3) pattern > 0 for random pattern too, the value of the pattern is used
>      as the seed for the random generator.
>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ...
> +static int pattern;
> +module_param(pattern, int, S_IRUGO);
> +MODULE_PARM_DESC(pattern, "0 for 55/AA pattern(default);"
> +			"less then 0 for random pattern;"
> +			"greater then 0 for random too, "
> +			"the value of the pattern is the seed.");
                                           ^^^^^^^^ parameter ?

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
