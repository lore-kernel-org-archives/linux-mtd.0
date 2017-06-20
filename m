Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNFsv-0005qB-O6
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 09:55:47 +0000
Received: by mail-wr0-x22c.google.com with SMTP id y25so49392314wrd.2
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2017 02:55:25 -0700 (PDT)
Subject: Re: [PATCH v3] spi-nor: Add Winbond w25q512jv
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
References: <20170620062028.7520-1-joel@jms.id.au>
 <5e822197-9fcd-192e-82e6-310236ee50e4@gmail.com>
 <1497949706.31581.46.camel@kernel.crashing.org>
 <d9f1d30a-6ef5-6352-84fd-b5e552a75ced@gmail.com>
 <1497951924.31581.49.camel@kernel.crashing.org>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4dcc77b3-dbad-7e1e-a884-ef07a52ae336@gmail.com>
Date: Tue, 20 Jun 2017 11:55:22 +0200
MIME-Version: 1.0
In-Reply-To: <1497951924.31581.49.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/20/2017 11:45 AM, Benjamin Herrenschmidt wrote:
> On Tue, 2017-06-20 at 11:22 +0200, Marek Vasut wrote:
>> On 06/20/2017 11:08 AM, Benjamin Herrenschmidt wrote:
>>> On Tue, 2017-06-20 at 09:23 +0200, Marek Vasut wrote:
>>>> On 06/20/2017 08:20 AM, Joel Stanley wrote:
>>>>> From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>>>>
>>>>> Similar to the other ones, different size. The "JV" suffix is in
>>>>> the datasheet, I haven't seen mentions of a different one.
>>>>>
>>>>> The the datasheet indicates DUAL and QUAD are supported.
>>>>>
>>>>> http://www.winbond.com/resource-files/w25m512jv%20revc%2001062017.pdf
>>>>
>>>> The datasheet says W25M512 not W25Q512.
>>>>                       ^-----------^-------- different letter here.
>>>
>>> Page 23 mentions the "Q" version which is what we have.
>>
>> So the M means "Multiple Q dies on single package" ? Why don't you use
>> w25m in the patch then ?
> 
> Because I messed up :-) I got confused between "Q256" and "M512"...
> 
> The ID for a single W25Q256JV 0x184019 which we already have
> The ID for the dual W25Q256JV aka W25M512JV is 0x187119
> 
> Sorry for the mess.
> 
> Joel, can you respin ? I don't have my stuff at hand and I'm flying out
> tomorrow.
> 
> Thanks !

Great, thanks!

-- 
Best regards,
Marek Vasut
