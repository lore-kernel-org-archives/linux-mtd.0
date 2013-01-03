Received: from mail-la0-f46.google.com ([209.85.215.46])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tqo7S-0003eA-MS
 for linux-mtd@lists.infradead.org; Thu, 03 Jan 2013 16:58:16 +0000
Received: by mail-la0-f46.google.com with SMTP id fq13so8268705lab.19
 for <linux-mtd@lists.infradead.org>; Thu, 03 Jan 2013 08:58:12 -0800 (PST)
Message-ID: <50E5C65F.3050804@mvista.com>
Date: Thu, 03 Jan 2013 20:56:47 +0300
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v6] ARM: mtd: nand: davinci: add OF support for davinci
 nand controller
References: <1343632944-25971-1-git-send-email-hs@denx.de>
 <50E48DFD.2030908@mvista.com> <50E52D26.9010004@denx.de>
 <50E56AED.1000509@mvista.com>
 <1357212752.16197.127.camel@shinybook.infradead.org>
 <50E56DDC.8060804@mvista.com>
In-Reply-To: <50E56DDC.8060804@mvista.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
 devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>,
 linux-mtd@lists.infradead.org, Scott Wood <scottwood@freescale.com>,
 hs@denx.de, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 01/03/2013 02:39 PM, Sergei Shtylyov wrote:

>>>>>> +#if defined(CONFIG_OF)
>>>>>> +static const struct of_device_id davinci_nand_of_match[] = {
>>>>>> +    {.compatible = "ti,davinci-nand", },
>>>>>> +    {},
>>>>>> +}
>>>>>> +MODULE_DEVICE_TABLE(of, davinci_nand_of_match);

>>>> Hmm.. maybe this crept in later after I sent the patches? They were
>>>> pending for a while ... I compiled it just yet again (based on my
>>>> tree when I posted this patch based on commit:

>>>      I've just checked the archives: every patch version you posted had ';'
>>> after '}' missing.

>> If it was built-in, rather than as a module, then MODULE_DEVICE_TABLE(…)
>> expands to nothing, and the structure gets to use the semicolon from the
>> end of that line.

>    Ah, that explains it: 'davinci_all_defconfig' has CONFIG_MTD_NAND_DAVINCI=m,
> so that's how the error got triggered at last. Probably worth adding this
> explanation to the changelog, how do you think?

   OK, I take your silence as a sign of consent. Changelog indeed needs to be
rewritten a bit now.

WBR, Sergei
