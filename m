Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ7k9-0004WU-JY
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 05:41:30 +0000
Received: by lagz9 with SMTP id z9so37893333lag.3
 for <linux-mtd@lists.infradead.org>; Thu, 13 Aug 2015 22:41:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150813232447.GJ60523@google.com>
References: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
 <1439505965-134748-2-git-send-email-computersforpeace@gmail.com>
 <201508140109.14149.marex@denx.de> <20150813232447.GJ60523@google.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 14 Aug 2015 07:40:27 +0200
Message-ID: <CAOMqctS-CNu6By1b+s4yEPzgOy3gbtCYuwvET9sRrCnt8Azvhw@mail.gmail.com>
Subject: Re: [RFT PATCH 1/4] mtd: fsl-quadspi: use automatic spi-nor detection
To: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Joachim Eastwood <manabian@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Han Xu <han.xu@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14 August 2015 at 01:24, Brian Norris <computersforpeace@gmail.com> wrote:
> On Fri, Aug 14, 2015 at 01:09:14AM +0200, Marek Vasut wrote:
>> This is something I don't quite understand. So we have a SPI NOR controller,
>> which as it's own struct device instance.
>
> Right.
>
>> This controller can have multiple SPI NORs on it. Each SPI NOR has it's own
>> struct spi_nor instance and struct mtd_info instance, right?
>
> Right.
>
>> But, all of the SPI NORs share the same struct device as the controller. Do
>> I understand that correctly ?
>
> Mostly yes. But your next statement doesn't quite follow in my mind, so
> maybe you've missed something.
>
> There is typically a single platform device (and associated struct
> device) that represents the fsl-quadspi controller.
>
> (Pedantic side point: each MTD actually creates one or more struct
> device objects; one for the master MTD, and one for each partition that
> might be created. But I don't think you're asking about these struct
> device's.)
>
> But none of this is super-relevant to this patch; I'm not talking about
> struct devices (think kobjects, Linux driver model), I'm dealing with
> struct device_node (think device tree, of_*() APIs, etc.).
>
> Now, each flash connected to the controller has its own device_node. All
> this patch is saying is that we don't need to know much about that node;
> as long as it responds to the READ ID command properly, spi_nor_scan()
> can autodetect it.
>

And if there was suppor for a flash chip that does not respond to READ
ID (or uses a different opcode for it) this patch would break it,
right?

Thanks

Michal
