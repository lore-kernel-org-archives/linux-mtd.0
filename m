Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SzeM5-0000of-F6
 for linux-mtd@lists.infradead.org; Fri, 10 Aug 2012 01:49:37 +0000
Received: by obbta17 with SMTP id ta17so1500045obb.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Aug 2012 18:49:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201208100341.23167.marex@denx.de>
References: <CAOMZO5DuG9m-SCPPxza=VFMmcWrGnp3Brry6nS8XHrCSzQqM7g@mail.gmail.com>
 <201208100153.51140.marex@denx.de>
 <CAOMZO5BCjV6iLUiQ74GskkOdgGpdqbo2ZB=7eu6VeY=mNwWf0Q@mail.gmail.com>
 <201208100341.23167.marex@denx.de>
Date: Thu, 9 Aug 2012 22:49:35 -0300
Message-ID: <CAOMZO5DeXp65H2vgtp5qGhV+tXVMuR8sXESc1CzJcJZ2WcmW-A@mail.gmail.com>
Subject: Re: Kernel crashes when CONFIG_MTD_NAND_VERIFY_WRITE=y
From: Fabio Estevam <festevam@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: Shawn Guo <shawn.guo@linaro.org>, Subodh Nijsure <snijsure@grid-net.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 9, 2012 at 10:41 PM, Marek Vasut <marex@denx.de> wrote:

> NAK! This is only a workaround, proper implementation is needed. If it's not
> implemented now, I'm pretty sure such workaround will be there forever.

I know, please see below.

>
>>  /*
>>   * Handles block mark swapping.
>>   * It can be called in swapping the block mark, or swapping it back,
>> @@ -1568,6 +1577,7 @@ static int __devinit gpmi_nfc_init(struct
>> gpmi_nand_data *this)
>>         chip->ecc.size          = 1;
>>         chip->ecc.strength      = 8;
>>         chip->ecc.layout        = &gpmi_hw_ecclayout;
>> +       chip->verify_buf        = gpmi_verify_buf;
>>         if (of_get_nand_on_flash_bbt(this->dev->of_node))
>>                 chip->bbt_options |= NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
>>
>> Now we need to come up with a real  gpmi_verify_buf function ;-)

As I mentioned, I understand that a proper function needs to be created.

Regards,

Fabio Estevam
