Received: from [61.152.250.172] (helo=webmta2.etang.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17NaQ5-0003zS-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2002 15:38:49 +0100
MIME-Version: 1.0
Message-Id: <3D1B22F2.18643@webmta2>
Date: Thu, 27 Jun 2002 22:36:34 +0800 (CST)
From: g_friend@etang.com
To: linux-mtd@lists.infradead.org
Subject: =?gb2312?B?SG93IHRvIENsZWFuIGJhZCBHcnViZmlybXdhcmUgb2ZmIERPQz8g?=
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

>Since you cannot boot with the doc2000 installed, I'd recommend trying the 
>following, **very carefully**:
>  1. Turn off system
>  2. Remove DoC from board (I assume it's an ISA/PCI board with DoC socketed?)
>  3. Install *empty* DoC board
>  4. Boot into DOS
>  5. Install latest M-Sys DOS utilities (if not already done)
>  6. *** CAREFULLY *** install DoC into socket
>  7. Run DFORMAT utility to replace grub firmware
>*Disclaimer:  This procedure has worked for me, but it could do *bad things* 
>to your DoC.  Use it only as a last resort.

By saying above ,do you mean "hot plug" ?

>If your machine supports "Network" boot, you may want to try configuring GRUB 
>with the "--enable-diskonchip-biosnetboot" option.  This will allow you to 
>selectively boot from the DoC, returning to booting from a hard drive or 
>floppy when needed.
Sorry I am not familiar with GRUB .I just do something after the readme . 
So, I cannot understand what's the meanig completely .
Do you mean that I can install a grub on my harddisk with "network " option ,then install DOC ,then I can boot from harddisk with DOC in my board ? 









-----------------------------------------
买虚拟主机送国际域名及邮箱
http://www.999k.net
亿唐生活品牌第一主打
http://bag.etang.com/payment_1.htm
亿唐短信，您贴身的时尚顾问
http://sms.etang.com
美国大学之门为你而开 百分百拿奖学金
http://campus.etang.com/html/academic/usa/scho/scho017.htm                                    
