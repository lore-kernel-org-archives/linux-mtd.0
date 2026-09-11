Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CF0C88E50
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oIGPj9YCfHEBVzH5ddPb1xmDDzyTxLEQZST4tfyZl2c=; b=Hv7/AobJlJw53JqIt68rKYqiIn
	xvYwoKypX3GPIaPlrzAuwnMqsYagH3a4NqTaaRsX9pe8rvl5MMl/VEcuPkSrXiwVp6Y4ukgfKSLLl
	JcNc/v236NE+2C8DTWo7HRZsVY44uwSus691O36iwqibIlq84Wl3De+hrg7q4uKL8J/F2OO4O54r7
	Z8+zIe6yM8Tkwb6fXKp0HKpN2Yn+aRggeqz2ru635JSOxSGa8Y606gvoFTOQGMQSE7WEXVWzih2NL
	NJkwPjK6rdZjf2jnmIf+nEwSZ7j+mGjvMmdQgvfIz91z4kcAw5SQhppV0qDL7AtA5yi30TXAKIwXv
	4yz48y5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51DL-0000000Gjds-3rvA;
	Fri, 11 Sep 2026 13:22:47 +0000
Received: from mail-pj1-x1045.google.com ([2607:f8b0:4864:20::1045])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51DI-0000000GjaA-3VfN
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 13:22:46 +0000
Received: by mail-pj1-x1045.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so1545494a91.3
        for <linux-mtd@lists.infradead.org>; Fri, 11 Sep 2026 06:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789132963; x=1789737763; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqAHaS5fsv9ERkHKe2Kmet0fUHotC014bD2kFqqX4to=;
        b=W5LiO0lNPMkg2/m/MT1qNlltXgtMAOfFcU/TmaIB8J5yMLrIZWl/FMpqDAubeBvPRt
         OhtAPXM1Q9tqIKSMS6FNruczvUwEXdcM6UZzzF5vCKyKmoCMWKlpY1OyzxS/Y6xZ2CMm
         bZM59LOnmk3R1OvumQtGZD4R5sK8joYyT65R048q0wkubQCe27g2SRoijxGm2g7ZlDqX
         ZAZhG9gSVwkkdPkm61J/dvtW57Swbcw22cr9fH2AIfQTY5jj6pyXR/vebpCjBN9R2Q+Q
         nBl5LnL1uxHHuBwHqB1wEMCDaUSVI0EXxrKT4fcfYMeFfR9TzC67lWbxblrpLzELpMAf
         S1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132963; x=1789737763;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqAHaS5fsv9ERkHKe2Kmet0fUHotC014bD2kFqqX4to=;
        b=VM3zVdwgla2ojmihGGOlzGB5W5yE+AIaRFUQL7xa8P6ZNxuVArmAtQLMjaqCqqorgA
         axc7G5UMSR/t5SEicPBmle0gUutOzd3ggrpqBASccTTEs/CQ7XsiKKBR21vV511MsdVX
         xicRmuY3XLeH101Zh9GoBUKoeozhChqiwE4iYBkE030/PnRArG7ZVHk+hcpqz6C/+E2U
         U9QgdzorDJlcJ9NvJjFJfhTz4ancfbW9jTum506A33qTiMpWbxoUZnDSXB3cv2Im+IXp
         CuOrLpoTRSwxueKL4njUyaC0uaCJvmBgBnA2ScToVIPAqv8Cb8BTnWi3ZZzksfb02JEr
         tiwg==
X-Forwarded-Encrypted: i=1; AKwUvBwmpSxLdUamB00wyQd4VJ1JifarK/AFntYWQxdrI5+AtxDFqDcOkhdZ3/c7CfQKJr8ZpAclF30pyXE=@lists.infradead.org
X-Gm-Message-State: AFuF++nYRmQ1hcWN2sNPiOFEyjHWLC2TMbCdXSBxz6tWoy3k80xE0pQJ
	mIFCTKn8v/dAj7BbTLEsTkFlCbcmibkH8B7e71JxYkGoSM5VK9Y5XakEGqiQLG/cJPxi+f982b0
	+1OcaSg==
X-Received: from pjbmv13.prod.google.com ([2002:a17:90b:198d:b0:39d:8dae:7e6d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c89:b0:398:e46e:ade3
 with SMTP id 98e67ed59e1d1-39d9c39625dmr7169956a91.23.1789132962606; Fri, 11
 Sep 2026 06:22:42 -0700 (PDT)
Date: Fri, 11 Sep 2026 06:22:41 -0700
In-Reply-To: <20260911074530.3140830-13-jgross@suse.com>
Mime-Version: 1.0
References: <20260911074530.3140830-1-jgross@suse.com> <20260911074530.3140830-13-jgross@suse.com>
Message-ID: <aqQAodJCAEZyeQ1k@google.com>
Subject: Re: [PATCH v3 12/13] treewide: convert rdmsrq() from a macro to an
 inline function
From: Sean Christopherson <seanjc@google.com>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-edac@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-crypto@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Pu Wen <puwen@hygon.cn>, Tony Luck <tony.luck@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, 
	Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Len Brown <lenb@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	David Airlie <airlied@redhat.com>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Huang Rui <ray.huang@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Perry Yuan <perry.yuan@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Yazen Ghannam <yazen.ghannam@amd.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, Artem Bityutskiy <dedekind1@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Ashok Raj <ashok.raj.linux@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, 
	"Ilpo =?utf-8?B?SsOkcnZpbmVu?=" <ilpo.jarvinen@linux.intel.com>, 
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, Xi Pardee <xi.pardee@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Helge Deller <deller@gmx.de>, xen-devel@lists.xenproject.org, 
	linux-geode@lists.infradead.org, Michael Kelley <mhklinux@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_062244_881076_46722D02 
X-CRM114-Status: GOOD (  14.21  )
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

On Fri, Sep 11, 2026, Juergen Gross wrote:
> Today rdmsrq() is a macro using its second parameter as the target for
> storing the read MSR value.
> 
> Convert rdmsrq() to an inline function returning the MSR value.
> 
> The users have been converted using the following semantic patch:
> 
>   // Options: --include-headers
> 
>   virtual patch
>   virtual report
> 
>   @@
>   expression msr, val;
>   @@
>   (
>   - rdmsrq(msr,val)
>   + val = rdmsrq(msr)
>   )
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Damien Le Moal <dlemoal@kernel.org>      # ATA
> Reviewed-by: Michael Kelley <mhklinux@outlook.com> # Hyper-V
> ---

Acked-by: Sean Christopherson <seanjc@google.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
