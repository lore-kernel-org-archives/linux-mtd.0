Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE24C61D92
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Nov 2023 14:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYT4DmTETL4xVbzlNRDecUoZdixdNjde/sHKEehFvXw=; b=4aBrNQd0M+Sm7B
	Y5kOLNMA6Ki8h/J3O9cW3Wikn7wuj2TEqY5PWvu3srxY1NWk0aUrNMzvOxzugNh40nE0Jw3E2B20X
	qyMXQrGh8y+GQEllJ6MF2hkYmWScEqDvvJO8fiwwyGz7JfMjMKNPibouShgCyqr46Z5OPNWWJIxSP
	2VpssqPY6OCTZfhNzu0ocA+jG6Im3mLGPK7okolsW3uAKTLu3ICLuHTBSmIgiFHh3+UqGyey3JQZH
	sLzx7NtPWPsshBir612xvvR+bDLFElYt+aSucPhaKqLRkK/zKtdZZoym4jH213GYzp9W+L/SkWdqE
	2scqO5PvQUiFv5hvwkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5S7M-00H4yp-2R;
	Tue, 21 Nov 2023 14:52:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5S7I-00H4xR-22;
	Tue, 21 Nov 2023 14:52:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4FC25CE1BC6;
	Tue, 21 Nov 2023 14:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580D7C433C7;
	Tue, 21 Nov 2023 14:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700578360;
	bh=dGYz6IxNOUY4NpvhlMLeIB3Xxc/hARJYIHJyki7wDHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=poue5VPWyYd+HrTAPC2kL1JwV02FvsHlUJ1z3W9FXk/U2czUqklkcawHdmmtSEsoY
	 IlPddu/gpJsZ1UpOPQIgrM7BkkvyXf2F3hIfHrb2U18/fsMMvTR4wCzYJDyNBuBtzP
	 SpQfWPT1cgV1qEShQyzt0KdJxLEsOUDx610rqzSQ=
Date: Tue, 21 Nov 2023 15:12:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Guo Ren <guoren@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
	Helge Deller <deller@gmx.de>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Timur Tabi <timur@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	David Woodhouse <dwmw2@infradead.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Kees Cook <keescook@chromium.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-bcachefs@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 20/22] usb: fsl-mph-dr-of: mark fsl_usb2_mpc5121_init()
 static
Message-ID: <2023112114-cried-ramble-b3f9@gregkh>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-21-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231108125843.3806765-21-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_065245_122332_74DE7201 
X-CRM114-Status: GOOD (  11.85  )
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

On Wed, Nov 08, 2023 at 01:58:41PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This function is only called locally and should always have been static:
> 
> drivers/usb/host/fsl-mph-dr-of.c:291:5: error: no previous prototype for 'fsl_usb2_mpc5121_init' [-Werror=missing-prototypes]
> 
> Fixes: 230f7ede6c2f ("USB: add USB EHCI support for MPC5121 SoC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
