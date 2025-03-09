Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ED5C28B30
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Mar 2025 16:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8YVSoY74ERWnWq+6qfiu2k/JOvaiwPr986hvXGp1dU=; b=ccYouRtdKc8q6S
	dwgWcJESScPe/6nJwP0uR02V6d2jN2FqFXb/fd9/tCDhr8j7kW35LozUCEJCPMj34F5KTYRtG2FMz
	G5HLzCG5wzRq1tcimYCjzzir4C1LfUwM1E11d1K72kNkfx+tt/Ct/HbOX6SOodm2FF2bAmLjt0GnZ
	bV2LjMK4REGFojYqKlEqs44yhQHJBr2yllPCROrTBVkYTkkPz30UvXE3xQfAoVXXpRkIsEdav2uFq
	zEg1HV7U9839WTcQZrpNH6PyNX2o18j9DjNbYwWTjRGt409CbLnDsNierkLO+Cj9IVKXglPooyxCt
	Kk1XwGNU1dbLzJ/mspRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trJCy-00000000mPy-0DgF;
	Sun, 09 Mar 2025 16:08:56 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trJCv-00000000mPP-3R0r
	for linux-mtd@lists.infradead.org;
	Sun, 09 Mar 2025 16:08:55 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 529G7ORJ1263742
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 9 Mar 2025 09:07:25 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 529G7ORJ1263742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741536453;
	bh=seT44xgoWZ5mbi6YMs1X0xb2oeGYrNPZX+/U1qdQGTg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=AM2/bmW6qzoT4YywJnfg+kFnRXlll5tS36arYnqSjApIypQlKimmdfCt9YyV+hD5i
	 dwEfkCUr9AtGwtNwd8jvLKVyhS9+DVOhMt0UxbaU8XLll4G1zqhZUN5wna9XCG0iyW
	 78qL6sdm7Dmrl0dpbYygV8vUvwurgNltciei2+BotvHSOlc5nLcyRz7FcLa20sqElN
	 aaLYBYPsfdON+oOvyxzkWw0OSqmFW0xR+GLH1tZOAogct9w6ii64Fkp372iR+MOFjL
	 L/PbfQo7+FF9HFkiZXRXnx5Nau5yXjNHZfL42nnEtecfgu8tqCoFLf4g4XN6869eDo
	 eXA4gSO7d9tjA==
Date: Sun, 09 Mar 2025 09:00:58 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
CC: David Laight <david.laight.linux@gmail.com>,
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
        vigneshr@ti.com, x86@kernel.org, yury.norov@gmail.com
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
User-Agent: K-9 Mail for Android
In-Reply-To: <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com> <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com> <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com> <20250307195310.58abff8c@pumpkin> <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com> <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
Message-ID: <EF4335E0-F8EB-4642-BD09-B16BCCF23F95@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_090853_856862_789C5F0A 
X-CRM114-Status: GOOD (  21.07  )
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

On March 9, 2025 8:48:26 AM PDT, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
>On Fri, Mar 07, 2025 at 12:07:02PM -0800, H. Peter Anvin wrote:
>> On March 7, 2025 11:53:10 AM PST, David Laight <david.laight.linux@gmail.com> wrote:
>> >On Fri, 07 Mar 2025 11:30:35 -0800
>> >"H. Peter Anvin" <hpa@zytor.com> wrote:
>> >
>> >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> >> >> (int)true most definitely is guaranteed to be 1.  
>> >> >
>> >> >That's not technically correct any more.
>> >> >
>> >> >GCC has introduced hardened bools that intentionally have bit patterns
>> >> >other than 0 and 1.
>> >> >
>> >> >https://gcc.gnu.org/gcc-14/changes.html
>> >> >
>> >> >~Andrew  
>> >> 
>> >> Bit patterns in memory maybe (not that I can see the Linux kernel using them) but
>> >> for compiler-generated conversations that's still a given, or the manager isn't C
>> >> or anything even remotely like it.
>> >> 
>> >
>> >The whole idea of 'bool' is pretty much broken by design.
>> >The underlying problem is that values other than 'true' and 'false' can
>> >always get into 'bool' variables.
>> >
>> >Once that has happened it is all fubar.
>> >
>> >Trying to sanitise a value with (say):
>> >int f(bool v)
>> >{
>> >	return (int)v & 1;
>> >}    
>> >just doesn't work (see https://www.godbolt.org/z/MEndP3q9j)
>> >
>> >I really don't see how using (say) 0xaa and 0x55 helps.
>> >What happens if the value is wrong? a trap or exception?, good luck recovering
>> >from that.
>> >
>> >	David
>> 
>> Did you just discover GIGO?
>
>Thanks for all the suggestions.
>
>I don't have a strong opinion on the naming or return type. I'm still a
>bit confused about whether I can assume that casting bool to int always
>results in 0 or 1.
>
>If that's the case, since most people prefer bool over int as the
>return type and some are against introducing u1, my current plan is to
>use the following in the next version:
>
>bool parity_odd(u64 val);
>
>This keeps the bool return type, renames the function for better
>clarity, and avoids extra maintenance burden by having just one
>function.
>
>If I can't assume that casting bool to int always results in 0 or 1,
>would it be acceptable to keep the return type as int?
>
>Would this work for everyone?
>
>Regards,
>Kuan-Wei

You *CAN* safely assume that bool is an integer type which always has the value 0 or 1.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
