Received: from [61.152.250.208] (helo=webmta.etang.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Bmpb-0005g4-00
	for <linux-mtd@lists.infradead.org>; Sun, 26 May 2002 02:28:25 +0100
MIME-Version: 1.0
Message-Id: <3CF03966.16945@mail-smtp2>
Date: Sun, 26 May 2002 09:24:54 +0800 (CST)
From: g_friend@etang.com
To: linux-mtd@lists.infradead.org
Subject: =?gb2312?B?aG93IHRvIG1ha2UgYSByb290IGZpbGUgc3lzdGVtIG9uIGRvYz8=?=
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

I have build doc support in my new kernel . then I wantto make a root system on doc.
I make a mini system with the tools "build" from m-sys driver package.
then I modified the /etc/lilo.conf:
install=/boot/boot.b
prompt
timeout=50
message=/boot/message
default=linux
image=/boot/vmlinux-2.4.2-2
     label=linux
      read-only
      root=/dev/hda5
image=/boot/bzImage-doc
     label=doc
      read-only
      root=/dev/hda5
image=/boot/bzImage-doc
     label=bootfromdoc
      read-only
      root=/dev/nftla1
I  have test it .If I select "doc" label ,every is ok.I can find /dev/nftla1 ,can write /read it.
but If I select "bootfromdoc" , I get some trouble.
afer loading kernel , the initialization of kernel seems fine. but when it enter the initab part, It cannot pass e2fsck, then immediately reboot . Because I dont know how I can get the output of boot information in this situation ( normally after boot, I use dmesg)
so , after many times'reboot  ,I gather only a litte information: bad magic number in superblock when trying to open /dev/nftla
how can I get over this problem ?
or how you guys make your fine root file system?







-----------------------------------------
买虚拟主机送国际域名及邮箱
http://www.999k.net
亿唐生活品牌第一主打
http://bag.etang.com/payment_1.htm
亿唐短信，您贴身的时尚顾问
http://sms.etang.com
美国大学之门为你而开 百分百拿奖学金
http://campus.etang.com/html/academic/usa/scho/scho017.htm                                    
