Received: from mx0a-0028f201.pphosted.com ([148.163.150.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTtuB-0006rJ-MB
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 19:29:21 +0000
Subject: Re: [PATCH RFC] mtd: rawnand: Cure MICRON NAND partial erase issue
To: Richard Weinberger <richard@nod.at>
CC: <tglx@linutronix.de>, <linux-mtd@lists.infradead.org>,
 <boris.brezillon@bootlin.com>, <miquel.raynal@bootlin.com>,
 <beanhuo@micron.com>
References: <2acabca0-cc7a-6655-8bd9-592b516f58a2@cumminsallison.com>
 <1844020.iFgpUNDC3t@blindfold>
From: Piotr Wojtaszczyk <wojtaszczykp@cumminsallison.com>
Message-ID: <8cc6a3e9-28fa-7450-e60f-ff7f092805d4@cumminsallison.com>
Date: Mon, 3 Dec 2018 13:28:55 -0600
MIME-Version: 1.0
In-Reply-To: <1844020.iFgpUNDC3t@blindfold>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/3/18 1:02 PM, Richard Weinberger wrote:
> Am Montag, 3. Dezember 2018, 19:55:46 CET schrieb Piotr Wojtaszczyk:
>> On Thu, 29 Nov 2018 22:12:50 +0100 (CET)
>> Thomas Gleixner <tglx at linutronix.de> wrote:
>>
>>   > On some Micron NAND chips block erase fails occasionaly despite the chip
>>   > claiming that it succeeded. The flash block seems to be not completely
>>   > erased and subsequent usage of the block results in hard to decode
>> and very
>>   > subtle failures or corruption.
>>
>> Doesn't UBI check block after erase in do_sync_erase()? Do the bitflips
>> develop over time?
> You mean ubi_self_check_all_ff()? This is a very expensive self-check
> which is disabled by default and makes only sense then you test UBI itself.
> Also think of power-cuts, what happens if you face power-loss right
> after mtd_erase() and before the check?
>
> Finally, I'm not sure if you can detect partial erase right after
> mtd_erase(). I fear failure happens after you write to that block.
>
> Thanks,
> //richard
>
>
Oh yes the ubi_self_check_all_ff() is indeed disabled. Partially erased 
blocks I think are being caught at attach in scan_peb(), they are put in 
ai->erase list for later erase again.

--

Peter
