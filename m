Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMxdh-0008J6-MN
 for linux-mtd@lists.infradead.org; Thu, 07 Dec 2017 14:59:13 +0000
Subject: Re: [RFC 03/10] mtd: spi-nor: Configure read latency for read commands
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
References: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <1512548141-3319-4-git-send-email-prabhakar.kushwaha@nxp.com>
 <1f97ee81-a027-c5cf-04a4-cb29bc6a7ba4@wedev4u.fr>
 <HE1PR04MB12417B07F03276B164F2DF4C97330@HE1PR04MB1241.eurprd04.prod.outlook.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <ccd284d2-d3a3-4bb1-3cc0-1f5a41d670b3@wedev4u.fr>
Date: Thu, 7 Dec 2017 15:58:31 +0100
MIME-Version: 1.0
In-Reply-To: <HE1PR04MB12417B07F03276B164F2DF4C97330@HE1PR04MB1241.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 07/12/2017 à 10:03, Prabhakar Kushwaha a écrit :
> Hi Cyrille,
> 
>> -----Original Message-----
>> From: Cyrille Pitchen [mailto:cyrille.pitchen@wedev4u.fr]
>> Sent: Wednesday, December 06, 2017 4:16 PM
>> To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>; linux-
>> mtd@lists.infradead.org
>> Cc: boris.brezillon@free-electrons.com; computersforpeace@gmail.com;
>> dedekind1@gmail.com
>> Subject: Re: [RFC 03/10] mtd: spi-nor: Configure read latency for read commands
>>
>> Hi Prabhakar,
>>
>> Le 06/12/2017 à 09:15, Prabhakar Kushwaha a écrit :
>>> All read commands have read latency (dummy cycle). It defines a
>>> period between the end of address or mode and the beginning of
>>> read data returning to the host. Flashes have default read latency.
>>> This default read latency may not match with the selected latency.
>>>
>>
>> The read latency is either hard-coded (0 mode cycles and 8 wait-states)
>> for Fast Read 1-1-z operations or read from the Basic Flash Parameter
>> Table programmed as one mandatory table of the JEDEC JESD126B
>> specification when SFDP tables are supported by the memory parts.
>>
>> In all cases, those values are factory settings. I don't understand why
>> there would be a mismatch between the default read latency and the
>> selected latency if any boot-loader or flash programming tool has ever
>> changed the memory settings.
>>
>> Could you please explain in which case you found a mismatch ?
>>
> If we only talk about 1-1-z than yes. The Default value is always "0/8". 
> 
> This mismatch start to come when we see 1-2-2 or 1-4-4 read protocols.
> For eg. S25FL128S/S25FL256S default dummy latency is 00. Which is 4 for  1-2-2 or 1-4-4.
>

If the memory is still configured to use its factory settings, for instance
latency code 00 for Spansion memories, and if this memory is complient with
the JEDEC JESD216 speficition, then we read from the Basic Flash Parameter
Table (BFPT), the only always mandatory SFDP table, to retrieve the number
of mode cycles and wait-states to be used with Fast Read 1-2-2 and 1-4-4:

- Fast Read 1-2-2 settings are written in the 4th DWORD of the BFPT.
- Fast Read 1-4-4 settings are written in the 3rd DWORD of the BFPT.

Please refer to the JESD216 specification and to the sfdp_bfpt_reads[]
array.

Hence, as long as you don't change the latency code of your Spansion memory
and keep it in its factory state, a proper value is set in nor->read_dummy
based on what have been read from the SFDP table (BFPT).

You should not have any mismatch between what was set in nor->read_dummy
and what you memory expects.
 
> I saw your review comments of using SFDP for 1-2-2 and 1-4-4. 
> Let me explore this path if we really require this patch..
> 
> Thanks for guidance!!
> 
> --pk
> 
> 
> 
> 
