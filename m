Received: from mail-ie0-x22a.google.com ([2607:f8b0:4001:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0c5t-0001oh-KL
 for linux-mtd@lists.infradead.org; Mon, 15 Dec 2014 20:18:14 +0000
Received: by mail-ie0-f170.google.com with SMTP id rd18so11669116iec.1
 for <linux-mtd@lists.infradead.org>; Mon, 15 Dec 2014 12:17:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <548F3834.3020504@imgtec.com>
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
 <1417525136-25731-7-git-send-email-ezequiel.garcia@imgtec.com>
 <CAAK6Zt0-BVoFa5+_B9HYCcEvtajTOpPPzdrm4RHO4PYgE2Y5LA@mail.gmail.com>
 <548F3834.3020504@imgtec.com>
Date: Mon, 15 Dec 2014 12:17:51 -0800
Message-ID: <CAAK6Zt0hYbiWR_xJ4Q5uRf6gquzBSm0-z=kr_q9HCodH0MKnvQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] mtd: spi-nand: Support common SPI NAND devices
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Cc: bpqw@micron.com, Ionela Voinescu <ionela.voinescu@imgtec.com>,
 frankliu@micron.com, Andrew Bresticker <abrestic@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 arnaud.mouiche@invoxia.com, Brian Norris <computersforpeace@gmail.com>,
 James Hartley <james.hartley@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sounds good to me.

Reviewed-by: Dan Ehrenberg <dehrenberg@chromium.org>

On Mon, Dec 15, 2014 at 11:36 AM, Ezequiel Garcia
<ezequiel.garcia@imgtec.com> wrote:
>
>
> On 12/12/2014 10:27 PM, Daniel Ehrenberg wrote:
>> On Tue, Dec 2, 2014 at 4:58 AM, Ezequiel Garcia
>> <ezequiel.garcia@imgtec.com> wrote:
> [..]
>>> +
>>> +enum spi_nand_device_variant {
>>> +       SPI_NAND_GENERIC,
>>> +       SPI_NAND_MT29F,
>>> +       SPI_NAND_GD5F,
>>> +};
>>
>> What is the purpose of including SPI_NAND_GENERIC? It looks like it
>> doesn't work anyway.
>>
>
> For the time being, I'm not sure we will require a device-specific compatible
> string, or rather, auto-detect the device using the device ID.
>
> So, this patch leaves the door opened for both options.
>
> I've been talking to Brian on IRC, and auto-detecting the device seems like
> the way to go. However, I wanted to have some feedback on the general approach
> having the community approval, before moving forward in any direction.
>
> Thanks for the feedback,
> --
> Ezequiel
