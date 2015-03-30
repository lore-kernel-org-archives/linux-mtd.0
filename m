Received: from mail.nic.cz ([2001:1488:800:400::400])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcVBB-0003Av-Qd
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2015 08:36:19 +0000
Message-ID: <55190AEB.8010704@nic.cz>
Date: Mon, 30 Mar 2015 10:35:55 +0200
From: =?UTF-8?B?TWFydGluIFN0cmJhxI1rYQ==?= <martin.strbacka@nic.cz>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: Missing support for ECC_SOFT_BCH in fsl-elbc-nand
References: <55156575.8080704@nic.cz>
 <CAFLxGvx-nXQQzOmpJyoGw5a6U8iEM_cr61vJx9aRNu5rAbnNLg@mail.gmail.com>
In-Reply-To: <CAFLxGvx-nXQQzOmpJyoGw5a6U8iEM_cr61vJx9aRNu5rAbnNLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: Tomas Hlavacek <tomas.hlavacek@nic.cz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27.3.2015 17:02, Richard Weinberger wrote:
> On Fri, Mar 27, 2015 at 3:13 PM, Martin Strbačka <martin.strbacka@nic.cz> wrote:
>> Hello,
>>
>> in our product we have Freescale P2020 SoC together with Micron
>> MT29F2G08ABAEAWP NAND. Lately we discovered that the internal driver
>> (fsl-elbc-nand) supports only 1-bit HW ECC. So we would like to switch
>> to ECC_SOFT_BCH (or on-die ECC as I saw some patches in this list
>> recently). Do you know if anybody works on this or are there any patches
>> already?
> 
> Works on what?
> I work (obviously) on on-die ECC support.

I mean working on support ECC_SOFT_BCH or on-die ECC in fsl-elbc-nand. I
believe that fsl-elbc-nand needs some modifications to support those ECC
modes. Or am I wrong?
