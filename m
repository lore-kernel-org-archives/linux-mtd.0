Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Undu-0002Ee-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Aug 2001 12:06:22 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B726C90.F8A182F5@jurca.de> 
References: <3B726C90.F8A182F5@jurca.de>  <3B6571F2.6258156D@jurca.de> <30724FF712DFD2119E6200104B244892011974BC@mail1> <12764.997170980@redhat.com> 
To: Jan Debiec <jan.debiec@jurca.de>
Cc: "'linux-mtd@lists.infradead.org '" <linux-mtd@lists.infradead.org>,
    "Alex Lennon @ Arcom" <ajlennon@arcom.co.uk>
Subject: Re: JFFS and RTLinux 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 09 Aug 2001 12:12:13 +0100
Message-ID: <515.997355533@redhat.com>
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

jan.debiec@jurca.de said:
>  unfortunately "stext_lock" tells me nothing (is used in head.S),
> sbc_mediagx_map is a structure used for Arcom GXM board

Spinlock deadlock. Check the spin_lock() and spin_unlock() pairs are evenly 
matched in sbc_mediagx.c (they look like they are in the current version of 
sbc_gxx.c).

$ gdb vmlinux
(gdb) disassemble 0xc01986d3

It should be in a loop which looks something like

0xc0263620 <stext_lock+64>:	cmpb   $0x0,0xc02ccdf8
0xc0263627 <stext_lock+71>:	repz nop 
0xc0263629 <stext_lock+73>:	jle    0xc0263620 <stext_lock+64>
0xc026362b <stext_lock+75>:	jmp    0xc0105b3f <__down+111>

The place it's jumping to in the final line is the place that's trying to 
obtain the (blocked) spinlock. 

--
dwmw2
