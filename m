Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TEnUx-0005NU-38
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2012 20:37:23 +0000
Received: by pbbrq8 with SMTP id rq8so6147364pbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2012 13:37:20 -0700 (PDT)
Message-ID: <505B7E7A.6070200@gmail.com>
Date: Fri, 21 Sep 2012 02:07:14 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Dimitar Penev <dpn@switchfin.org>
Subject: Re: ubiattach  issue
References: <006c01cd970c$1b9cb930$2901a8c0@dpn> <505B5F83.6070408@gmail.com>
 <016601cd9765$38f20a90$2901a8c0@dpn>
In-Reply-To: <016601cd9765$38f20a90$2901a8c0@dpn>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Dimitar,

Cc-ing Artem

On 9/21/2012 12:52 AM, Dimitar Penev wrote:
> Hi Vikram,
>
> Thank you for your response.
>
> It is a check out from http://git.infradead.org/?p=mtd-utils.git
> Git signature 36d8de81049c9c908740b690c664b5bd3703ccd6

I tested with this checkout in my nandsim under x86. But couldn't 
reproduce the issue. (But I was on 2.6.38.8 kernel).

Could you also post the corresponding kernel logs when you issued the 
ubiattach command? That should give more hints.

~Vikram

>
> ----- Original Message ----- From: "Vikram Narayanan" <vikram186@gmail.com>
> To: "Dimitar Penev" <dpn@switchfin.org>
> Cc: <linux-mtd@lists.infradead.org>
> Sent: Thursday, September 20, 2012 9:25 PM
> Subject: Re: ubiattach issue
>
>
>> On 9/20/2012 2:14 PM, Dimitar Penev wrote:
>>> Hi Gents,
>>>
>>> I am facing an issue with ubiattach on Linux kernel 3.0.8
>>> On our target we have nand flash with mtd layer on top.
>>> The logs attached below.
>>>
>>> Can you please give me a pointer?
>>>
>>>
>>> /bin # ubinfo -a
>>> UBI version: 1
>>> Count of UBI devices: 0
>>> UBI control device major/minor: 10:62
>>>
>>> /bin # ubiformat /dev/mtd5 -y --vid-hdr-offset="2048"
>>> ubiformat: mtd5 (nand), size 511705088 bytes (488.0 MiB), 3904
>>> eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
>>> libscan: scanning eraseblock 3903 -- 100 % complete
>>> ubiformat: 3904 eraseblocks have valid erase counter, mean value is 3
>>> ubiformat: formatting eraseblock 3903 -- 100 % complete
>>>
>>> /bin # ubiattach /dev/ubi_ctrl --mtdn=5 --devn=0 --vid-hdr-offset="2048"
>>> ubiattach: error!: cannot attach mtd5
>>> error 25 (Inappropriate ioctl for device)
>>
>> Before any pointers, which version of mtd-utils are you using?
>> How to:
>> (http://linux-mtd.infradead.org/faq/general.html#L_compile_mtd)
>>
>> ~Vikram
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>
