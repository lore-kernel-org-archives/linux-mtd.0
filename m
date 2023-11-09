Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1C7C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 01:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDrrbOC0Z1WRlTG+vJP/Sm2AKMbEOFMYhDO9tv00TgE=; b=eroVexk4SgF9f5bKZk3+Yzue5M
	ItvADhFUYSVZy+yIh1mWIHRw2IAB4ZoXJgo9yR8AP2JqaDNd68ToUWtgWWRQnVcdyKKHwFIBMDVUT
	MvdGHxmZhiw5u2qvMhsARHhKXut0AcTTXFdAmDP4+Hg2iVA2HyLnChbPrEETzmumQDurr3OtO0dti
	/Pc5aqie2068nHsjI6aAU7X6JxKrvor6vUxl489GkWwCnDQcCS1XC7kUUm65P1Y3iYqZb0TCkk0C0
	A5COA2EDPPhtl6b4gMNHzZ48QNmvVg0lAxDpuewDvc3EXpSkT8l6qM1cTjSlgN6w2d1hl4v2N3pj3
	vuBwxUqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0tX6-0052p2-1O;
	Thu, 09 Nov 2023 01:08:32 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0tX1-0052mn-0K;
	Thu, 09 Nov 2023 01:08:29 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SQkN45Xx2zfb3S;
	Thu,  9 Nov 2023 09:08:04 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 9 Nov 2023 09:07:44 +0800
Subject: Re: [PATCH 02/22] [RESEND^2] jffs2: mark
 __jffs2_dbg_superblock_counts() static
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>, Masahiro Yamada
	<masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet
 Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Guo Ren <guoren@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>, Huacai Chen
	<chenhuacai@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Michal Simek
	<monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh
 Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>, John Paul Adrian Glaubitz
	<glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, Andy
 Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, <x86@kernel.org>, Helge Deller <deller@gmx.de>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Timur Tabi <timur@kernel.org>, Kent Overstreet
	<kent.overstreet@linux.dev>, David Woodhouse <dwmw2@infradead.org>, "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>, Anil S Keshavamurthy
	<anil.s.keshavamurthy@intel.com>, Kees Cook <keescook@chromium.org>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Nathan Chancellor
	<nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas
 Schier <nicolas@fjasle.eu>, Al Viro <viro@zeniv.linux.org.uk>,
	=?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
	<linux-alpha@vger.kernel.org>, <linux-snps-arc@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-csky@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-m68k@lists.linux-m68k.org>, <linux-mips@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-bcachefs@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Tudor
 Ambarus <tudor.ambarus@linaro.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-3-arnd@kernel.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <cf3724db-e130-01f2-c41e-f2f1e88fc1a8@huawei.com>
Date: Thu, 9 Nov 2023 09:07:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20231108125843.3806765-3-arnd@kernel.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_170827_474214_5F20DA39 
X-CRM114-Status: GOOD (  13.29  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyMy8xMS84IDIwOjU4LCBBcm5kIEJlcmdtYW5uINC0tcA6Cj4gRnJvbTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KPgo+IFRoaXMgZnVuY3Rpb24gaXMgb25seSBjYWxsZWQgbG9j
YWxseSBhbmQgZG9lcyBub3QgbmVlZCB0byBiZQo+IGdsb2JhbC4gU2luY2UgdGhlcmUgaXMgbm8g
ZXh0ZXJuYWwgcHJvdG90eXBlLCBnY2Mgd2FybnMgYWJvdXQKPiB0aGUgbm9uLXN0YXRpYyBkZWZp
bml0aW9uOgo+Cj4gZnMvamZmczIvZGVidWcuYzoxNjA6NjogZXJyb3I6IG5vIHByZXZpb3VzIHBy
b3RvdHlwZSBmb3IgJ19famZmczJfZGJnX3N1cGVyYmxvY2tfY291bnRzJyBbLVdlcnJvcj1taXNz
aW5nLXByb3RvdHlwZXNdCj4KPiBSZXZpZXdlZC1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1i
YXJ1c0BsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+Cj4gLS0tCj4gICBmcy9qZmZzMi9kZWJ1Zy5jIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pClJldmlld2VkLWJ5OiBaaGloYW8gQ2hl
bmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
