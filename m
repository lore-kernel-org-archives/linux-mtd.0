Received: from mail-la0-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tqiwd-0004qM-KK
 for linux-mtd@lists.infradead.org; Thu, 03 Jan 2013 11:26:46 +0000
Received: by mail-la0-f49.google.com with SMTP id fk20so7712781lab.36
 for <linux-mtd@lists.infradead.org>; Thu, 03 Jan 2013 03:26:40 -0800 (PST)
Message-ID: <50E56AED.1000509@mvista.com>
Date: Thu, 03 Jan 2013 15:26:37 +0400
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: hs@denx.de
Subject: Re: [PATCH v6] ARM: mtd: nand: davinci: add OF support for davinci
 nand controller
References: <1343632944-25971-1-git-send-email-hs@denx.de>
 <50E48DFD.2030908@mvista.com> <50E52D26.9010004@denx.de>
In-Reply-To: <50E52D26.9010004@denx.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
 devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>,
 linux-mtd@lists.infradead.org, Scott Wood <scottwood@freescale.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 03-01-2013 11:03, Heiko Schocher wrote:

>>> add OF support for the davinci nand controller.

>>> Signed-off-by: Heiko Schocher<hs@denx.de>
>>> Cc: davinci-linux-open-source@linux.davincidsp.com
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: devicetree-discuss@lists.ozlabs.org
>>> Cc: linux-mtd@lists.infradead.org
>>> Cc: David Woodhouse<dwmw2@infradead.org>
>>> Cc: Grant Likely<grant.likely@secretlab.ca>
>>> Cc: Sekhar Nori<nsekhar@ti.com>
>>> Cc: Wolfgang Denk<wd@denx.de>
>>> Cc: Scott Wood<scottwood@freescale.com>

>> [...]

>>> diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
>>> index d94b03c..f386b3c 100644
>>> --- a/drivers/mtd/nand/davinci_nand.c
>>> +++ b/drivers/mtd/nand/davinci_nand.c
>> [...]
>>> @@ -518,9 +519,75 @@ static struct nand_ecclayout hwecc4_2048 __initconst = {
>>>       },
>>>   };

>>> +#if defined(CONFIG_OF)
>>> +static const struct of_device_id davinci_nand_of_match[] = {
>>> +    {.compatible = "ti,davinci-nand", },
>>> +    {},
>>> +}

>>     I have only one question: have you ever try to compile this patch with
>> CONFIG_OF enabled? If you have, you would have noticed:

>> drivers/mtd/nand/davinci_nand.c:527: error: expected ‘,’ or ‘;’ before ‘extern’

>>> +MODULE_DEVICE_TABLE(of, davinci_nand_of_match);

> Hmm.. maybe this crept in later after I sent the patches? They were
> pending for a while ... I compiled it just yet again (based on my
> tree when I posted this patch based on commit:

    I've just checked the archives: every patch version you posted had ';' 
after '}' missing.

WBR, Sergei
