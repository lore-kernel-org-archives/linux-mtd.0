Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49CFC19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 20:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mTxbnIlma0IUPFUKTIfdLxK3SQmTalEG/bnoa4tYh0=; b=YfOcUAD9sm/RbP
	9UgC/pXrIJvCTZy1nnQ0dXlxYvU4ljFZqRVV70GLMfsqWtT6Lg/+HhzYb00RAq2ldKHE9QLt6xlns
	hgVmPpcXuOFjnGSW2d45A+q9qZwQoiWZMTP/QgVNI8BOny7Ki32d6oMXd2xjcJ6yuncN375vEmwOP
	WRfMo78KNboXTCIhrJo8btQShF0FFXLKznZ9H6gfD1FTrGTiMiXzoE1huak4WTzYhvibrwHTXUu/O
	rY0e+S8BRo9HFEmYxImrmVF1hT2uqPa4wVzG7GqDrFnXb9Biv7fYPcHEMrqR3NHnuw1zdIJsQ+0CW
	qyIZgnTpSDjp9c//aIOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeOY-0000000FUxY-2LMa;
	Fri, 07 Mar 2025 20:34:10 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdQ9-0000000FM4X-1ETO
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 19:31:46 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 527JUdCN395426
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 7 Mar 2025 11:30:39 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 527JUdCN395426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741375842;
	bh=50NLhdDhI8V8GO7o5jfDm1HRHcKPZ5EFPUWRP6MJAIA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=i8S6m7b8Y1bYbI/KAMAEMHyLmm3Y3FEbOP1TAp45PLhWp0+UZa3jzXqYD/PAma8k8
	 b/Oan43NQx+G8Psx4knFdBaIeGVMBY9RXM4Ckdpi6bnHPizobhJTlwJ9C/oeCEh78k
	 Stf+80k1tjWDPUZPs2+t5W4E7bcn5x1ArDfWYB9dAaAevi8RglcCPIr1tB2PeYVj29
	 O7H/KNA8J4/SredKAKB+hHce7/GwWHh4ARCY3vBRtJzld1LsziwXJjEV7Ueot213Z/
	 QRKE/cCgjphvTYe81eN7CwuSerqHAkatZ00EB031zjlPdsrSQAYtuWc+oXJ6lMl8EH
	 7JnS1tGvALMKw==
Date: Fri, 07 Mar 2025 11:30:35 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
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
        vigneshr@ti.com, visitorckw@gmail.com, x86@kernel.org,
        yury.norov@gmail.com
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
User-Agent: K-9 Mail for Android
In-Reply-To: <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com> <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
Message-ID: <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_113145_329242_3B40C90D 
X-CRM114-Status: UNSURE (   6.97  )
X-CRM114-Notice: Please train this message.
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

On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> (int)true most definitely is guaranteed to be 1.
>
>That's not technically correct any more.
>
>GCC has introduced hardened bools that intentionally have bit patterns
>other than 0 and 1.
>
>https://gcc.gnu.org/gcc-14/changes.html
>
>~Andrew

Bit patterns in memory maybe (not that I can see the Linux kernel using them) but for compiler-generated conversations that's still a given, or the manager isn't C or anything even remotely like it.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
