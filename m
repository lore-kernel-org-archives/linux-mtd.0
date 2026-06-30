Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B3AC43458
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2026 20:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBkz6IIhzBok8XzB8Jd4qtBsbuQOLizK5muJh2qOVU4=; b=prUFQJB+mdV8v9
	gedLtktoNaeXDyhQ5Ore9WFHH+3vnpKgfYB1xWbVlNmrWoyS1FM/epozB65/7h0ep8LXJpG3If+1N
	zTxTEHFrAA2aXJcwfBjQWTy1ROmu1z1ZkTG94D8J9EdS0v5iU/TZTQ6TZPAPRwApE3NPoR0fUxVNd
	MiQnux4MNnFjxvQ+RshCiDd9XKQFnOkKfjslxEL5ZCMtzsLPBBlCQj4uP1io+sAyMw8TxeJLN4LBH
	7/cRvtK7cBkQmNGjs7ywWbcprOOSfRQP7aQTirORGYDqvSSN9gY5QUPfWHjHJfqlr4dyKl2F+KD2k
	LpuSQROhfYwx+/5t3VCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weezy-00000000B2q-2LrU;
	Tue, 30 Jun 2026 20:24:02 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weezv-00000000B2P-2vEB;
	Tue, 30 Jun 2026 20:24:01 +0000
Received: from [IPV6:2601:646:8081:7da1:c71f:dfcf:59c7:993c] ([IPv6:2601:646:8081:7da1:c71f:dfcf:59c7:993c])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 65UK6ofd3661806
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 30 Jun 2026 13:06:51 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 65UK6ofd3661806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1782850020;
	bh=i2G6UAafySOmb8rY0Of+scGPJBnbme4rl6a4zKkZXos=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K5lFI3Zq4F/mIozRU6/PLoKoYWvuV/6E6cXfs0gd3x7InpQddwy7n7lCqU9zTol6p
	 iERjS1DYHe87ViLOQDzm87qe53A2nTT739eUJgh3GED1sB/6THV4FmbnfKfjF+gZM6
	 V3hs8AlxsrgKHqVEonk0hhP6kKL9gYgNa+4EuHtRIhIHX/70mvzshRnY18tWCCdI5w
	 Ll1EMcK2sxp8iMYsZYSnfeyWpSYeZ1t3FhRicQwouhz9KMqYRLpgCuNpQxbhJ9r8I9
	 ZsFBJMIoIbws3i0Y3H2zHi5XFwogldA2J2JWZnvAJa/cf38a+7JjgFWPQpcUApHU2I
	 YRs6tPbYTSHfg==
Message-ID: <ccd35c56-08ac-46b1-9c76-2554d5a234a9@zytor.com>
Date: Tue, 30 Jun 2026 13:06:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/32] x86/msr: Drop 32-bit MSR interfaces
To: Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>,
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
        platform-driver-x86@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        "lukasz.luba@arm.com" <lukasz.luba@arm.com>,
        Jason Baron
 <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>, Yazen Ghannam <yazen.ghannam@amd.com>,
        Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini
 <pbonzini@redhat.com>,
        "Kirill A. Shutemov" <kas@kernel.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>, Pu Wen <puwen@hygon.cn>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Ajay Kaher <ajay.kaher@broadcom.com>,
        Alexey Makhalov <alexey.makhalov@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
        Babu Moger <babu.moger@amd.com>,
        Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>,
        Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Dave Airlie <airlied@redhat.com>, Helge Deller <deller@gmx.de>,
        linux-geode@lists.infradead.org, Olivia Mackall <olivia@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark
 <james.clark@linaro.org>,
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
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        David E Box <david.e.box@intel.com>, xen-devel@lists.xenproject.org
References: <20260629060526.3638272-1-jgross@suse.com>
 <d7c1db52-529a-43cc-ac7d-38b52627e8bc@app.fastmail.com>
 <c1608c48-13c2-4290-826b-28b5ca51eaf7@suse.com>
 <7332feff-2649-496c-8e49-b0a19eb54a32@app.fastmail.com>
 <9acced19-573d-4923-9329-8be408d2e555@suse.com>
 <d315e0a8-e4e9-4f7e-80a9-7c236849eabd@app.fastmail.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <d315e0a8-e4e9-4f7e-80a9-7c236849eabd@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_132359_891629_7F69EF7B 
X-CRM114-Status: GOOD (  17.90  )
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

On 2026-06-29 01:38, Arnd Bergmann wrote:
>>
>> There is no RDMSRQ instruction on any x86 CPU. Are you mixing this up with
>> WRMSRNS/RDMSR using an immediate for addressing the MSR?
> 
> Yes, I was just confused about the exact definition here and assumed
> the single-register output version was actually called rdmsrq.
> 
So just to be clear:

There are three instructions(*):

	wrmsr		- implicit form only
	wrmsrns		- implicit or immediate
	rdmsr		- implicit or immediate

The implicit form are the same on 32 and 64 bits (and, in fact, 16 bits): they
take a MSR register address in %ecx and the data as two 32-bit words in
%edx:%eax. This interface predates x86-64 by about a decade, and the Linux MSR
interfaces were designed when Linux was 32-bit only, so it made sense at the
time to treat them as two halves, especially since MSRs often are various
kinds of bitfields. It didn't help that gcc at the time was extremely
inefficient in its handling of multiword arithmetic (it is much better now),
so using a u64 would have made for much worse code.

The immediate forms are 64-bit only and use a single arbitrary 64-bit
register; the MSR address is kept in an immediate in the instruction, just
like they are for most other register types. The only thing that is "special"
there is that the possible register address space is very large (2^32)
although in practice a very small fraction of that is (currently) used.

The immediate forms are expected to be faster, and provide for further
performance improvements in future microarchitectures. This is important,
because it provides a fine-grain uniform architecture for supervisor-only
state, instead of having to give a bulk ISA (XSAVES/XRSTORS) that is different
from the fine-grained architecture, and still get good performance. This gives
the kernel very fine level control over the context switch flows, for one thing.

WRMSRNS is a non-serializing form of WRMSR, which is defined as an
architecturally hard-serializing instruction, although some MSRs have been
retconned as non-serializing (and the set is different between vendors.) We
want to switch that over to the model where the kernel explicitly opts in to
nonserialization, but that means using alternatives since not all CPUs have
the WRMSRNS instruction.

Furthermore, we want to use alternatives so we can make use of the
immediate-format instructions when the MSR address is known at compile time,
which it is in *nearly* all cases. If we are smart about it we can also use
this to let the tracing framework be specific about what MSRs to trace, since
some MSRs are frequently accessed, but many are set at startup and then
rarely, if ever, touched.


(*) There are actually two more instructions:

	RDMSRLIST
	WRMSRLIST

... which are bulk versions of RDMSR and WRMSRNS respectively. They can be
useful to save and restore entire groups of MSRs in one shot, such as
performance counter configurations. By architecturally allowing the memory
operations and MSR operations to operate asynchronously, they give some of the
pipeline benefits of the immediate MSR operations without requiring the MSR
set to have been set at compile time or code to be dynamically generated.

However, they expose an entirely different programming model, whereas the
immediate- and -NS instruction choices can be entirely hidden at the C level.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
