Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XAb22-0000WX-Mu
 for linux-mtd@lists.infradead.org; Fri, 25 Jul 2014 08:39:15 +0000
Received: by mail-pa0-f45.google.com with SMTP id eu11so5678869pac.4
 for <linux-mtd@lists.infradead.org>; Fri, 25 Jul 2014 01:38:53 -0700 (PDT)
Message-ID: <53D2174D.80909@gmail.com>
Date: Fri, 25 Jul 2014 14:07:33 +0530
From: Varka Bhadram <varkabhadram@gmail.com>
MIME-Version: 1.0
To: Martin Fuzzey <mfuzzey@parkeon.com>
Subject: Re: [PATCH] mtd: add driver for the flash in Lattice machxo2 FPGAs
References: <20140724162225.22308.66538.stgit@localhost>
 <53D1D8ED.4010209@gmail.com> <53D20F51.2090705@parkeon.com>
In-Reply-To: <53D20F51.2090705@parkeon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/25/2014 01:33 PM, Martin Fuzzey wrote:

(...)

> +
>>> +static void machxo2_lock(struct machxo2 *machxo2)
>>> +{
>>> +    if (!mutex_trylock(&machxo2->lock)) {
>>> +        dev_dbg(machxo2->dev, "wait for %s from %pf\n",
>>> +                __func__, __builtin_return_address(0));
>>> +
>>
>> dev_dbg(machxo2->dev, "wait for %s from %pf\n",
>>     __func__, __builtin_return_address(0));
>>
>
> Sorry, not understanding here.
> You want the second line to be LESS intented??
>
> Coding style (chapter 2) says:
>     Descendants are always substantially shorter than the parent and
>     are placed substantially to the right
>
> Idem for the others

this is the problem with my email client sorry.. 2nd line should start exactly
below 'm' in machxo2->dev...
  
dev_dbg(machxo2->dev, "wait for %s from %pf\n",
	__func__, __builtin_return_address(0));

>
>> +static int machxo2_transceive(
>>> +            struct machxo2 *machxo2,
>>> +            const void *send_buf, unsigned send_len,
>>> +            void *recv_buf, unsigned recv_len)
>>
(...)

>>> +struct machxo2 *machxo2_create(struct device *dev,
>>> +            struct machxo2_busops *busops);
>>> +
>>
>> struct machxo2 *machxo2_create(struct device *dev,
>>                    struct machxo2_busops *busops);
>>
>>
> Same again - is it just too much indenting?
> I don't see anything wrong here
>
same...


-- 
Regards,
Varka Bhadram.
