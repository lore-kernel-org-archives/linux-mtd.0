Received: from mail.milliontech.com ([210.17.151.186])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AU1xm-0008H1-1o
	for <linux-mtd@lists.infradead.org>; Wed, 10 Dec 2003 10:53:02 +0000
Message-ID: <3FD6FADC.5030601@milliontech.com>
Date: Wed, 10 Dec 2003 18:52:12 +0800
From: Martin Chan <martinc@milliontech.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <3FD6D5C3.4000507@milliontech.com>
	<1071048770.5712.19.camel@hades.cambridge.redhat.com>
In-Reply-To: <1071048770.5712.19.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: can't mount DOC2000 with jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

>On Wed, 2003-12-10 at 16:13 +0800, Martin Chan wrote:
>  
>
>>I have tried a whole day but still can't mount the DOC2000 "MD2202-D64"
>>with jffs2. Please advise.
>>    
>>
>
>Use drivers/mtd/nand/diskonchip.c not drivers/mtd/devices/doc2000.c
>
>  
>
How can I use drivers/mtd/nand/diskonchip.c instead of 
drivers/mtd/devices/doc2000.c?

I have patched it to linux-2.6.0-test11,  however, I get the following 
errors when compling the kernel. Does it support linux-2.6.0? I'll try 
Linux-2.4.23 later. Thanks,

  CC      drivers/mtd/devices/blkmtd.o
drivers/mtd/devices/blkmtd.c:30:25: linux/iobuf.h: No such file or directory
drivers/mtd/devices/blkmtd.c: In function `read_pages':
drivers/mtd/devices/blkmtd.c:107: `kdev_t' undeclared (first use in this 
function)
drivers/mtd/devices/blkmtd.c:107: (Each undeclared identifier is 
reported only once
drivers/mtd/devices/blkmtd.c:107: for each function it appears in.)
drivers/mtd/devices/blkmtd.c:107: parse error before "kdev"
drivers/mtd/devices/blkmtd.c:117: `kdev' undeclared (first use in this 
function)
drivers/mtd/devices/blkmtd.c:117: warning: implicit declaration of 
function `to_kdev_t'
drivers/mtd/devices/blkmtd.c:121: warning: implicit declaration of 
function `alloc_kiovec'
drivers/mtd/devices/blkmtd.c:138: dereferencing pointer to incomplete type
drivers/mtd/devices/blkmtd.c:139: dereferencing pointer to incomplete type
.....
....
snip
.....
.....
drivers/mtd/devices/blkmtd.c:1012: parse error before string constant
drivers/mtd/devices/blkmtd.c:1012: warning: type defaults to `int' in 
declaration of `__setup'
drivers/mtd/devices/blkmtd.c:1012: warning: function declaration isn't a 
prototype
drivers/mtd/devices/blkmtd.c:1012: warning: data definition has no type 
or storage class
drivers/mtd/devices/blkmtd.c:1013: parse error before string constant
drivers/mtd/devices/blkmtd.c:1013: warning: type defaults to `int' in 
declaration of `__setup'
drivers/mtd/devices/blkmtd.c:1013: warning: function declaration isn't a 
prototype
drivers/mtd/devices/blkmtd.c:1013: warning: data definition has no type 
or storage class
drivers/mtd/devices/blkmtd.c:1019: parse error before "init_blkmtd"
drivers/mtd/devices/blkmtd.c:1020: warning: return type defaults to `int'
drivers/mtd/devices/blkmtd.c:1057: warning: type defaults to `int' in 
declaration of `module_init'
drivers/mtd/devices/blkmtd.c:1057: warning: parameter names (without 
types) in function declaration
drivers/mtd/devices/blkmtd.c:1057: warning: data definition has no type 
or storage class
drivers/mtd/devices/blkmtd.c:1058: warning: type defaults to `int' in 
declaration of `module_exit'
drivers/mtd/devices/blkmtd.c:1058: warning: parameter names (without 
types) in function declaration
drivers/mtd/devices/blkmtd.c:1058: warning: data definition has no type 
or storage class
make[3]: *** [drivers/mtd/devices/blkmtd.o] Error 1
make[2]: *** [drivers/mtd/devices] Error 2
make[1]: *** [drivers/mtd] Error 2
make: *** [drivers] Error 2
