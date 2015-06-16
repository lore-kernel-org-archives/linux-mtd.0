Message-ID: <558026B3.9080206@toshiba.co.jp>
Date: Tue, 16 Jun 2015 22:37:55 +0900
From: KOBAYASHI Yoshitake <yoshitake.kobayashi@toshiba.co.jp>
MIME-Version: 1.0
To: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v2] mtd: nand: support for Toshiba BENAND (Built-in ECC
 NAND)
References: <1434038402-26365-1-git-send-email-yoshitake.kobayashi@toshiba.co.jp>
 <1434096662.2271.130.camel@x220>
In-Reply-To: <1434096662.2271.130.camel@x220>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/06/12 17:11, Paul Bolle wrote:
> On Fri, 2015-06-12 at 01:00 +0900, KOBAYASHI Yoshitake wrote:
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index 5897d8d..050f0e9 100644
>
>> +config MTD_NAND_BENAND
>> +	tristate
>> +	depends on MTD_NAND_BENAND_ENABLE
>> +	default MTD_NAND
>> +
>> +config MTD_NAND_BENAND_ENABLE
>> +	bool "Support for Toshiba BENAND (Built-in ECC NAND)"
>> +	default y
>
> Why do you default to 'y'?

Setting the config to 'y' will not affect the SLCNAND operation.
I thought it is common to use BENAND and other vendor SLCNAND together
in the same model with same software build.

>> --- /dev/null
>> +++ b/drivers/mtd/nand/nand_benand.c
>
>> +EXPORT_SYMBOL(nand_benand_status_chk);
>
> I didn't spot any users of nand_benand_status_chk() outside of this
> file. Why is this export needed?

I agree with you. Thanks for checking.
I will delete this in next patch.

  -- Yoshi
