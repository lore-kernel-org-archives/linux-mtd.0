Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOiXg-00050t-9u
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 06:25:44 +0000
Message-ID: <524281B3.5000503@ti.com>
Date: Wed, 25 Sep 2013 11:54:51 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] drivers: mtd: m25p80: Add quad read support.
References: <1380024647-18955-1-git-send-email-sourav.poddar@ti.com>
 <52427FBF.1020106@freescale.com>
In-Reply-To: <52427FBF.1020106@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: artem.bityutskiy@linux.intel.com, balbi@ti.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 25 September 2013 11:46 AM, Huang Shijie wrote:
> 于 2013年09月24日 20:10, Sourav Poddar 写道:
>> +static int quad_enable(struct m25p *flash)
>> +{
>> +    u8 cmd[3];
>> +    cmd[0] = OPCODE_WRSR;
>> +    cmd[1] = 0x00;
>> +    cmd[2] = 0x02;
>> +
> Please use a macro here, do not use a hardcode.
OK.
>
> thanks
> Huang Shijie
>
