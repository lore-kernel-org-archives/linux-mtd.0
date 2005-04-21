Received: from send.forptr.21cn.com ([202.105.45.47] helo=21cn.com)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DOY0D-0006MY-2q
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2005 05:29:46 -0400
Date: Thu, 21 Apr 2005 17:28:41 +0800
From: "carl liao" <carlliao@21cn.com>
To: "dedekind@infradead.org" <dedekind@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Message-ID: <Pt949578826864.08914@send1.inner-21cn.com>
Cc: linux mtd <linux-mtd@lists.infradead.org>
Subject: NAND Flash Device and JFFS2 support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HI Artem,

On 2005-04-20 23:15:01, Artem B. Bityuckiy at dedekind@infradead.org wrote:

>On Wed, 2005-04-20 at 22:47 +0800, carl liao wrote:

>>I back ported mtd snapshot 20050416 codes to 2.4.26 for AMD Au1200.
>>The NAND device could be identified and accessed via /dev/mtd/0.
>>I even could mount /dev/mtdblock/0, copy file to it and umount it. 
>>But there is so many warnings or ecc error messages!
>
>This is not normal that you see "so many warnings or ecc error
>messages". Presumably you have problems with your driver.
>

So I will double check my NAND chip driver first of all.

>>So in order to properly use NAND Flash, how could I format and
>>read/write data to it?
>
>flash_eraseall -j to format.
>
>Please, investigate carefully web site at
>http://www.linux-mtd.infradead.org/index.html
>

Thanks all! I found a good post "Can you really write a jffs2 image with
nandwrite?"
at http://lists.infradead.org/pipermail/linux-mtd/2005-March/012045.html

>>I want to put Linux root file system on the NAND. Is it a right choice?
>
>Depends on your requirements.
>
>JFFS2 is a generally good choice if:
>    * you need on-flight compression
>    * you need unclean-reboot tolerance
>    * your flash isn't large, say, not larger then 64 MiB
>

If I just want to use the NAND /dev/mtdblock/0 as a raw device without JFFS2,
and just put a ramdisk iamge on it, how could I do? Will NTFL help in this
case?

Thanks in advance to all!

Carl Liao
