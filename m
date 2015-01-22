Message-ID: <54C06E05.9050205@hisilicon.com>
Date: Thu, 22 Jan 2015 11:27:01 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <20141130090853.GG3608@norris-Latitude-E6410> <548987D3.3060407@gmail.com>
 <20141217062333.GD7112@brian-ubuntu> <5491638B.5090403@gmail.com>
 <20150113041701.GM9759@ld-irv-0074>
In-Reply-To: <20150113041701.GM9759@ld-irv-0074>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: mark.rutland@arm.com, Zhou Wang <wangzhou.bry@gmail.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>, pawel.moll@arm.com,
 devicetree@vger.kernel.org, liguozhu@hisilicon.com,
 ijc+devicetree@hellion.org.uk, haojian.zhuang@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, xuwei5@hisilicon.com, galak@codeaurora.org,
 caizhiyong@huawei.com, yubingxu@hisilicon.com,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Very sorry for late, I made tests again and also had a talk with the
NAND controller hardware colleague. Please find my reply below.

On 2015/1/13 12:17, Brian Norris wrote:
> Following up on this last comment from last year's thread:
> 
> On Wed, Dec 17, 2014 at 07:05:47PM +0800, Zhou Wang wrote:
>> On 2014年12月17日 14:23, Brian Norris wrote:
> [...]
>>>> [  104.648056] mtd_nandbiterrs: ECC failure, read data is incorrect
>>>> despite read success
>>>> insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error
>>>>
>>>> The reason for above failure is that:
>>>> In ECC mode, when rewriting page data to NAND flash, the NAND
>>>> controller will also produce ECC code and write them to NAND flash
>>>> as well. So when we read data from NAND flash, there is no need to
>>>> correct the error bit. We read what we write to the flash.
>>>
>>> BTW, your explanation doesn't seem quite right. The problem is that
>>> even though mtd_read() didn't report errors, the data doesn't match
>>> what's written. It's not that there was "no need to correct the error
>>> bit".
>>
>> Maybe I did not express clearly. In the nandbiterrs test, firstly
>> write data to flash with ECC code in oob area, then change some bits
>> and rewrite data to flash with old ECC code in oob area, at last read
>> data out with ECC to test if the "error bits" can be corrected. My
>> explanation is that in rewriting process NAND controller also produces
>> new ECC code of the data and write both data and new ECC code to flash.
>> So in next step we will get what was writen without "correction".
> 
> But we should at least get an -EBADMSG return status, right? If you're
> "rewriting" the data, this should result in two sets of data written on
> top of each other, which (depending on the flash layout charecteristics)
> might turn up as a kind of logical AND of all the data+OOB. This is
> "probably" not correctable.
> 
> But that last "probably" leaves room for the possibility you mentioned,
> I guess; that the ECC code is just correcting the data to look like the
> second set of (intentionally) erroneous data.

I made testes again in 1bit/ECC and 16bit/ECC modes using 2K(page)+64B(oob)
NAND flash. here are the logs, I also printed ECC code in OOB area.

Results are:
1. in 16bit/ECC, it will return -EBADMSG as the ECC codes have been broken.
2. in 1bit/ECC, it will not reture -EBADMSG because a hardware design problem.
   I will explain the detail below.

Test logs:
1. in 16bit/ECC(print ECC codes):

/home # insmod mtd_nandbiterrs.ko dev=2 page_offset=1 seed=110 mode=0

==================================================
mtd_nandbiterrs: MTD device: 2
mtd_nandbiterrs: MTD device size 8388608, eraseblock=131072, page=2048, oob=64
mtd_nandbiterrs: Device uses 2 subpages of 1024 bytes
mtd_nandbiterrs: Using page=1, offset=2048, eraseblock=0
mtd_nandbiterrs: incremental biterrors test
mtd_nandbiterrs: write_page

ECC code:
96 ec 7e c0 dc 8e 38 68 e7 29 6a f8 f3 c1 9e 4e 9b 2e b7 31 40 46 88 ec cf 65 55 94 28 07 09 3c
c5 1c f6 cb 3e c0 26 d7 cf 2d 15 77 59 e8 5f fd a7 cc be 17 cb ee 39 de

mtd_nandbiterrs: rewrite page

ECC code:
96 ec 7e c0 dc 8e 38 68 e7 29 6a f8 f3 c1 9e 4e 9b 2e b7 31 40 46 88 ec cf 65 55 94 28 07 09 3c
c5 1c f6 cb 3e c0 26 d7 cf 2d 15 77 59 e8 5f fd a7 cc be 17 cb ee 39 de

mtd_nandbiterrs: read_page

ECC code:
96 ec 7e c0 dc 8e 38 68 e7 29 6a f8 f3 c1 9e 4e 9b 2e b7 31 40 46 88 ec cf 65 55 94 28 07 09 3c
c5 1c f6 cb 3e c0 26 d7 cf 2d 15 77 59 e8 5f fd a7 cc be 17 cb ee 39 de

mtd_nandbiterrs: verify_page
mtd_nandbiterrs: Successfully corrected 0 bit errors per subpage
mtd_nandbiterrs: Inserted biterror @ 0/5
mtd_nandbiterrs: Inserted biterror @ 1024/2
mtd_nandbiterrs: rewrite page

