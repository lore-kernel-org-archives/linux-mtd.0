Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A277C4707B
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jan 2024 20:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8A8UW10csaKvuMsMHyh6MZ1MZeY3v2SAl8JBFn0FqE4=; b=EdoHno811SSLMA
	+8wNAs4eaV2o3gnITtP7IP2k1tRxM8w8c3dRSStkS79YHrewwcjMtfxoy90KRKrSsyt68WO6x7L+z
	3P5PZJiVj037mKrx+Ab87e1fTJMqVETarFJOf7z0LM+Txwz9k+Z7QcU9MTRmNzOh1ik9cfeUy8b0o
	mdmgIF04yFHhdKouQS2AQbrrrnfeZ0Vn0iFG0JZBei16x0r0GAm86jY1NePuukz+Tx1OP2NoylghA
	Hj1IYZ2e4e/6rqDcPVONsL4rA2d1dRsY5w/rUpZQGdOfv7og3zSJCVTegdldaxszZTm+Ei2SLH1kI
	hHYf34nHzatommsy7VxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNfQr-00E5OB-0x;
	Wed, 10 Jan 2024 20:44:13 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNfQn-00E5Kt-1v
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jan 2024 20:44:10 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 1864C580ACA;
	Wed, 10 Jan 2024 15:44:04 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 10 Jan 2024 15:44:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1704919444; x=1704926644; bh=swCJD9Fvop
	hNa/YkfcNjNrylvPuJdTYmLEobiCsz9KQ=; b=KWnMut0tt2cIG/amb4AXGI5g8w
	YoCQshQyMCD7PX1QHoaWnhx8BmDenZ13YFz0Q4oWEGwQziz58V/PuWWsRKpr4az6
	3TPX50+gs88afAypjeSE13kGIrQ3OEttOSWf/K+g0PAKgJaLHlTeCu85jjYjsc+e
	om4sYKVwBB2Gxa49uQdH+Z4KKOzSbPrH3A8CbfrIMu93271HA5XmO534EJAN7tel
	8kkoTj8BtG4yF3FmVqPUuu3UzTaIK0qstUExFmGa7RPFtUn7SLqq2/C6pQxbmNs0
	sqgwZEcIR2vHgCFG0D9hf8QEICU2tZM43LubweRGEI33P6NHNtD8ZxoLwxgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704919444; x=1704926644; bh=swCJD9FvophNa/YkfcNjNrylvPuJ
	dTYmLEobiCsz9KQ=; b=EXwWXkvvpnzWDZJ8zWZ4YSDRAy1pijyf4PqvHWBwyITV
	7b0Q6JQ9rJKeGQM5QP0wePvrCc9tJT3sGtmQ86bKTrPGCy8FFcudtpbOcMrDORKF
	MV0jI3A39lpJ/WqA2PWNIgOuYaCtOOWx+bJ3PdRnpOzZoPgsrCLn4Ym673cQNmil
	/Heoj6JgIeuCrtAUjR8I31wnDEwbw1MJ27N0BVslb3vL5NoeIgyfQ1aQG+w+XT8m
	UQRaDfMD+9rdyAgHJJzO3pGRtIa4eMpdwE7Dm9Ye1WWXYwZHvR1weYmeZFSkNCyX
	e3hOvm01aKeaxwTQ2mO0Rq76NNyPDPa/FzKHOP81qw==
X-ME-Sender: <xms:kQGfZU8PlM7CA0aYK4V6brNP6R0d-zxdQJ1P3IxWYzfnex5J1NLJ3Q>
    <xme:kQGfZcualeFJQYSYSx3XzEPC3UMwFQk3uY8lZJt040GkYS2RxvSbljuRnElArHrJg
    7psyMHAF2iDoupcp3c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeiuddgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:kQGfZaCiSSrv3HJIjW5lrIlpJBs13VbbS-aW4LFRoMspyJTWIsB6Pg>
    <xmx:kQGfZUdq2Rm9UmEj06v-BC3916J0934HbGLgr2_jP14x35GiAeAsbA>
    <xmx:kQGfZZPOxR7MLcGy09RbjxNxZZ2XJR_bdXbzXGquNFT9yhSOF-CyXg>
    <xmx:lAGfZZKrTcf0Bt-eKNY4pGrAfMPlN32u2wpFiIhGjkd3ET5RsOprnw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C88EEB6008D; Wed, 10 Jan 2024 15:44:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1374-gc37f3abe3d-fm-20240102.001-gc37f3abe
MIME-Version: 1.0
Message-Id: <7a79c037-ac91-448a-b6e0-b38cacccd971@app.fastmail.com>
In-Reply-To: <ab94f844-a4ec-4b4f-b67b-2b67347596d9@roeck-us.net>
References: <20231123110506.707903-1-arnd@kernel.org>
 <20231123110506.707903-7-arnd@kernel.org>
 <ab94f844-a4ec-4b4f-b67b-2b67347596d9@roeck-us.net>
Date: Wed, 10 Jan 2024 21:43:40 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Matt Turner" <mattst88@gmail.com>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>,
 "Peter Zijlstra" <peterz@infradead.org>, "Rich Felker" <dalias@libc.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Richard Weinberger" <richard@nod.at>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-alpha@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 sparclinux@vger.kernel.org, x86@kernel.org,
 "Kees Cook" <keescook@chromium.org>,
 "Palmer Dabbelt" <palmer@rivosinc.com>
Subject: Re: [PATCH v3 6/6] Makefile.extrawarn: turn on missing-prototypes globally
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_124409_726411_847E8545 
X-CRM114-Status: GOOD (  14.97  )
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

On Wed, Jan 10, 2024, at 20:45, Guenter Roeck wrote:
> On Thu, Nov 23, 2023 at 12:05:06PM +0100, Arnd Bergmann wrote:
>> At this point, there are five architectures with a number of known
>> regressions: alpha, nios2, mips, sh and sparc. In the previous version
>> of this patch, I had turned off the missing prototype warnings for the 15
>> architectures that still had issues, but since there are only five left,
>> I think we can leave the rest to the maintainers (Cc'd here) as well.
>> 
>
> Not sure I understand why this was so important that it warrants the
> resulting buildtest failures.
>
> FWIW, I'll disable WERROR in my build tests for the affected architectures.
> That is kind of counter-productive, but the only real alternative would be
> to stop build (and sometimes, such as for ppc, runtime) tests entirely,
> which would be even worse.

If you prefer, I can go back to the older version and just disable
the warning for the architectures with defconfig build failures. I did
a lot of fixes for mips, so at least defconfig and allmodconfig
should be fine now, leaving only alpha, nios2, sh and sparc as
far as I can tell, at least once Linus merges the asm-generic
pull request hat has a bunch of the currently missing fixes.

   Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
