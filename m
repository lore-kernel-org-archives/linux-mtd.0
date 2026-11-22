Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068B6606A32A
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2026 11:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LkQ50xeB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JBZbk8ZB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2KhoOw0LoItqhIQRX+PLuUOAfCIUnnk/JJGLv/sAA0Y=; b=LkQ50xeBU7eOYwZxohWEOJnKT3
	2v8B5zvx4u8JD5oeKzwrKOYw/qVQwQ1qBafZ/MKNvaJshXYY0LJyWhwvhRnjy6boou+6XDgZVQ6kD
	N7ank+4oTpJ71fjtbD08WmH3i0dilAEBUZ/LQXPNr7zVLmxx5Dy87stHbhl1ykNSMRM9fl9iyvu7X
	XMzC3fnhjEjMUv95c31TpKpPl0RQ2svUjbgiEgc1X+WbijbEoDNkWX/ivTg6Q0vGf4BpOvJo930CJ
	HsgInDYxTsBBYNTXf1P5ZS2BGlo+dZvvQgftqTbi1C+Z2xBEAdSzZ8z5w+OOmUFI5+KihazmYOg/e
	hnJN2D+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV60q-000000012dE-3Kj1;
	Sun, 22 Nov 2026 11:45:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV60p-000000012d4-1JDl;
	Sun, 22 Nov 2026 11:45:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8425B60629;
	Sun, 22 Nov 2026 11:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C711F000C0;
	Sun, 22 Nov 2026 11:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795347938;
	bh=cLMcqM1+ID1GgGq+PerrzsvqYkDe3KsyjwqtE/Ytfio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JBZbk8ZBopVc78PPFvWeVTIg2CMujdUlqemdavr/HCyWWlIQmFZkcrGxwSI3F8Lj7
	 DNLer9OUFPLbOa4J4Swvhd/E17PbHJNYpl75QSvfOs502Qnq+SIVf6x8BaBZgxP/BT
	 TLhC5kAcmMHclzMqgFcvdBPgsnO0el8R7pGYvxVYVMfFAdpjXa9S5pH5onsvDFitkW
	 F7xoQFwGUBjexAU1BbMzjGktImA7HZrErJM176ZMcRKXKM7Cl6WdGzAwr72CinZqC4
	 cUMiH2XukT43gci2XSUdvkVEDyb0hb22fl5gp/8fIaWZ7ym7dU5tWM0l+OzRL/g3Qu
	 BJv0P33zLAReA==
Date: Sun, 22 Nov 2026 12:45:16 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux.dev, linux-ide@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org,
	kvm@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-mtd@lists.infradead.org,
	platform-driver-x86@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	David Airlie <airlied@redhat.com>, Helge Deller <deller@gmx.de>,
	linux-geode@lists.infradead.org,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Pu Wen <puwen@hygon.cn>, Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Ben Horgan <ben.horgan@arm.com>, Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Len Brown <lenb@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	Huang Rui <ray.huang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Ashok Raj <ashok.raj.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	xen-devel@lists.xenproject.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: treewide: Re: [PATCH v6 00/12] msr: Drop 32-bit MSR interfaces
Message-ID: <awLVzKJWWfC3eJsH@gmail.com>
References: <20261116150208.1572254-1-jgross@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261116150208.1572254-1-jgross@suse.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


* Juergen Gross <jgross@suse.com> wrote:

> For accessing the MSR registers on the local CPU, there are 2 types of
> interfaces: the "modern" 64-bit ones (rdmsrq() etc.) and the 32-bit
> ones (rdmsr() etc.) which are using the upper and lower 32-bit halves
> of the 64-bit wide MSR register values.

>  140 files changed, 572 insertions(+), 690 deletions(-)

So I've applied this to a separate branch/tree under tip:core/msr,
because I think this series is mature enough and after about a year
worth of (very patient) iterations by you we've reached the limit of
what will be picked up by maintainers.

The commit with the widest impact is automatically generated
via a semantic patch:

  treewide: Convert rdmsrq() from a macro to an inline function

  139 files changed, 493 insertions(+), 495 deletions(-)

and I'm reasonably certain that whatever merge impact this may have
on -next can be addressed quickly and in a simple fashion. Let's see
how this goes.

Thanks,

	Ingo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