ECC code:(the ECC code in NAND controller buffer, which will be wrote to NAND flash)
11 70 40 2e ab 6e 17 34 1d 2d 2b b0 51 a4 c1 af 05 a6 44 12 25 f1 10 49 7d 0b bd 95 28 07 09 3c
c5 1c f6 cb 3e c0 26 d7 cf 2d 15 77 59 e8 5f fd a7 cc be 17 cb ee 39 de

mtd_nandbiterrs: read_page

ECC code:
10 60 40 00 88 0e 10 20 05 29 2a b0 51 80 80 0e 01 26 04 10 00 40 00 48 4d 01 15 94 28 07 09 3c
c5 1c f6 cb 3e c0 26 d7 cf 2d 15 77 59 e8 5f fd a7 cc be 17 cb ee 39 de

mtd_nandbiterrs: error: read failed at 0x800
mtd_nandbiterrs: After 1 biterrors per subpage, read reported error -74
mtd_nandbiterrs: finished successfully.
==================================================
insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error

2. in 1bit/ECC(print ECC codes):
/home # insmod mtd_nandbiterrs.ko dev=2 page_offset=1 seed=110 mode=0

==================================================
mtd_nandbiterrs: MTD device: 2
mtd_nandbiterrs: MTD device size 8388608, eraseblock=131072, page=2048, oob=64
mtd_nandbiterrs: Device uses 4 subpages of 512 bytes
mtd_nandbiterrs: Using page=1, offset=2048, eraseblock=0
mtd_nandbiterrs: incremental biterrors test
mtd_nandbiterrs: write_page

ECC code:
ff ff 3f ff ff ff ff ff 3f ff ff ff

mtd_nandbiterrs: rewrite page

ECC code:
ff ff 3f ff ff ff ff ff 3f ff ff ff

mtd_nandbiterrs: read_page

ECC code:
ff ff 3f ff ff ff ff ff 3f ff ff ff

mtd_nandbiterrs: verify_page
mtd_nandbiterrs: Successfully corrected 0 bit errors per subpage
mtd_nandbiterrs: Inserted biterror @ 0/5
mtd_nandbiterrs: Inserted biterror @ 512/6
mtd_nandbiterrs: Inserted biterror @ 1024/2
mtd_nandbiterrs: Inserted biterror @ 1536/6
mtd_nandbiterrs: rewrite page

ECC code:(the ECC code in NAND controller buffer, which will be wrote to NAND flash)
aa aa 59 aa aa 96 aa aa 66 aa aa 96

mtd_nandbiterrs: read_page

ECC code:
aa aa 19 aa aa 96 aa aa 26 aa aa 96

mtd_nandbiterrs: Read reported 2 corrected bit errors
mtd_nandbiterrs: verify_page
mtd_nandbiterrs: Error: page offset 0, expected 23, got 03
mtd_nandbiterrs: Error: page offset 512, expected 69, got 29
mtd_nandbiterrs: Error: page offset 1024, expected 06, got 02
mtd_nandbiterrs: Error: page offset 1536, expected 4c, got 0c
mtd_nandbiterrs: ECC failure, read data is incorrect despite read success
insmod: can't insert 'mtd_nandbiterrs.ko': Input/output error

Reason about above 1bit/ECC test result:
As the log above, in rewriting process, the ECC code should be "aa aa 59 aa aa 96 aa aa 66 aa aa 96",
however actually it writes ECC code "aa aa 19 aa aa 96 aa aa 26 aa aa 96" to
flash. ECC code of the first and third 512B of 2k page in flash are "aa aa 19"
which each has 1bit error in ECC code. Taking the first 512B as an example,
there are 2bit errors: 1bit in page data and 1bit in related ECC code.
It can not correct this kind of 2bit errors in 1bit/ECC mode in this NAND
controller, however, it will trigger a correctable interrupt. As a result,
software can not find this 1bit error in page data.

This is a hardware problem of this NAND controller.
I plan to remove the 1bit/ECC mode support in patch of next version.

> 
>>> I'd recommend digging a little more to figure out what's wrong here. You
>>> might need to instrument the nandbiterrs test. This is possibly
>>
>> Thanks, I will do it.
>>
>>> highlighting a driver bug [1].
>>>
>>> Brian
>>>
>>> [1] Besised simply that you didn't implement write_page_raw(). The
>>> default nand_write_page_raw() implementation looks just like your
>>> non-raw version.
>>
>> Yes. In ECC mode, as the NAND controller must write page as a whole
>> with ECC code, the default nand_write_page_raw() looks just like
>> non-raw version.
> 
> Are you saying you cannot implement the raw() hooks for this IP? Or just
> that you haven't yet? The latter is probably OK for now (I'd recommend
> doing this, or at least mark a TODO in the code), but the former is a
> little disturbing.

The function of raw() hooks is just writing the page data to flash, is this right?
In none ECC mode, it can write page date alone to flash. But in ECC mode, NAND
controller will produce related ECC code automatically, write page data and ECC code
to flash. In ECC mode, it can not write page date alone to flash for this NAND controller.

As a result, the nandbiterrs test can not pass.

I don't know if I have explained these two problems clearly. If still have something
confused, please let me know.

> 
> Brian

Many thanks for your comments!
Zhou Wang

> 
> .
> 
