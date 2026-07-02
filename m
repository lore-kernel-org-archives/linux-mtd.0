Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B85CC43327
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdCNK4jZpICTmGzWp8OAVY6d5jwWvXxZL1nVpNK5Iuk=; b=L++7JYMyPJC6mW
	4QTP8p3KUe5TGboXeLqHbSBXQog5hGBXurFyEpaQeeWitTfZCyGYA368PL7KVVkOGGgaSqLxJryA4
	O1pHs53lX9nEUQwjTfQW/a5FyrLxL3I0McmLLMqGKmXTStXL3gRN/i3PoHmJ9G+M56bEZfWz6fPU9
	FxCo5J1jUmyx0h1436l5f5jhoMxuyVfaYyDVsysj5UJV1kZKLerJOQTwhsiW2zPCp0F/e67Odxxt1
	btxz5K61fG37nLgHbd/nLtOspxmMxQxX40O/R5i3evApfudmLq+ZwkqEvz0pALY/6ZdmnF+WZoOwr
	KdiriFLPmYC7VveRQTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEKt-000000048GT-04ZZ;
	Thu, 02 Jul 2026 10:07:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEKa-000000048G8-0Pz5;
	Thu, 02 Jul 2026 10:07:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 478A46001D;
	Thu,  2 Jul 2026 10:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4E71F000E9;
	Thu,  2 Jul 2026 10:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782986859;
	bh=rYlxsT3EfvvJVMSpiElkKSMRxs3TOqthCAywxBW0128=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AUJ2SDXvs0VEdi5h/Kivbi3brTHkQLZzOc+/NAV87+f7C+JbSJugMOeorpgT3tHNL
	 p58+v4CbXSREtEJG3hLwTa5n8p6G+p8Uf6kuVPNIUtEb3lILgd1rLCgiUeDjzt2+mZ
	 zGpUePOrV+YiczwnsZiA+nTEa+dq7dVC2Ri5VUVSthC4z19IRHYTorV302BUc8jnc8
	 lzbpbbTR/gUCNSPcKQ4CL0UIE7YEz9VRE1nLkcyV3m++qYsnaX7iOq8PztYSNv6FrO
	 w1VeEKbpH/fT7kvqY9QrCvgHPHHPFXTLBTuAr9eAkNY5WqMk3S9O4fQkBovR+Lq+yS
	 W5zmwAV0MlSzg==
Date: Thu, 2 Jul 2026 12:07:15 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	x86@kernel.org, linux-acpi@vger.kernel.org, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-pci@vger.kernel.org,
	virtualization@lists.linux.dev, linux-ide@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-hyperv@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-mtd@lists.infradead.org,
	platform-driver-x86@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	"lukasz.luba@arm.com" <lukasz.luba@arm.com>,
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>, Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Pu Wen <puwen@hygon.cn>, Bjorn Helgaas <bhelgaas@google.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
	Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, Dave Airlie <airlied@redhat.com>,
	Helge Deller <deller@gmx.de>, linux-geode@lists.infradead.org,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, Guenter Roeck <linux@roeck-us.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Huang Rui <ray.huang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Ashok Raj <ashok.raj.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/32] x86/msr: Drop 32-bit MSR interfaces
Message-ID: <akY4U0jUZm4HOGZ_@gmail.com>
References: <20260629060526.3638272-1-jgross@suse.com>
 <d7c1db52-529a-43cc-ac7d-38b52627e8bc@app.fastmail.com>
 <c1608c48-13c2-4290-826b-28b5ca51eaf7@suse.com>
 <7332feff-2649-496c-8e49-b0a19eb54a32@app.fastmail.com>
 <akJUz0kYkEBdLSZ3@gmail.com>
 <akQR9YMtMHReJTfB@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <akQR9YMtMHReJTfB@google.com>
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


* Sean Christopherson <seanjc@google.com> wrote:

> > Note that the individual patches are IMO significantly easier to review
> > through the actual 32-bit => 64-bit variable assignment changes done
> > in isolation (which sometimes include minor cleanups), while
> > the Coccinelle semantic patch:
> > 
> >    { a(b,c) => c = a(b) }
> > 
> > which changes both the function signature and the order of terms as
> > well, is just a single add-on treewide patch.
> 
> Is the plan for subsystem maintainers to pick up the relevant patches,
> and then do the treewide change one release cycle later?

I'll try to keep the patches in a single tree (tip:x86/msr)
in the hope of not prolonging the pain two cycles - but it's
of course fine for maintainers to pick up the patches too
(most of them are standalone), we'll sort it all out in the end.

Thanks,

	Ingo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
