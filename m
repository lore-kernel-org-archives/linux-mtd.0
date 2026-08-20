Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260BCC5DF81
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 06:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SP9jkkJ2Ky6CMOa6OwywJjwxYm9fGxyrcYRkB58+t5U=; b=mS1y0wxdnoDSmD
	7H1Qvp8cfxWrK8RTwXZZYmdvnjd4Md+AwhAC0wbG4xTsGVl0W8fRfK8s4+NLRIGh//evRJU2HRyFV
	AoRChHBm1HCr0TIyccBuaFcDCM+8ho1eLaH3R70PpTbQeMIqi5OzZcdeVwCPaddv7GbySaOxsaid7
	fWB73a/Uy0PYEMB5a8Ho2IRK7no1Ltwqy2o3f3/2apHyCWNfVWr/ugRvGUW7ib4mBYhYXe3JaxzWW
	uL+e97sAisoWDAeyJW6r9D3HtHc89yEwKgUmWh6GxFeiwVBtN/Kd51YVCAPsGs1JDRSzR7ozgUIeV
	i+qzhlYzmBLk/dUq/LuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvv2-0000000AuXy-0hpX;
	Thu, 20 Aug 2026 06:06:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvv0-0000000AuXl-0YmI;
	Thu, 20 Aug 2026 06:06:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4954360A84;
	Thu, 20 Aug 2026 06:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 106F71F000E9;
	Thu, 20 Aug 2026 06:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787205985;
	bh=8Ul4LcNKNGu0Z584PICkjX7+P+obMk+pMAEdlAEtBLc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=n7FFTwj85oHM8+Z0bncLFNY9/eW5UxEc3LeFSPwVmM/J0yU3NCrZjNz2zCIEYZwLE
	 VkUDYV1ptH6tax/0F1oXiJjDiE4SC7hgcWjk/xP+EHEssecT4QfZMP4aTD2PVsDkB/
	 PHZc88roAXGNSFiQUibZJ0cNvxEnz09z/agN4p5AbkwKKXMWc8TIrdxjcPbruKZSKu
	 3OPsCjNo23WGFwZ6ajg3ye5CpkwpwGndpwB3CJOPi5MYLZRxkxBpTyt0laVyIVRSIA
	 t9R0jcmDR/EPUk7IXvEelvCevQFSUrNEUzW4iSTQEsCRum1JwmrzWQUfF/uSY/YiLe
	 LHO1ski2SQNRg==
Message-ID: <21d31639-4d16-4ee2-8ff3-18877636aa8b@kernel.org>
Date: Thu, 20 Aug 2026 15:06:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] treewide: convert rdmsrq() from a macro to an
 inline function
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linux-perf-users@vger.kernel.org,
 linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux.dev, linux-edac@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-ide@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-mtd@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-fbdev@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Pu Wen <puwen@hygon.cn>, Tony Luck <tony.luck@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 Babu Moger <babu.moger@amd.com>, Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Len Brown <lenb@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 David Airlie <airlied@redhat.com>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Viresh Kumar <viresh.kumar@linaro.org>, Huang Rui <ray.huang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Ashok Raj <ashok.raj.linux@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Helge Deller <deller@gmx.de>,
 xen-devel@lists.xenproject.org, linux-geode@lists.infradead.org
References: <20260819102314.1499258-1-jgross@suse.com>
 <20260819102314.1499258-13-jgross@suse.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20260819102314.1499258-13-jgross@suse.com>
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

On 8/19/26 19:23, Juergen Gross wrote:
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

For the ata bits,

Acked-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
