Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158D4C19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 19:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F25PaSfd1RBjvluij5YJdyyOzOZBurSdVzer6LkC44Q=; b=YO8H08QT+dZBqn
	KQRZsLnSc+D93zzmx8hIzPg2gCrKAHL93WZzQI3YewmpxnlQoaxlHpUTqDh91zcuo3Adf7Lr6tJQ8
	M8J56oy9sYmQ9/vXSubaFm1d1Ay+akyGpklZ1vqDiVzxDF06mZPPnUbmIZ5nJPHQJ9DwS2Vm+8Ckq
	60WWWMbWTeC18n9fyOPgWV4oBa7k/6IQxEjtYBXYbx/z0osQQE6EIutfgiULFL4fbRWm14bo37pl6
	DAu1Qrr4b5W2dCvIGep3hpzUDkEJf7y6ekFRw4rZmcWtBy5I9+YeonCpJ+IpMz8h8313aXftvP1CJ
	irj34eT6yt7k7fA2Ch+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdSt-0000000FMU2-01fV;
	Fri, 07 Mar 2025 19:34:35 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqdSq-0000000FMTM-1oUi
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 19:34:33 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 527JXgtA396336
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 7 Mar 2025 11:33:43 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 527JXgtA396336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741376026;
	bh=Rba/iYpx+v1WUJY9TbQtNNXz3bzAixuum4cy0AAzIQ8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=JpM4cAI/6OO4nOvQdC38mdUbpbB1lWPHBSF4ljFw2qA3FLC4pjNg+SSz3ep6OIzF7
	 WYl+0db+AhekbzgxwomC3ymIRs5j71mlLZtD2iw8tO5cOhAoYMQ4MbYIxxObh+RsB1
	 GUcEWcPFEboLGkCpDZbKwA820RTWL1qGA26P0tk+SNSZddRBNxaRNIo9I6OO/l2PS1
	 suoEHlGlNSslZA0RrcNHi/ZRxh3u7yF1UBB/uL9NLK/IuoZSDmbFqv5gKyuDiKqw3E
	 CP62OwczhWCynLtrpzDYfzi+I/IgCMQrBEruwEEHJe0dh0Owv8tBZshia4KmpgLZct
	 MdGqjzEQfz58Q==
Date: Fri, 07 Mar 2025 11:33:40 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Yury Norov <yury.norov@gmail.com>
CC: Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
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
In-Reply-To: <Z8tJNt83uVBca0cj@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com> <20250306162541.2633025-2-visitorckw@gmail.com> <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org> <Z8ra0s9uRoS35brb@gmail.com> <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org> <Z8ri5h-nvNXNp6NB@gmail.com> <04AA7852-2D68-4B3F-9AA7-51AA57E3D23D@zytor.com> <Z8tJNt83uVBca0cj@thinkpad>
Message-ID: <783456A8-67F9-47DD-AB15-914622A921CD@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_113432_467626_5613B0B0 
X-CRM114-Status: GOOD (  24.30  )
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

On March 7, 2025 11:30:08 AM PST, Yury Norov <yury.norov@gmail.com> wrote:
>On Fri, Mar 07, 2025 at 04:14:34AM -0800, H. Peter Anvin wrote:
>> On March 7, 2025 4:13:26 AM PST, Ingo Molnar <mingo@kernel.org> wrote:
>> >
>> >* Jiri Slaby <jirislaby@kernel.org> wrote:
>> >
>> >> On 07. 03. 25, 12:38, Ingo Molnar wrote:
>> >> > 
>> >> > * Jiri Slaby <jirislaby@kernel.org> wrote:
>> >> > 
>> >> > > On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:
>> >> > > > Change return type to bool for better clarity. Update the kernel doc
>> >> > > > comment accordingly, including fixing "@value" to "@val" and adjusting
>> >> > > > examples. Also mark the function with __attribute_const__ to allow
>> >> > > > potential compiler optimizations.
>> >> > > > 
>> >> > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
>> >> > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
>> >> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>> >> > > > ---
>> >> > > >    include/linux/bitops.h | 10 +++++-----
>> >> > > >    1 file changed, 5 insertions(+), 5 deletions(-)
>> >> > > > 
>> >> > > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
>> >> > > > index c1cb53cf2f0f..44e5765b8bec 100644
>> >> > > > --- a/include/linux/bitops.h
>> >> > > > +++ b/include/linux/bitops.h
>> >> > > > @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
>> >> > > >    /**
>> >> > > >     * parity8 - get the parity of an u8 value
>> >> > > > - * @value: the value to be examined
>> >> > > > + * @val: the value to be examined
>> >> > > >     *
>> >> > > >     * Determine the parity of the u8 argument.
>> >> > > >     *
>> >> > > >     * Returns:
>> >> > > > - * 0 for even parity, 1 for odd parity
>> >> > > > + * false for even parity, true for odd parity
>> >> > > 
>> >> > > This occurs somehow inverted to me. When something is in parity means that
>> >> > > it has equal number of 1s and 0s. I.e. return true for even distribution.
>> >> > > Dunno what others think? Or perhaps this should be dubbed odd_parity() when
>> >> > > bool is returned? Then you'd return true for odd.
>> >> > 
>> >> > OTOH:
>> >> > 
>> >> >   - '0' is an even number and is returned for even parity,
>> >> >   - '1' is an odd  number and is returned for odd  parity.
>> >> 
>> >> Yes, that used to make sense for me. For bool/true/false, it no longer does.
>> >> But as I wrote, it might be only me...
>> >
>> >No strong opinion on this from me either, I'd guess existing practice 
>> >with other parity functions should probably control. (If a coherent 
>> >praxis exists.).
>> >
>> >Thanks,
>> >
>> >	Ingo
>> 
>> Instead of "bool" think of it as "bit" and it makes more sense
>
>So, to help people thinking that way we can introduce a corresponding
>type:
>        typedef unsigned _BitInt(1) u1;
>
>It already works for clang, and GCC is going to adopt it with std=c23.
>We can make u1 an alias to bool for GCC for a while. If you guys like
>it, I can send a patch.
>
>For clang it prints quite a nice overflow warning:
>
>tst.c:59:9: warning: implicit conversion from 'int' to 'u1' (aka 'unsigned _BitInt(1)') changes value from 2 to 0 [-Wconstant-conversion]
>   59 |         u1 r = 2;
>      |            ~   ^
>
>Thanks,
>Yury

No, for a whole bunch of reasons.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
