Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y7cHJ-0000W0-1G
 for linux-mtd@lists.infradead.org; Sun, 04 Jan 2015 03:54:58 +0000
Message-ID: <54A8B91B.1090604@atmel.com>
Date: Sun, 4 Jan 2015 11:52:59 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Steve deRosier <derosier@gmail.com>
Subject: Re: Does UBIFS NAND ECC info get stored in OOB?
References: <CALupW3Dv=OvY-5y_ScG1St8HUBYfXYpTnYAWDt_GJ+3+7KmC9Q@mail.gmail.com>	<54A359AE.3080105@atmel.com>
 <CALupW3D=q9wSTUxCAp9EVDjd5LwPOhJOYbV9OL0QVJd4G1nH2A@mail.gmail.com>
In-Reply-To: <CALupW3D=q9wSTUxCAp9EVDjd5LwPOhJOYbV9OL0QVJd4G1nH2A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
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

Hi, Steve

On 1/3/2015 2:06 AM, Steve deRosier wrote:
> Hi Josh,
>
>
> On Tue, Dec 30, 2014 at 6:04 PM, Josh Wu <josh.wu@atmel.com> wrote:
>> Hi, Steve
>>
>> On 12/31/2014 3:44 AM, Steve deRosier wrote:
>>>    Hi All,
>>>
>>> Sorry if this is a stupid question, but I found a number of old
>>> archived messages that explicitly state that UBIFS (actually, probably
>>> UBI) doesn't utilize the OOB of a NAND flash at all for storing the
>>> ECC information.
>> Could you list out these UBI/UBIFS messages so that people can help?
>>
> Sorry, I found them about a month ago and have already cleared the
> tabs.  But one clear version of it is directly on the pages at the MTD
> site:
>
> http://www.linux-mtd.infradead.org/doc/ubifs.html  under the title
> "UBIFS and MLC NAND flash": "because neither UBIFS nor UBI use OOB
> area;"
> and here:
> http://www.linux-mtd.infradead.org/faq/ubi.html#L_why_no_oob
>
> The list messages were from ~5 years ago or so from Artem IIRC.
Sorry I didn't make me clear here. I just want to see the error message 
when your UBI system fail to work.
But never mind, I saw it in your following message  :)

>
>
>
>> Does your system can boot up correctly and work sometime? or you cannot
>> mount your UBI filesystem at all?
>> Could get me a system boot log about your corruption, and another boot log
>> without corruption?
> Our system actually works 99.999% of the time. Which is why it's been
> so difficult finding the problem.
Okay.

> It's not so much a mount or
> boot-time problem, though it happens sometimes then.  The system
> usually works fine for a while, then you set it on a shelf for a
> couple of weeks and when you bring it back up, it then randomly fails.
> Sometimes at boot, sometimes when reading or running a specific file.
> Sometimes the error message is an LZO muckup one, sometimes it's a bad
> data node.  Typical:
>
> UBIFS error (pid 919): read_block: bad data node (block 290, inode 67)
>       magic          0x6101831
>       crc            0x92684951
>       node_type      1 (data node)
>       group_type     0 (no node group)
>       sqnum          297
>       len            2152
>       key            (67, data, 290)
>       size           4096
>       compr_typ      1
>       data size      2104
>       data:
>       00000000: 2f 04 88 05 87 06 86 07 85 08 84 09 46 0e 58 00 00 24
> 00 00 00 cc 4f 00 00 f8 f1 fb ff 38 01 50
>   ...
>       00000820: 5d 02 92 5d 01 d1 4d 04 e4 4d 03 0a 7c 03 4d 03 bd ec
> 44 cc 6f 11 00 00
> UBIFS error (pid 919): do_readpage: cannot read page 290 of inode 67, error -22
There seems has some UBI fix on 3.8.x stable tree. It is better if you 
can apply these fixes.

➜  mainline git:(99f3cd5) ✗  git log --oneline v3.8..v3.8.13 | grep -i UBI
1afae69 UBIFS: make space fixup work in the remount case
d90dc15 UBIFS: fix double free of ubifs_orphan objects
ce7f4e8 UBIFS: fix use of freed ubifs_orphan objects
>
> I think I've tracked it down to one of our junior engineers choosing
> to use `nandwrite -n` in an update script he wrote. This results in
> lack of ECC information being created on flashing it.  Not to mention
> the writing of 0xffs and killing of the UBI ECs.  His tool then goes
> further and ubiattaches the system, which then corrects the UBI
> metadata, including writing the ECC data.  Which results in a weird
> situation where a quick look at the flash data shows ECC data there,
> but if you dig deeper, it's missing on the data nodes further on in
> the system.
>
> So, the rewrite of the UBI metadata with the ECC info obfuscated the
> problem. It looks like we're not writing the ECC data on most of the
> data. It works fine, then a bit-flips and then it fails later.
> Unfortunately, waiting for bitflips is random and not terribly
> testable. Knowing what I know now, I am able to update it with the old
> script, manually cause a bitflip and see the exact same symptoms. And
> with the rewritten version with ubiformat, I can do the same test and
> it works fully.
For at91sam9x5ek PMECC, we cannot do pmecc correction for the erased 
page(all 0xff) if there has some bit flips.
The reason is 9x5ek PMECC will generate non-0xff ecc code for the erased 
page(all 0xff in the page).

This will case issues:
1. if there is any bitflip happen in erased page's oob area, that will 
cause PMECC error.
2. if there is any bitflip happen in erased pages' data area, This 
bitflip cannot be correct. And driver won't report any ECC error. I am 
not sure whether this can cause problem? As the UBI  may record the 
erased page, so the data corruption maybe doesn't matter. When UBI write 
data to this bitfliped erased page, as the PMECC code will write 
correctly into oob area. So this bitflip can be corrected by PMECC hardware.

I think you can manually insert bitflip into the erased page to see 
whether this cause your issue.

>
>
>> So could give me some configuration about your PMECC?
>> 4 bits correction in 512 bytes or else? What is your nand flash ecc minimal
>> requirement?
>>
> 4 bits, yes.  And the requirement is 4bits.  For clarity, here's the
> relevant chunk from the devicetree:
>
>      nand0: nand@40000000 {
>          nand-bus-width = <8>;
>          nand-ecc-mode = "hw";
>          atmel,has-pmecc; /* enable PMECC */
>          atmel,pmecc-cap = <4>;
>          atmel,pmecc-sector-size = <512>;
>          atmel,pmecc-lookup-table-offset = <0x8000 0x10000>;
>          nand-on-flash-bbt;
>          status = "okay";
These seems ok.
Be caution: if you use 1024 as sector size, you need apply the fix: 
2fa831f9db1f <mtd: atmel_nand: pmecc: fix failure to correct bit error 
in 1024-bytes sector>

>
> Thanks,
> - Steve
Best Regards,
Josh Wu
