Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EEqq2-0002wh-QI
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2005 12:07:34 -0400
Message-ID: <4325A7F0.30303@ru.mvista.com>
Date: Mon, 12 Sep 2005 20:08:16 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Martin Waitz <tali@admingilde.org>
References: <20050912151244.3e512086.vwool@ru.mvista.com>
	<20050912152436.GR12535@admingilde.org>
In-Reply-To: <20050912152436.GR12535@admingilde.org>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] power management for NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Martin,

Exactly. We should.
But prior to shut off the clock/power down the flash we need to put the 
flash driver into the corresponding state (suspended).

Thus, a typical suspend (pseudo) code for NAND flash will look the 
following way:

static int chip_nand_suspend(struct device *dev, u32 state, u32 level)
{
        int retval = 0;

#ifdef CONFIG_PM
        struct mtd_info *mtd = dev_get_drvdata(dev);
        if (mtd && mtd->suspend && level == SUSPEND_SAVE_STATE) {
                retval = mtd->suspend(mtd);
                if (retval == 0) {
                        /* shut off the clocks and power down the 
controller here */
                }
        }
#endif
        return retval;
}

with a resume routine doing just the oppsite.


Hope that clarifies the whole thing :)

Best regards,
   Vitaly

Martin Waitz wrote:

>hoi :)
>
>On Mon, Sep 12, 2005 at 03:12:44PM +0400, Vitaly Wool wrote:
>  
>
>>the patch inlined below allows to suspend/resume NAND flash.
>>    
>>
>
>shouldn't we call the board driver while suspending,
>to allow to actually power down the NAND flash?
>
>  
>
