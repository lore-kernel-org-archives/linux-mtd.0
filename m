Received: from mail-pa0-f42.google.com ([209.85.220.42])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U00ui-0002tZ-DL
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2013 02:27:08 +0000
Received: by mail-pa0-f42.google.com with SMTP id rl6so72287pac.29
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2013 18:27:06 -0800 (PST)
Message-ID: <51073373.4080006@gmail.com>
Date: Tue, 29 Jan 2013 07:56:59 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
 <5106AFAA.1020502@gmail.com> <51072EA4.7000201@freescale.com>
In-Reply-To: <51072EA4.7000201@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/29/2013 7:36 AM, Huang Shijie wrote:
> 于 2013年01月29日 01:04, Vikram Narayanan 写道:
>> On 1/28/2013 8:50 AM, Huang Shijie wrote:
>>> 于 2013年01月28日 10:39, Vikram Narayanan 写道:
>>>> Hello Huang,
>>>>
>>>> On 1/21/2013 7:42 AM, Huang Shijie wrote:
>>>>> 于 2013年01月19日 00:52, Vikram Narayanan 写道:
>>>>>> Hi,
>>>>>>
>>>>>> When I try to run the mtd_oobtest on an i.Mx6Q board, it results in a
> Which mx6q' board are you using? the mx6q-arm2 or mx6q-ard?

I'm using a custom board.

> The kernel only supports the mx6q-arm2 now.

May I know in what way the driver is restricted for using with other boards?

>>
>> Toshiba, 4 Gbit, (4096 +224) bytes ×64 pages ×2048blocks
>
> The Toshiba's nand is not well supported by the kernel.
> Are you sure the kernel parse out the correct geometry for the toshiba's
> nand?
> Please recheck the page size and oob size with "mtdinfo /dev/mtd0".
>

You're right and we knew it earlier as the Kernel detects the OOB size 
as 128 bytes. So, some remaining bytes become unused at the end of each 
page. i.e., (224-128). Instead of supporting ecc strength as ECC9 we end 
up using ECC8. Should this be a cause for the -74 error?

Regards,
Vikram
