Received: from 4.mo3.mail-out.ovh.net ([178.33.46.10]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WB2w2-0003Rg-Ac
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2014 13:54:40 +0000
Received: from mail628.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id 06FBAFFB3EE
 for <linux-mtd@lists.infradead.org>; Wed,  5 Feb 2014 14:54:13 +0100 (CET)
Message-ID: <52F24255.9030603@overkiz.com>
Date: Wed, 05 Feb 2014 14:53:25 +0100
From: Boris BREZILLON <b.brezillon@overkiz.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC PATCH 1/9] mtd: nand: retrieve ECC requirements from Hynix
 READ ID byte 4
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
 <1389190924-26226-2-git-send-email-b.brezillon@overkiz.com>
 <20140123014906.GY8919@ld-irv-0074>
In-Reply-To: <20140123014906.GY8919@ld-irv-0074>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>,
 linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

On 23/01/2014 02:49, Brian Norris wrote:
> + Huang
>
> Hi Boris,
>
> On Wed, Jan 08, 2014 at 03:21:56PM +0100, Boris BREZILLON wrote:
>> The Hynix nand flashes store their ECC requirements in byte 4 of its id
>> (returned on READ ID command).
>>
>> Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
> I haven't verified yet (perhaps Huang can confirm?), but this may be
> similar to a patch Huang submitted recently. In his case, we found that
> this table is actually quite unreliable and is likely hard to maintain.

Indeed (as stated in this thread 
http://comments.gmane.org/gmane.linux.drivers.mtd/50252).
I'll remove this patch from the next version of this series and make use 
of the
nand-ecc-strength /nand-ecc-size DT properties instead.

Thanks.

Best Regards,

Boris
>
> Why do you need this ECC information, for my reference?
>
> Brian
