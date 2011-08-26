Message-ID: <4E5712C1.4010007@freescale.com>
Date: Fri, 26 Aug 2011 11:28:01 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v8 0/4] add the GPMI-NAND support for imx23/imx28
References: <1314169643-23425-1-git-send-email-b32955@freescale.com>
	<1314272249.18988.55.camel@sauron>
In-Reply-To: <1314272249.18988.55.camel@sauron>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
	w.sang@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sascha:
> On Wed, 2011-08-24 at 15:07 +0800, Huang Shijie wrote:
>> The patch set is based on tag v3.1-rc2 of linus's tree.
>> and it can be git-am to Artem's tree:
>> 	http://git.infradead.org/users/dedekind/l2-mtd-2.6.git
>>
>> The general-purpose media interface(GPMI) controller is a flexible interface
>> to up to several NAND flashs.
>>
>> The Bose Ray-Choudhury Hocquenghem(BCH) module is a hardware ECC accelerator.
>>
>> With the help of BCH, the GPMI controller can choose to do the hardware ECC or
>> not.
> I thought that this series will go in via an imx sub-tree. If you want
> it to go via the mtd tree, we'd need blessing from the imx subtree
> maintainer, I think.
>
Could you accept this patch set? or I have to make some further changes 
about it.

Thanks.

Huang Shijie
