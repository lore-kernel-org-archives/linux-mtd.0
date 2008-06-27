Received: from rs35.luxsci.com ([66.216.127.90])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KC4wS-0001v9-2G
	for linux-mtd@lists.infradead.org; Fri, 27 Jun 2008 03:48:08 +0000
Message-ID: <486462F1.9080602@firmworks.com>
Date: Thu, 26 Jun 2008 17:48:01 -1000
From: Mitch Bradley <wmb@firmworks.com>
MIME-Version: 1.0
To: Mitch Bradley <wmb@firmworks.com>, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Support NAND partitions >4GiB with Open Firmware
References: <48642B50.9060607@firmworks.com>
	<20080627032046.GH17621@yookeroo.seuss>
	<48645E6A.6020202@firmworks.com>
	<20080627033817.GJ17621@yookeroo.seuss>
In-Reply-To: <20080627033817.GJ17621@yookeroo.seuss>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



David Gibson wrote:
> On Thu, Jun 26, 2008 at 05:28:42PM -1000, Mitch Bradley wrote:
>   
>> David Gibson wrote:
>>     
>>> On Thu, Jun 26, 2008 at 01:50:40PM -1000, Mitch Bradley wrote:
>>>       
> [snip]
>   
>>>> +               const u_int32_t *propval;
>>>> +               u_int32_t addrcells = 0, sizecells = 0;
>>>>                int len;
>>>>
>>>> -               reg = of_get_property(pp, "reg", &len);
>>>> -               if (!reg || (len != 2 * sizeof(u32))) {
>>>> +               /*
>>>> +                * Determine the layout of a "reg" entry based on the parent
>>>> +                * node's properties, if it hasn't been done already.
>>>> +                */
>>>> +
>>>> +               if (addrcells == 0)
>>>>     
>>>>         
>>> Redundant 'if'; you've just initialized this variable to zero.
>>>       
>> The intention is that the body of the "if" should only be executed
>> once during the loop, since the parent node is the same for all
>> children.
>>     
>
> But the initialization is within the loop body as well, so this won't
> do it.  Just factor the code getting addr and size cells right out of
> the loop, instead.
>
>   

Hmmm.  Perhaps it's better to move the declaration of the variables out of
the loop instead.

Moving the of_n_*_cells() calls outside the loop requires redundant calls
to of_get_child() and of_node_put(), because of_n_*_cells() implicitly
reach up to the parent node.  That is almost certainly more expensive 
than the "if".
