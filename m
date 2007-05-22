Received: from [67.18.166.194] (helo=warp.phpwebhosting.com)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HqSvS-0002gO-3k
	for linux-mtd@lists.infradead.org; Tue, 22 May 2007 07:53:17 -0400
Message-ID: <4652D9A2.6020607@indefia.com>
Date: Tue, 22 May 2007 14:53:06 +0300
From: Semih Hazar <semih.hazar@indefia.com>
MIME-Version: 1.0
To: "Vladimir A. Barinov" <vbarinov@ru.mvista.com>
Subject: Re: Generic Platform NAND Driver
References: <464D98DF.5020004@indefia.com> <4652B321.90006@indefia.com>
	<4652BC51.9090009@ru.mvista.com> <4652C5EB.7080007@indefia.com>
	<4652D1C8.4050305@ru.mvista.com>
In-Reply-To: <4652D1C8.4050305@ru.mvista.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, vitalywool@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vladimir A. Barinov wrote:
>>
>> +ixdp425_flash_nand_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned 
>> int ctrl)
>> +{
>> +    struct nand_chip *this = mtd->priv;
>> +    int offset = (int)this->priv;
>>
>> Here offset is read from nand_chip->priv, which actually points to 
>> struct plat_nand_data of plat_nand.c
>>
>> Am I wrong ? 
> I agree with you.
> And you are right that all things work fine because the 
> mtd_info->priv->priv that points to plat_nand_data is not used.
>
> I agree that the line 54 in plat_nand.c should be removed:
>
> -    data->chip.priv = &data;
>
>
> But does it really usefull to create void * host pointer if it could 
> be done in arch code like the above patch does?
I thought board-specific code can make use of this area (just as in your 
patch) so it's good to be able pass some _known_ data there.

My code which uses generic nand and is very much like the patch you've 
sent. But we may have board specific CLE, ACE, CE pins so they're not 
#define'd in the machine code, rather they're passed in a struct from 
the board code. And I thought the right thing to so that would be to 
pass that data to the priv member rather than accessing it in a static way.

If it's better to access have these board-specific in a static manner, 
then I'll just go ahead and change my code that way.

Thanks for your feedback.

Regards,
-- 
Semih Hazar
