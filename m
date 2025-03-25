Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFE5C3600B
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Mar 2025 19:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGVfX5rKFV9Az4JES7kR77hyZ+YOfIm/+6t0cM7OVQ8=; b=knHJspqM+/3MD/
	3P8zM1hDw5WIJq6r/dLU8k8sl35S661o+ukEScK4wxS8Lv4a94U+i5/qm0x3YcHRaQ5EbFHY88+cP
	6Sf3ISi7TnrtVIABmaPoWcvdvpb38ah4czXkekDKM9NykQKHuEVV7/sgxkNacGtwMd+mBof3gDUTp
	ztORnmlNcUuNZDIl6v/8q/TxUwVpDFRLsOj47y5PDKamrzT0qkxfphUm2NpRh8VJ5KlhYmmhhiN3M
	nGIRtHQ8IGxwHzVW0zBhCvbzyoeQNVjRYdAj6Efnc4vjLcK4NYyFqAGMKFYbu7cCdwTYfCB7beUpf
	xzxmbzY6pcep1HaAiRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txACk-00000006tc7-31zf;
	Tue, 25 Mar 2025 19:44:54 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txACe-00000006tbM-45T6
	for linux-mtd@lists.infradead.org;
	Tue, 25 Mar 2025 19:44:50 +0000
Received: from [IPV6:2601:646:8083:1982:248d:9102:5b8a:6e6c] ([IPv6:2601:646:8083:1982:248d:9102:5b8a:6e6c])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52PJhUIl603946
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 25 Mar 2025 12:43:32 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52PJhUIl603946
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1742931824;
	bh=UJj21FC15p3nVLzkicX5dgxkBEi54nR03XqBTpnd5V4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kdM3Nj1MybR90X09rU1nRONRJ2jg1AtjqKoXLnxsg2cojdKgyvQq1sB0dmO1P9B7e
	 Oh0GOCPxLEaRXZFe7o1Sfjp8n54w75H5iN/HAzeysNqCT9wYOr7jEP2Dae4W47cuTE
	 IJENwVV1LUrY+RUTP8SIu8IuTBsqVtESVxKjQe2igsVqYUE9/vC+W48eqqzXH+7yPQ
	 lLYCfriDAqV0glFFkq5y8djhKy78jC5zQ7rOCh2GQVPUddqvu2o3Kp1cuthMCi7rCc
	 T1rY4JTt0lRSRGlEjcanOa/VKXXmOhoSIUQpV16G1iV32q6fHAz8KlUXWCNdcW9vny
	 jM4Umn7OoVMWA==
Message-ID: <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
Date: Tue, 25 Mar 2025 12:43:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
To: Kuan-Wei Chiu <visitorckw@gmail.com>, Yury Norov <yury.norov@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
        akpm@linux-foundation.org, alistair@popple.id.au,
        andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
        arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
        bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
        brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
        davem@davemloft.net, dmitry.torokhov@gmail.com,
        dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
        edumazet@google.com, eleanor15x@gmail.com, gregkh@linuxfoundation.org,
        hverkuil@xs4all.nl, jernej.skrabec@gmail.com, jirislaby@kernel.org,
        jk@ozlabs.org, joel@jms.id.au, johannes@sipsolutions.net,
        jonas@kwiboo.se, jserv@ccns.ncku.edu.tw, kuba@kernel.org,
        linux-fsi@lists.ozlabs.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux@rasmusvillemoes.dk,
        louis.peens@corigine.com, maarten.lankhorst@linux.intel.com,
        mchehab@kernel.org, mingo@redhat.com, miquel.raynal@bootlin.com,
        mripard@kernel.org, neil.armstrong@linaro.org, netdev@vger.kernel.org,
        oss-drivers@corigine.com, pabeni@redhat.com,
        parthiban.veerasooran@microchip.com, rfoss@kernel.org, richard@nod.at,
        simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de,
        vigneshr@ti.com, x86@kernel.org
References: <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
 <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name> <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com> <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_124449_025300_1E047352 
X-CRM114-Status: GOOD (  12.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/23/25 08:16, Kuan-Wei Chiu wrote:
> 
> Interface 3: Multiple Functions
> Description: bool parity_odd8/16/32/64()
> Pros: No need for explicit casting; easy to integrate
>        architecture-specific optimizations; except for parity8(), all
>        functions are one-liners with no significant code duplication
> Cons: More functions may increase maintenance burden
> Opinions: Only I support this approach
> 

OK, so I responded to this but I can't find my reply or any of the 
followups, so let me go again:

I prefer this option, because:

a. Virtually all uses of parity is done in contexts where the sizes of 
the items for which parity is to be taken are well-defined, but it is 
*really* easy for integer promotion to cause a value to be extended to 
32 bits unnecessarily (sign or zero extend, although for parity it 
doesn't make any difference -- if the compiler realizes it.)

b. It makes it easier to add arch-specific implementations, notably 
using __builtin_parity on architectures where that is known to generate 
good code.

c. For architectures where only *some* parity implementations are 
fast/practical, the generic fallbacks will either naturally synthesize 
them from components via shift-xor, or they can be defined to use a 
larger version; the function prototype acts like a cast.

d. If there is a reason in the future to add a generic version, it is 
really easy to do using the size-specific functions as components; this 
is something we do literally all over the place, using a pattern so 
common that it, itself, probably should be macroized:

#define parity(x) 				\
({						\
	typeof(x) __x = (x);			\
	bool __y;				\
	switch (sizeof(__x)) {			\
		case 1:				\
			__y = parity8(__x);	\
			break;			\
		case 2:				\
			__y = parity16(__x);	\
			break;			\
		case 4:				\
			__y = parity32(__x);	\
			break;			\
		case 8:				\
			__y = parity64(__x);	\
			break;			\
		default:			\
			BUILD_BUG();		\
			break;			\
	}					\
	__y;					\
})
				

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
