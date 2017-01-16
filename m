Received: from 15.mo5.mail-out.ovh.net ([178.33.107.29])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT8S2-0004nN-2x
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 14:40:06 +0000
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 3FF466C8EB
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 15:39:34 +0100 (CET)
Subject: Re: [PATCH 2/3] dt-bindings: mtd: add a common label property to all
 mtd devices
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1484573225-19095-1-git-send-email-clg@kaod.org>
 <1484573225-19095-3-git-send-email-clg@kaod.org>
 <20170116145258.17707912@bbrezillon>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ab3d2687-c356-7e79-3a26-706181bdc9f5@kaod.org>
Date: Mon, 16 Jan 2017 15:39:23 +0100
MIME-Version: 1.0
In-Reply-To: <20170116145258.17707912@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/16/2017 02:52 PM, Boris Brezillon wrote:
> On Mon, 16 Jan 2017 14:27:04 +0100
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> This can be used to easily identify a specific chip on a system with
>> multiple chips.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  Documentation/devicetree/bindings/mtd/common.txt | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/common.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/common.txt b/Documentation/devicetree/bindings/mtd/common.txt
>> new file mode 100644
>> index 000000000000..a781641a3b00
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/common.txt
>> @@ -0,0 +1,12 @@
>> +* Common properties of all MTD devices
>> +
>> +Optional properties:
>> +- label : name to assign to mtd. If omitted, the label is the MTD device name.
> 
> Hm, the description is not really clear. How about:
> 
> "
> - label: user-defined MTD device name. Can be used to assign user
>   friendly names to MTD devices (instead of the flash model or flash
>   controller based name) in order to ease flash device identification
>   and/or describe what they are used for.
> "

yes. I will use that in a v2.
 
Thanks,

C. 

> Otherwise,
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Thanks,
> 
> Boris
> 
>> +
>> +Example:
>> +
>> +	flash@0 {
>> +		label = "System-firmware";
>> +
>> +		/* flash type specific properties */
>> +	};
> 
