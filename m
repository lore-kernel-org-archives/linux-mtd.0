Received: from [61.154.22.38] (helo=star-net.cn)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BAm2q-0002qM-IQ
	for linux-mtd@lists.infradead.org; Tue, 06 Apr 2004 09:34:57 +0100
Received: from star-net.cn ([218.66.82.211])
	(authenticated user xieh@star-net.cn)
	by star-net.cn (star-net.cn)
	(Cipher TLSv1:RC4-MD5:128) (MDaemon.PRO.v7.0.1.R)
	with ESMTP id md50000140528.msg
	for <linux-mtd@lists.infradead.org>; Tue, 06 Apr 2004 16:34:27 +0800
Message-ID: <40726B93.2070000@star-net.cn>
Date: Tue, 06 Apr 2004 16:34:27 +0800
From: "hongfei.hsieh" <xieh@star-net.cn>
MIME-Version: 1.0
To: =?GB2312?B?197Tpsur?= <zouys@star-net.cn>
References: <LAW10-OE52lqKV6aGHW00002bd6@hotmail.com>
	<001c01c41ba9$f3aa1710$050ca8c0@zys>
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
cc: mtdlist <linux-mtd@lists.infradead.org>
cc: jffs <jffs-dev@axis.com>
Subject: Re: Cannot open root device "mtdblock0" or 1f:00
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

×ÞÓ¦Ë« wrote:

>Hi,
>
>Maybe your mtdblock0 fs can not be mounted. Could you boot from nfs instead of mtd and then mount mtdblock0 on a dir to find the problem?
>
>zouys,
>2004.4.6.
>
>----- Original Message ----- 
>From: "Kishore" <kishoreseera@hotmail.com>
>To: "jffs" <jffs-dev@axis.com>; "mtdlist" <linux-mtd@lists.infradead.org>
>Sent: Tuesday, April 06, 2004 2:41 PM
>Subject: VFS: Cannot open root device "mtdblock0" or 1f:00
>
>
>  
>
>>Hi Friends,
>>
>>                    I'm trying to boot the embedded linux from flash using
>>ROLO boot loader. I'm getting the following errors while booting. My target
>>is Elan SC520 CDP board.
>>
>>the errors are as follows.
>>
>>VFS: Cannot open root device "mtdblock0" or 1f:00
>>
>>Please append a correct "root=" boot option
>>
>>Kernel panic: VFS: Unable to mount root fs on 1f:00
>>
>>                                                        Can anybody pls
>>explain me what is the mistake and what can be the possible cause for the
>>above errors. pls gimme a solution to avoid the above problem. Also what
>>should be the correct boot option.
>>
>> Your earliest reply would help me a lot.
>>
>>
>>Thanks in advance.
>>
>>with Regards,
>>Kishore.S.
>>
>>To unsubscribe from this list: send the line "unsubscribe jffs-dev" in
>>the body of a message to majordomo@axis.com
>>    
>>
>>------------------------------------------------------------------------
>>
>>______________________________________________________
>>Linux MTD discussion mailing list
>>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>    
>>
please mount mtdblock1 instead of mtdblock0, the mtdblock0 refer to the
entire flash!!
