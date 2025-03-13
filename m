Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B7FC282EC
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 17:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOxKMlEa4NCma2L4+KRsVcO9l/qRAuX0rKnsWffkUKo=; b=tPlof1ioFX1+px
	2ZZnF+dZhAT3crC8IAIRb94tCZk32VoY5BgOaVtcKnqWNYy4uhA4NrmRqODUcvxNRoWJSG3BGmpGK
	gwHvbIZp7hKvYOLd3/c3CfxeAUenaQbu7CfuERixkrYMJKLV3+MZKbUK7vI39MhwAQKnQhXOk7kVu
	IBFryEQ3ocyAlWyOvatzUmc5MCbJpYD2B16eE5pZ4E868FWfesnHn3sf2wPWgXYI7wNG4gDge2Zid
	qga/Be6ci8WBOxw8Kplc56ZomYuAsFb5q1F0gNPgfcXLy4mAV1/hlTkwZe2O6uOnhFv4FT1wfh/26
	ZuxSLiiWXw338EpBhriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm95-0000000BxmN-1Tf0;
	Thu, 13 Mar 2025 17:14:59 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslYg-0000000Br1H-2gjU
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 16:37:23 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52DGaDdt3043136
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 13 Mar 2025 09:36:13 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52DGaDdt3043136
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741883777;
	bh=SaFIw7UgTgo6VXgT9++j90cTZypncDuuppnQ2OyQAgc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=TAd1C3YUnz1/m04KvWprrt25c59hDoEqP/HObNA2f0Bp4rp+Nb9PEJCNVXCw14Iiu
	 q9Abs6+zDLtcCpZhdLC2JCZczf1qLTKYIQIMECs16cttjTwMK/9bSrYGHwOie5HClz
	 /jcP+3xeKGlwUu0aUrtIeDMZT1ZuV3Y4f2fDZOzvoKjLs6qNj/nOaMpj13f7/0wDQR
	 FTgUDEoLrytWaP9YL4WrPdL93XJwGvTwIwSUgo+vtkpLhxBsY0ibsq0svVoyhEkaAa
	 CHnCGjith9nzaUr6Ath+5dakagWjzMXxHAYsyl+rXq8ZXPjgmXLSW6QTYUQphTnOMM
	 hLTpcEZzd0lKw==
Date: Thu, 13 Mar 2025 09:36:11 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Yury Norov <yury.norov@gmail.com>
CC: Jacob Keller <jacob.e.keller@intel.com>,
        David Laight <david.laight.linux@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
        hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
        johannes@sipsolutions.net, gregkh@linuxfoundation.org,
        akpm@linux-foundation.org, alistair@popple.id.au,
        linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
        oss-drivers@corigine.com, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
        brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
        bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
        Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
User-Agent: K-9 Mail for Android
In-Reply-To: <Z9MGxknjluvbX19w@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com> <20250306162541.2633025-2-visitorckw@gmail.com> <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org> <Z8ra0s9uRoS35brb@gmail.com> <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org> <20250307193643.28065d2d@pumpkin> <cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com> <0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com> <Z9MGxknjluvbX19w@thinkpad>
Message-ID: <795281B1-9B8A-477F-8012-DECD14CB53E5@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_093722_676540_49BFBBB7 
X-CRM114-Status: GOOD (  11.57  )
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

On March 13, 2025 9:24:38 AM PDT, Yury Norov <yury.norov@gmail.com> wrote:
>On Wed, Mar 12, 2025 at 05:09:16PM -0700, H. Peter Anvin wrote:
>> On March 12, 2025 4:56:31 PM PDT, Jacob Keller <jacob.e.keller@intel.com> wrote:
>
>[...]
>
>> >This is really a question of whether you expect odd or even parity as
>> >the "true" value. I think that would depend on context, and we may not
>> >reach a good consensus.
>> >
>> >I do agree that my brain would jump to "true is even, false is odd".
>> >However, I also agree returning the value as 0 for even and 1 for odd
>> >kind of made sense before, and updating this to be a bool and then
>> >requiring to switch all the callers is a bit obnoxious...
>> 
>> Odd = 1 = true is the only same definition. It is a bitwise XOR, or sum mod 1.
>
>The x86 implementation will be "popcnt(val) & 1", right? So if we
>choose to go with odd == false, we'll have to add an extra negation.
>So because it's a purely conventional thing, let's just pick a simpler
>one?
>
>Compiler's builtin parity() returns 1 for odd.
>
>Thanks,
>Yury

The x86 implementation, no, but there will be plenty of others having that exact definition.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
