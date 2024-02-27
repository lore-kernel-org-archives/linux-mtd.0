Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D337C48BF6
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Feb 2024 01:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwx/YZ7ciBqNlFDOqoZizwDvtkp4nkmy0pDVUcRH5zk=; b=l+wSSG7DP8GmUp
	kT57XmVjuUI7HOQR/AjHr946bfrYF0Iekk5wH1PwmIlaV37fHYXHsDO98DDWuEZL2lPFqUrd8FOWV
	uFu7VnBGze2BoXaC+Pmt7pP7PS9MJH+7XA4bUcDxoS3LSLpKYZd5Cwhn16u26VldCVqbg3wsGW2WK
	tD0mAlyxr66yAUxhtvDRcB8WTCaaAR83MFZut/P3QZjT8rDoGQ6ZSqeN/UIqlvVaSk/EztbO/fiZ0
	1KdCtJy5ylrK8pezLl9I5n87BL3RPc3q0+8Po7AinLVSc/KiBxX9LOD3wpJNIsmh7LowwRftq6Txm
	VDOqbZAKc+mLdyRrWPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1relys-00000003Drj-3qiV;
	Tue, 27 Feb 2024 01:10:02 +0000
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1relyf-00000003Dq6-1hGA;
	Tue, 27 Feb 2024 01:09:59 +0000
Message-ID: <7624c14e-0f5c-435c-9f6e-3d59b4e27aa2@infradead.org>
Date: Mon, 26 Feb 2024 17:09:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Feb 26 (drivers/mtd/ubi/nvmem.c)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mtd@lists.infradead.org
References: <20240226175509.37fa57da@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240226175509.37fa57da@canb.auug.org.au>
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



On 2/25/24 22:55, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20240223:
> 

on powerpc32:

In file included from ./arch/powerpc/include/generated/asm/div64.h:1,
                 from ../include/linux/math.h:6,
                 from ../include/linux/kernel.h:27,
                 from ../arch/powerpc/include/asm/page.h:11,
                 from ../arch/powerpc/include/asm/thread_info.h:13,
                 from ../include/linux/thread_info.h:60,
                 from ../arch/powerpc/include/asm/ptrace.h:342,
                 from ../arch/powerpc/include/asm/hw_irq.h:12,
                 from ../arch/powerpc/include/asm/irqflags.h:12,
                 from ../include/linux/irqflags.h:18,
                 from ../include/asm-generic/cmpxchg-local.h:6,
                 from ../arch/powerpc/include/asm/cmpxchg.h:755,
                 from ../arch/powerpc/include/asm/atomic.h:11,
                 from ../include/linux/atomic.h:7,
                 from ../include/linux/rcupdate.h:25,
                 from ../include/linux/rbtree.h:24,
                 from ../drivers/mtd/ubi/ubi.h:14,
                 from ../drivers/mtd/ubi/nvmem.c:7:
../drivers/mtd/ubi/nvmem.c: In function 'ubi_nvmem_reg_read':
../include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
  222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
      |                                   ^~
../drivers/mtd/ubi/nvmem.c:34:16: note: in expansion of macro 'do_div'
   34 |         offs = do_div(lnum, unv->usable_leb_size);
      |                ^~~~~~
In file included from ../include/linux/build_bug.h:5,
                 from ../include/linux/container_of.h:5,
                 from ../include/linux/list.h:5,
                 from ../drivers/mtd/ubi/ubi.h:13:
../include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
  234 |         } else if (likely(((n) >> 32) == 0)) {          \
      |                                ^~
../include/linux/compiler.h:76:45: note: in definition of macro 'likely'
   76 | # define likely(x)      __builtin_expect(!!(x), 1)
      |                                             ^
../drivers/mtd/ubi/nvmem.c:34:16: note: in expansion of macro 'do_div'
   34 |         offs = do_div(lnum, unv->usable_leb_size);
      |                ^~~~~~
../include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
  238 |                 __rem = __div64_32(&(n), __base);       \
      |                                    ^~~~
      |                                    |
      |                                    int *
../drivers/mtd/ubi/nvmem.c:34:16: note: in expansion of macro 'do_div'
   34 |         offs = do_div(lnum, unv->usable_leb_size);
      |                ^~~~~~
../include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'int *'
  213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
      |                            ~~~~~~~~~~^~~~~~~~




-- 
#Randy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
