Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmBSs-0002s0-DG
 for linux-mtd@lists.infradead.org; Fri, 10 Mar 2017 03:43:41 +0000
Received: by mail-wm0-x244.google.com with SMTP id v190so314871wme.3
 for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2017 19:43:16 -0800 (PST)
Subject: Re: [PATCH v3] mtd: spi-nor: Add support for N25Q256A13
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>,
 linux-mtd@lists.infradead.org
References: <1488422554-7644-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
 <a6888235-c6be-53f3-7787-7fafcb56b8b4@wedev4u.fr>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Jagan Teki <jagan@openedev.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d095f785-e092-c474-44f8-e6776c7b8caf@gmail.com>
Date: Fri, 10 Mar 2017 04:19:14 +0100
MIME-Version: 1.0
In-Reply-To: <a6888235-c6be-53f3-7787-7fafcb56b8b4@wedev4u.fr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/07/2017 11:11 PM, Cyrille Pitchen wrote:
> Hi Nobuhiro,
> 
> Le 02/03/2017 à 03:42, Nobuhiro Iwamatsu a écrit :
>> Add new Micron N25Q256A (N25Q256A13) 256Mbit NOR Flash in the list
>                             ^
> You mean N25Q256A11, don't you? Otherwise it's not consistent with the
> actual patch!
> 
>> of supported devices. This chip has the same structure as the N25Q256A
>> but ID and voltage (1V8) to use is different. Therefore, this adds
>> N25Q256A13 as n25q256ax1.
> 
>   ^
> N25Q256A11 as n25q256ax1
> 
>>
>> In the future, for new Micron memories we could use the patterns
>> "n25q*ax1" for 1V8 and "n25q*ax3" for 3V3 memories.
>>
> 
> Sound like a good idea :)
> Marek, do you agree with that?

How would that work ?

-- 
Best regards,
Marek Vasut
