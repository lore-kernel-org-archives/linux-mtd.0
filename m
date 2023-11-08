Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAF7C04E88
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 15:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owGksEoUqG7C4FQCbcBb7e80+DI4XXdb9mkQXwZyuXg=; b=QaKde4v0bAhDZi
	JVcUUyCuJJe4JDvHb1L15lfXsiRINZSb6tE6vV+xwi031JY56bQvP/6O6UoJV0obDccbEFVX51EP9
	yKmA+gVwyCsHejfHqdo3zRgxnFziU0RKDCwLpu9HJzTf9GPSZJfqvwJDXuHMnWoi8q/ZaFTcgrdpi
	4hRI3EyV3bMmoqTD8rGTBpvF+tTm7FudRZHVeuHmdL5bSOv04SoB0p8QnyN4t/2CvioMqtxzX89Z1
	wwRn7DEWah4tCS3yqG7yjUyp7+PG/6bCzlFYUqIUurYb/dGXZXaZwcBBBdIYlevQHM6kIKQhbAsYz
	J3PMz/R+OWibIvqCsa6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kCj-0049jJ-2c;
	Wed, 08 Nov 2023 15:10:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kCg-0049hS-0c;
	Wed, 08 Nov 2023 15:10:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF810615FF;
	Wed,  8 Nov 2023 15:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8E3C433CC;
	Wed,  8 Nov 2023 15:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699456248;
	bh=ubRWv4gCHYtZyc/7EUxKBrb1M8Jq2gNnH2Iv89hahkg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V4wNromlDBNArj+XlVHbk1Tpho83VHKj4KF3u+g8D/gDHOgmbzk9TF5F0k0bfjyJ5
	 QAa+SJ1H1vdt9z6QLXRKqy3OD3OdIvi0IIM6oR9t+f/Qou1n/kmZp3N4Ld5+Em6SUX
	 C152TcjhS6BX54Dd5mExY/uqbFmfwaVKqqV5higpeeV5QYXEeI2g8nKEM8QO7JpfaW
	 oYvzN3/QTGIj+pp0Nd5j3aFNPnFwrr1RCnhA/mv97Odgb/1aJ2xdCVJdaJgtaQHSY0
	 fqhoFzKt0Xnl3SB0XmmHuBK+2Zwe0i1mRrDK0QRCpnefsPz2sjmCZbZODNGq5w3ycl
	 CDBBZ1wKet15w==
Date: Wed, 8 Nov 2023 07:10:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Geoff Levand <geoff@infradead.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Masahiro Yamada
 <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Guo Ren <guoren@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Michal Simek
 <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh
 Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Palmer Dabbelt <palmer@dabbelt.com>, Heiko
 Carstens <hca@linux.ibm.com>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Helge Deller
 <deller@gmx.de>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Timur Tabi <timur@kernel.org>,
 Kent Overstreet <kent.overstreet@linux.dev>, David Woodhouse
 <dwmw2@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Anil S
 Keshavamurthy <anil.s.keshavamurthy@intel.com>, Kees Cook
 <keescook@chromium.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>,
 Al Viro <viro@zeniv.linux.org.uk>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-bcachefs@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 17/22] powerpc: ps3: move udbg_shutdown_ps3gelic
 prototype
Message-ID: <20231108071044.6abdf09e@kernel.org>
In-Reply-To: <1b3ccc4a-41f7-46ad-9c5c-5ef44a96426e@infradead.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
	<20231108125843.3806765-18-arnd@kernel.org>
	<1b3ccc4a-41f7-46ad-9c5c-5ef44a96426e@infradead.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_071050_384440_9B2FE21C 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 8 Nov 2023 14:18:09 +0000 Geoff Levand wrote:
> Seems good to me.  I'll test it next chance I get.
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>

Seems like this is best routed via powerpc:

Acked-by: Jakub Kicinski <kuba@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
