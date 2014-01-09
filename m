Received: from 11.mo3.mail-out.ovh.net ([87.98.184.158]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1B73-00057e-Gk
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2014 08:37:14 +0000
Received: from mail408.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id 33BB2FFB35F
 for <linux-mtd@lists.infradead.org>; Thu,  9 Jan 2014 09:36:52 +0100 (CET)
Message-ID: <52CE5F82.6070802@overkiz.com>
Date: Thu, 09 Jan 2014 09:36:18 +0100
From: boris brezillon <b.brezillon@overkiz.com>
MIME-Version: 1.0
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [RFC PATCH 3/9] of: mtd: add NAND timings retrieval support
References: <1389190924-26226-1-git-send-email-b.brezillon@overkiz.com>
 <1389190924-26226-4-git-send-email-b.brezillon@overkiz.com>
 <20140108183418.GA12358@obsidianresearch.com> <52CDA032.3010804@overkiz.com>
 <20140108191339.GB12358@obsidianresearch.com>
In-Reply-To: <20140108191339.GB12358@obsidianresearch.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>,
 linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Rob Landley <rob@landley.net>,
 Grant Likely <grant.likely@linaro.org>,
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

On 08/01/2014 20:13, Jason Gunthorpe wrote:
> On Wed, Jan 08, 2014 at 08:00:02PM +0100, boris brezillon wrote:
>> Hello Jason,
>>
>> Le 08/01/2014 19:34, Jason Gunthorpe a ?crit :
>>> On Wed, Jan 08, 2014 at 03:21:58PM +0100, Boris BREZILLON wrote:
>>>
>>>> +int of_get_nand_timings(struct device_node *np, struct nand_timings *timings)
>>>> +{
>>>> +	memset(timings, 0, sizeof(*timings));
>>>> +	of_property_read_u32(np, "tCLS-min", &timings->tCLS_min);
>>>> +	of_property_read_u32(np, "tCLH-min", &timings->tCLH_min);
>>>> +	of_property_read_u32(np, "tCS-min", &timings->tCS_min);
>>> [..]
>>>
>>> A while ago when discussing another controller it was pointed out
>>> these values are all auto-probable directly from the NAND via a ONFI
>>> defined GET FEATURE @0x01 query, and adding these timings to the DT
>>> was NAK'd..
>>>
>>> Basically you set the interface to the slowest ONFI timing mode, do
>>> the GET FEATURE to the NAND chip and then increase the interface speed
>>> to the highest mutually supported ONFI mode.
>>> Is there some reason you need to encode this in the DT?
>> What if the NAND does not support the ONFI interface (and this is
>> exactly the case for the NAND available on the cubietruck board:
>> H27UCG8T2ATR).
> Sounds like a good reason to me!
>
> You might want to check if you can boil down the DT timings from the
> huge list to just an ONFI mode number..

Sure, but the sunxi driver needs at least 19 of them...

>
> I'd echo Rob's comments, the property needs to include the units
> in the name, and I strongly recommend picoseconds for these
> values.

Agreed, picosecond is a more future-proof unit.

>
> Also, you might want to check that the ONFI names for these parameters
> are used, not a vendor specific name to try and avoid confusion.

I'll check it.

Thanks.

Best Regards,

Boris

>
> Jason
