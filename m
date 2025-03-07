Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB29C19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 12:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9W2BlXuy2jJD+f0cqqLG64x9P5Qq0LB8l1KQII/diE=; b=AXkPe+LOFd+eTl
	ghEZ+Qc/z6A1CuNHgConNkGKICibg8YHXPKGdVbW1i+u/zjYXqgwU5AD818kkeqRBUrSmE6ze2AxG
	7gnT259XMuvrDJPNwvcSFthqc/O989L8WzxwldSwg6FpA1MQEWq3WraRwAZSs3IyvYQP0/DPAr8dY
	u6DJEANxyByq1GjLv75F1FHCpy5ev08AsgJXDUA5JE1OE77gnbtoRTi5lntOmC2j4xkNwURVNCf8u
	s+eE8uuzVvkm+wxEwGvDUlz95vBJSHXoECyf2SLrxhr9eGCNJMfwZXVhqCyZUudT61AHTaeUYdOcY
	8TDUuUsCyQ0Xiilocyew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWdO-0000000EA01-41XW;
	Fri, 07 Mar 2025 12:16:58 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWc9-0000000E9gz-00sS
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 12:15:42 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 527CEaSZ216144
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 7 Mar 2025 04:14:36 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 527CEaSZ216144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741349679;
	bh=jpHguGFzA2ESTQPvqJoIr0NmAS1zWgolyOTrgBL62N8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Be5SaSGgmsWvlkd2HRqfzArk9nnQa/gbB2kCd/vi2QEK8XF7tn7E007LPGCySYBmv
	 IBe4UFr66OEmtiNpObBgvlVSM3dsVFMAmcCg1qk0KnpRrF+aipL4y7W2YaKWxosfjg
	 cWf5lVQ4b9ZseS/T4Ejdb1zr76nvhUjdua5R2Pch5YNHmdUnn4vc+zzlh64uFhK6vb
	 WTkqjjxZYMKmKvVthPXAaIt6oPShwbOs2Gi2goJSFgvNUhGes6srmI4eDqrLD0uLkC
	 /B3MuqYu4V3A5+3QHFJOLT2DdF/UOScSb+vcFfW82sFlWlX0qiCgDEt2HYcKJg4NnR
	 6SqqnMn8wULdA==
Date: Fri, 07 Mar 2025 04:14:34 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>
CC: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
        hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
        johannes@sipsolutions.net, gregkh@linuxfoundation.org,
        yury.norov@gmail.com, akpm@linux-foundation.org, alistair@popple.id.au,
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
In-Reply-To: <Z8ri5h-nvNXNp6NB@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com> <20250306162541.2633025-2-visitorckw@gmail.com> <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org> <Z8ra0s9uRoS35brb@gmail.com> <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org> <Z8ri5h-nvNXNp6NB@gmail.com>
Message-ID: <04AA7852-2D68-4B3F-9AA7-51AA57E3D23D@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_041541_044751_E94E6F79 
X-CRM114-Status: GOOD (  21.72  )
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

On March 7, 2025 4:13:26 AM PST, Ingo Molnar <mingo@kernel.org> wrote:
>
>* Jiri Slaby <jirislaby@kernel.org> wrote:
>
>> On 07. 03. 25, 12:38, Ingo Molnar wrote:
>> > 
>> > * Jiri Slaby <jirislaby@kernel.org> wrote:
>> > 
>> > > On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:
>> > > > Change return type to bool for better clarity. Update the kernel doc
>> > > > comment accordingly, including fixing "@value" to "@val" and adjusting
>> > > > examples. Also mark the function with __attribute_const__ to allow
>> > > > potential compiler optimizations.
>> > > > 
>> > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
>> > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
>> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>> > > > ---
>> > > >    include/linux/bitops.h | 10 +++++-----
>> > > >    1 file changed, 5 insertions(+), 5 deletions(-)
>> > > > 
>> > > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
>> > > > index c1cb53cf2f0f..44e5765b8bec 100644
>> > > > --- a/include/linux/bitops.h
>> > > > +++ b/include/linux/bitops.h
>> > > > @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
>> > > >    /**
>> > > >     * parity8 - get the parity of an u8 value
>> > > > - * @value: the value to be examined
>> > > > + * @val: the value to be examined
>> > > >     *
>> > > >     * Determine the parity of the u8 argument.
>> > > >     *
>> > > >     * Returns:
>> > > > - * 0 for even parity, 1 for odd parity
>> > > > + * false for even parity, true for odd parity
>> > > 
>> > > This occurs somehow inverted to me. When something is in parity means that
>> > > it has equal number of 1s and 0s. I.e. return true for even distribution.
>> > > Dunno what others think? Or perhaps this should be dubbed odd_parity() when
>> > > bool is returned? Then you'd return true for odd.
>> > 
>> > OTOH:
>> > 
>> >   - '0' is an even number and is returned for even parity,
>> >   - '1' is an odd  number and is returned for odd  parity.
>> 
>> Yes, that used to make sense for me. For bool/true/false, it no longer does.
>> But as I wrote, it might be only me...
>
>No strong opinion on this from me either, I'd guess existing practice 
>with other parity functions should probably control. (If a coherent 
>praxis exists.).
>
>Thanks,
>
>	Ingo

Instead of "bool" think of it as "bit" and it makes more sense 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
