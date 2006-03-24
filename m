Received: from fmmailgate04.web.de ([217.72.192.242])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FMgXK-0002p2-NG
	for linux-mtd@lists.infradead.org; Fri, 24 Mar 2006 02:16:46 -0500
Received: by fmmailgate04.web.de (8.12.10/8.12.10/webde Linux 0.7) with SMTP
	id k2O7GQW4016165
	for <linux-mtd@lists.infradead.org>; Fri, 24 Mar 2006 08:16:39 +0100
Date: Fri, 24 Mar 2006 08:16:39 +0100
Message-Id: <459451265@web.de>
MIME-Version: 1.0
From: Mirco Fuchs <mircofuchs@web.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Subject: 2.6.16 compile error with latest cvs mtd source
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for your fast reply.

>> Hello,
>>>
>> i have a problem compiling the 2.6.16 kernel for my csb637 board. I think this
>> is an mtd related question because it works without patching the kernel
>> against the mtd source code.
>>
>> I have gcc 3.4.4 and binutils 2.16 and glibx 2.3.5.
>>
>> The first step was compiling the 2.6.16 kernel without patching against the
>> mtd cvs sources. --> The compilation was successfull.
>>
>> But patching the kernel against the head of the mtd cvs repo resulted in the
>> following warnings and errors:
>>
>> (I used the command 'patchkernel.sh -2cyv $KERNELDIR' for patching)

>Did you enable CONFIG_OBSOLETE_INTERMODULE in your .config? That was
>added in the 2.6.16 kernel because the inter_module stuff should
>really go away sometime.

>Alternatively, the MTD subsystem should also probably select that
>Kconfig option so users don't see this. But MTD needs a sync anyway.

I do not find CONFIG_OBSOLETE_INTERMODULE in my .config file, is there a
patch concering this?

Mirco
______________________________________________________________
Verschicken Sie romantische, coole und witzige Bilder per SMS!
Jetzt bei WEB.DE FreeMail: http://f.web.de/?mc=021193
