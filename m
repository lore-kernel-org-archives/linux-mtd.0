Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh7Zf-0001UR-MN
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 10:39:31 -0500
Message-ID: <438C763C.9060206@ru.mvista.com>
Date: Tue, 29 Nov 2005 18:39:40 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: =?KOI8-R?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20051129180659.6f872e14.vwool@ru.mvista.com>
	<20051129153542.GA1904@wohnheim.fh-wedel.de>
In-Reply-To: <20051129153542.GA1904@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD ioctl interface rework to get rid of
	MEMGETOOBSEL/MEMSETOOBSEL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Agreed, thanks.
However, I think we should return error for MEMSETOOBSEL/MEMGETOOBSEL 
for userland apps to learn they can't change oobinfo any more.

Vitaly

Jörn Engel wrote:

>On Tue, 29 November 2005 18:06:59 +0300, Vitaly Wool wrote:
>  
>
>>diff -uNr linux-2.6.10.orig/include/mtd/mtd-abi.h linux-2.6.10.nand/include/mtd/mtd-abi.h
>>--- linux-2.6.10.orig/include/mtd/mtd-abi.h	2005-11-24 15:58:49.000000000 +0300
>>+++ linux-2.6.10.nand/include/mtd/mtd-abi.h	2005-11-28 17:03:12.000000000 +0300
>>@@ -102,8 +102,7 @@
>> #define MEMUNLOCK               _IOW('M', 6, struct erase_info_user)
>> #define MEMGETREGIONCOUNT	_IOR('M', 7, int)
>> #define MEMGETREGIONINFO	_IOWR('M', 8, struct region_info_user)
>>-#define MEMSETOOBSEL		_IOW('M', 9, struct nand_oobinfo)
>>-#define MEMGETOOBSEL		_IOR('M', 10, struct nand_oobinfo)
>>+#define MEMGETOOBAVAIL		_IOR('M', 10, uint32_t)
>> #define MEMGETBADBLOCK		_IOW('M', 11, loff_t)
>> #define MEMSETBADBLOCK		_IOW('M', 12, loff_t)
>> #define OTPSELECT		_IOR('M', 13, int)
>>    
>>
>
>You really don't want to reuse an old ioctl().  Even removing the code
>to handle an old number breaks binary compatibility.  But changing the
>behaviour will result in silent breakage.
>
>Jörn
>
>  
>
