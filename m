Received: from glatton.cnchost.com ([207.155.248.47])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1950oS-0004JL-IK
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 11:03:45 +0100
Errors-To: <uttenthaler@ems-wuensche.com>
Message-ID: <3E9A876E.8090503@ems-wuensche.com>
Date: Mon, 14 Apr 2003 12:03:26 +0200
From: Gerhard Uttenthaler <uttenthaler@ems-wuensche.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <002901c3021b$546a6fe0$525deecb@noshel>
	<20030413210133.64cc28b9.EManning@PRISMIQ.com>
	<000501c30244$91a09dc0$525deecb@noshel>
	<200304140954.27049.tglx@linutronix.de> <3E9AF275.4000905@idis.co.kr>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: A question on ECC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


Which eccmode is used seems to be set from the calling function of 
nand_read_ecc. I found:

in nandwrite.c:

struct nand_oobinfo jffs2_oobinfo = {
	useecc: 1,
	eccpos:	{ 0, 1, 2, 3, 6, 7}
};

<SNIP>

// force oob layout for jffs2 or yaffs ?
if (forcejffs2 || forceyaffs) {
	struct nand_oobinfo *oobsel = forcejffs2 ? &jffs2_oobinfo :
	&yaffs_oobinfo;
	if (ioctl (fd, MEMSETOOBSEL, oobsel) != 0) {
		perror ("MEMSETOOBSEL");
		close (fd);
		exit (1);
	}
}


Here useecc is set to 1, which is found in nand.h:
#define NAND_ECC_SOFT	1


Similar in wbuf.c

struct nand_oobinfo jffs2_oobinfo = {
	useecc: 1,
	eccpos: {JFFS2_OOB_ECCPOS0, JFFS2_OOB_ECCPOS1,
		JFFS2_OOB_ECCPOS2, JFFS2_OOB_ECCPOS3, JFFS2_OOB_ECCPOS4,
		JFFS2_OOB_ECCPOS5}
};

int jffs2_flash_read(struct jffs2_sb_info *c, loff_t ofs, size_t len,
			size_t *retlen, u_char *buf)
{
	loff_t	orbf = 0, owbf = 0, lwbf = 0;
	int	ret;

	/* Read flash */
	if (!jffs2_can_mark_obsolete(c)) {
		ret = c->mtd->read_ecc(c->mtd, ofs, len, retlen, buf,
			NULL, &jffs2_oobinfo);

<SNIP>



I found this while studying nftlmount.c. In function find_boot_record 
there might be a bug.

In line 223:
if ((ret = MTD_READECC(nftl->mtd, block * nftl->EraseSize +
		i + SECTORSIZE, SECTORSIZE, &retlen, buf,(char *)&oob,
		NAND_ECC_DISKONCHIP)) < 0) {

NAND_ECC_DISKONCHIP is #defined as 5. As I steped over MTD_READECC I 
found called nand_read_ecc, which wants a pointer (struct nand_oobinfo 
*oobsel )as last argument.

I use a cvs snapshot dated 20030318, cross compiled for ARM7TDMI

Hope this all makes some sense and helps.

regards
Gerhard Uttenthaler


Edward J. Lee schrieb:
> Thomas Gleixner wrote:
> 
>> On Monday 14 April 2003 07:13, Edward Lee (???) wrote:
>>  
>>
>>> Hi Earl, thanks for the help.
>>>
>>> I didn't use nandwrite, I wrote on the chip using plain stuff like 
>>> 'cp' or
>>> 'tar', etc. (having a file system on my device, I couldn't find a reason
>>> to write files using other programs)
>>>   
>>
>> nandwrite is just used to copy a filesystem image to a unformatted chip.
>> If you have mounted the fs already, then nandwrite would be the wrong 
>> tool.
>>
>> These messages have a different reason. I assume that you followed the 
>> advice on yaffs list and you have enabled YAFFS_USE_NANDECC and 
>> disabled YAFFS_USE_OLD_MTD.
>>
>> Then I can only guess, that you did not select a ecc mode in your 
>> board driver code.
>> <SNIP>
>>     /* 20 us command delay time */
>>     this->chip_delay = 20;       
>>     this->eccmode = NAND_ECC_SOFT;
>> <SNIP>
>>
>> NAND_ECC_SOFT is the right choice, if you don't have a hardware ecc 
>> generator.
>> If you have one, you must supply the neccecary functions to use it.
>>
>>  
>>
> this->eccmode is indeed set to NAND_ECC_SOFT.
> I guess my case is kind of 'extra-tricky'. I just found out another 
> weird thing,
> that the warning messages complaining '...without ECC...' do NOT appear 
> when
> I'm 'writing' on the chip. Strange, eh. :'(
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
