Received: from switchvoice.com ([77.70.97.103] helo=mail.bioidentic.com)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TEyqF-0001xe-1f
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2012 08:44:07 +0000
Message-ID: <008d01cd97d5$3fb70680$2901a8c0@dpn>
From: "Dimitar Penev" <dpn@switchfin.org>
To: "Vikram Narayanan" <vikram186@gmail.com>
References: <006c01cd970c$1b9cb930$2901a8c0@dpn> <505B5F83.6070408@gmail.com>
 <016601cd9765$38f20a90$2901a8c0@dpn> <505B7E7A.6070200@gmail.com>
 <002701cd97c3$ed7495b0$2901a8c0@dpn>
Subject: Re: ubiattach  issue
Date: Fri, 21 Sep 2012 11:44:01 +0300
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
 reply-type=response
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
Reply-To: Dimitar Penev <dpn@switchfin.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Gents,

I have enabled CONFIG_MTD_DEBUG, CONFIG_MTD_UBI_DEBUG, CONFIG_UBIFS_FS_DEBUG
And got some more messages during ubiformat however no additional info in my 
system log after ubiattach

The only information I get in the console is the old message

>/bin # ubiattach /dev/ubi_ctrl --mtdn=5 --devn=0 --vid-hdr-offset="2048"
>ubiattach: error!: cannot attach mtd5
>                 error 25 (Inappropriate ioctl for device)


It seems it is failing in /mtd-utils/ubi-utils/libubi.c at

static int do_attach(const char *node, const struct ubi_attach_req *r)
...
ret = ioctl(fd, UBI_IOCATT, r);
...

I get ret == -1 here, it seems my node /dev/ubi_ctrl doesn't have UBI_IOCATT 
command hooked.

Note that the node /dev/ubi_ctrl I create manually like this:

mknod /dev/ubi_ctrl c 10 63

So my ubi character control device seems not hooked to the /dev/ubi_ctrl?
Any suggestions?

Thanks
Dimitar




----- Original Message ----- 
From: "Dimitar Penev" <dpn@switchfin.org>
To: "Vikram Narayanan" <vikram186@gmail.com>
Cc: <linux-mtd@lists.infradead.org>; <dedekind1@gmail.com>
Sent: Friday, September 21, 2012 9:40 AM
Subject: Re: ubiattach issue


> Hello Vikram,
>
> Let me explain some more in details on my issue:
>
> We have custom Blackfin based board running uClinux (using kernel 3.0.8)
> and using mtd-utils (nanddump 1.4.6).
> On this board we are using the Blackfin  platform nand driver.
> UBIFS is working OK on this board.
>
> Now we have another custom board also based on Blackfin CPU but this CPU 
> has a hardware
> nand controller which we have used to connect to our nand chip.
> Under u-boot this driver seems to work fine and we can read/write on the 
> nand flash without issues.
> On Linux we are using the same  uClinux (using kernel 3.0.8) and mtd-utils 
> (nanddump 1.4.6).
> This time we get:
> /bin # ubiattach /dev/ubi_ctrl --mtdn=5 --devn=0 --vid-hdr-offset="2048"
> ubiattach: error!: cannot attach mtd5
>                 error 25 (Inappropriate ioctl for device)
>
> The difference between the two boards seems to be the fact that the second 
> board is using the hardware nand controler
> and the corresponding Blackfin Linux driver.
>
> I don't see anything in my system logs related with ubiattach so I guess I 
> have to enable some debugging in the kernel.
> Let me recompile and try again.
> If you want me to test something specific I will appreciate your advices.
>
> Thank you.
> Dimitar
>
>
>
>
>
> ----- Original Message ----- 
> From: "Vikram Narayanan" <vikram186@gmail.com>
> To: "Dimitar Penev" <dpn@switchfin.org>
> Cc: <linux-mtd@lists.infradead.org>; <dedekind1@gmail.com>
> Sent: Thursday, September 20, 2012 11:37 PM
> Subject: Re: ubiattach issue
>
>
>> Hello Dimitar,
>>
>> Cc-ing Artem
>>
>> On 9/21/2012 12:52 AM, Dimitar Penev wrote:
>>> Hi Vikram,
>>>
>>> Thank you for your response.
>>>
>>> It is a check out from http://git.infradead.org/?p=mtd-utils.git
>>> Git signature 36d8de81049c9c908740b690c664b5bd3703ccd6
>>
>> I tested with this checkout in my nandsim under x86. But couldn't 
>> reproduce the issue. (But I was on 2.6.38.8 kernel).
>>
>> Could you also post the corresponding kernel logs when you issued the 
>> ubiattach command? That should give more hints.
>>
>> ~Vikram
>>
>>>
>>> ----- Original Message ----- From: "Vikram Narayanan" 
>>> <vikram186@gmail.com>
>>> To: "Dimitar Penev" <dpn@switchfin.org>
>>> Cc: <linux-mtd@lists.infradead.org>
>>> Sent: Thursday, September 20, 2012 9:25 PM
>>> Subject: Re: ubiattach issue
>>>
>>>
>>>> On 9/20/2012 2:14 PM, Dimitar Penev wrote:
>>>>> Hi Gents,
>>>>>
>>>>> I am facing an issue with ubiattach on Linux kernel 3.0.8
>>>>> On our target we have nand flash with mtd layer on top.
>>>>> The logs attached below.
>>>>>
>>>>> Can you please give me a pointer?
>>>>>
>>>>>
>>>>> /bin # ubinfo -a
>>>>> UBI version: 1
>>>>> Count of UBI devices: 0
>>>>> UBI control device major/minor: 10:62
>>>>>
>>>>> /bin # ubiformat /dev/mtd5 -y --vid-hdr-offset="2048"
>>>>> ubiformat: mtd5 (nand), size 511705088 bytes (488.0 MiB), 3904
>>>>> eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
>>>>> libscan: scanning eraseblock 3903 -- 100 % complete
>>>>> ubiformat: 3904 eraseblocks have valid erase counter, mean value is 3
>>>>> ubiformat: formatting eraseblock 3903 -- 100 % complete
>>>>>
>>>>> /bin # ubiattach 
>>>>> /dev/ubi_ctrl --mtdn=5 --devn=0 --vid-hdr-offset="2048"
>>>>> ubiattach: error!: cannot attach mtd5
>>>>> error 25 (Inappropriate ioctl for device)
>>>>
>>>> Before any pointers, which version of mtd-utils are you using?
>>>> How to:
>>>> (http://linux-mtd.infradead.org/faq/general.html#L_compile_mtd)
>>>>
>>>> ~Vikram
>>>>
>>>> ______________________________________________________
>>>> Linux MTD discussion mailing list
>>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>>>
>>>
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
