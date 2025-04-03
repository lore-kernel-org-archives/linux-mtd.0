Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AFEC3601A
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 14:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajJLDwhVkNc1zJmbT8CcdLU0QnwOut3JaBRebbbZKFw=; b=WXhsPG5d3Vvbka
	haf5uFG5SrJRP6AqwXTv0FVFCY0kvaIJgjrSIS3UEtXpeejt5q89k5fkKWTz/Cyh1rPRj6JVpHuAO
	UGL2SaoD7PotHVVyfPRcLEQiZGs7LQJy3eMySfUV3UaHsZ93d1Os23mMzPwWcINEpY4JjtffuVDaA
	rGkVZ1c74sVCoUhjnxl5cmjtHA5tbC3lZCrSIZkKDH2vNw6zvgtlwqD9/hC7xUuYKXjEd0FD3LiHA
	aysTBGzE1eaiEQNZbTsgFSV+vEYbr6oq4yulqvlTuhmYrgufF7VRzrmw+O9k0nGobOvNmyDiXOYxw
	kE68vbnQB6vY1grKf9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Lpb-000000097OJ-2ath;
	Thu, 03 Apr 2025 14:46:11 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Liu-000000096CD-2YSK
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 14:39:17 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-736ad42dfd6so826429b3a.3
        for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2025 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743691155; x=1744295955; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rvr0XxDHh05/lDdFnQkqZ5aBAiK03CfkHR41QzNZGHs=;
        b=RqJQN+5tVvUPqthAefVNYtWBvVLBXmAgzNDTj7r5/L11WJwVUjCHuzif/+p/TRsnLH
         E8qSXZADPSE7bFyafpEvnywpYyLZL3yMchtcJVy7k5F1iLJ6G8wKsu/fPNKZZ5wKHWGN
         +/SjDtvsmmLsEVc9L7FseTIdvjrFUwYGDhGFotD3xZ/2ebvhlsZLCehXAH5KnYdefTsk
         3lpjr/7jZe93OEiTgi3q4/3g58Y42/mCldzjZH97RS65WZUk+Yb1wDxL1q0DUbQPMsk5
         rwY4qsAXoQLIRw/kK90wVbZmF66GoGie8tI7Rcit9LyUIAUbQcqNfTVGQTp32h1x8Uuw
         NXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691155; x=1744295955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rvr0XxDHh05/lDdFnQkqZ5aBAiK03CfkHR41QzNZGHs=;
        b=FCYdmnP5112vPehZqOCgn5EGSkZqWI37qfvZ65ozqRk1b/Zcc1NBgW84z3y+3vXZYj
         N9CQ/dsonYYoQn4mDiW6hEMgR451gFrVAIowpL7Iwp0FKPo5vfMqbMdXilz7eC1Hzd0L
         U6K7Wh9FbZseLVkmOgL/LKPzgEU/whA1idQ+WpLenlKskkqB1bhgmmCzvUXnb0Fsx47b
         7quEaxkUR8TcH0vA+g4wDNVFcNc+3Dhyj6r/74DTBQxF+/ncbZHCBCGzlT296TY/sieE
         WcNC96BSKaA4plh0wPmerwBTvw3+zu9h3Ph3/axu40l9IbsKZ0S6YqbdJtc9C3CtsZkH
         09xg==
X-Forwarded-Encrypted: i=1; AJvYcCXpGs2DomtO9FIne3yxlX6hAyifhOWTSRgyhy5d/CIa2H6rJW7HlEJAfeQK2fcf+jokNy7bYu9QbH4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqLtICvjMoT4X14YMrTMZm6uLP5+OrtLxRqXG/90UWvVjwQPk7
	C5S8RQ36pOd2dneW3pWajK0sOC+5+FiWYPVe1lL4lTHw8XZOvn6Q
X-Gm-Gg: ASbGncsksShcQl+yI8MUYi2WE4dPvmKoRO34c8da5iTdmNduXhQ54SK8sooj6Ix0qr7
	+8dupDNhgYj/EUKfqgzDducETiMrqcVRMQzBxWVDo0k0C/RWcAkw9JUNtVbIMOAOHpGsSNm6UsM
	cJBZ3MZ4kxIxorPValD7a8oudbrOiY4SaL/zmqkG2bS5lqib2RT2d9hJ4mXcOTh7OluwTYG+1aJ
	BEIGTAOt7EfYpcUQqQebGn5PCFi/tDH7rhzbCTeB5SidR/bACklOUOKyvvrNelAPadO1L+N4OZ+
	x86MTtInQXVa2Yzsnp3Tqg8J+MBB2hIow2pmb/TgoDZTZQ1BhiFtM3VLndjapl8uLxbe0vys
X-Google-Smtp-Source: AGHT+IEBLhxF2I4CcVDE0Ip1aaBG/9qxfajK2d8loqdQY51JgxIHQayN0kr/iRs9O5E0K4MztoDo5g==
X-Received: by 2002:a05:6a20:6f04:b0:1fd:e9c8:cf3b with SMTP id adf61e73a8af0-200e4cc69c1mr11499641637.30.1743691154910;
        Thu, 03 Apr 2025 07:39:14 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc2d331csm1285435a12.12.2025.04.03.07.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:39:13 -0700 (PDT)
Date: Thu, 3 Apr 2025 22:39:03 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>, Yury Norov <yury.norov@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	David Laight <david.laight.linux@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
	akpm@linux-foundation.org, alistair@popple.id.au,
	andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
	arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
	bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
	davem@davemloft.net, dmitry.torokhov@gmail.com,
	dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
	edumazet@google.com, eleanor15x@gmail.com,
	gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
	jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
	jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux@rasmusvillemoes.dk, louis.peens@corigine.com,
	maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
	mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
	neil.armstrong@linaro.org, netdev@vger.kernel.org,
	oss-drivers@corigine.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, rfoss@kernel.org,
	richard@nod.at, simona@ffwll.ch, tglx@linutronix.de,
	tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
References: <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
 <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_073916_646481_5E98F078 
X-CRM114-Status: GOOD (  23.25  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgMTI6NDM6MjVQTSAtMDcwMCwgSC4gUGV0ZXIgQW52aW4g
d3JvdGU6Cj4gT24gMy8yMy8yNSAwODoxNiwgS3Vhbi1XZWkgQ2hpdSB3cm90ZToKPiA+IAo+ID4g
SW50ZXJmYWNlIDM6IE11bHRpcGxlIEZ1bmN0aW9ucwo+ID4gRGVzY3JpcHRpb246IGJvb2wgcGFy
aXR5X29kZDgvMTYvMzIvNjQoKQo+ID4gUHJvczogTm8gbmVlZCBmb3IgZXhwbGljaXQgY2FzdGlu
ZzsgZWFzeSB0byBpbnRlZ3JhdGUKPiA+ICAgICAgICBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgb3B0
aW1pemF0aW9uczsgZXhjZXB0IGZvciBwYXJpdHk4KCksIGFsbAo+ID4gICAgICAgIGZ1bmN0aW9u
cyBhcmUgb25lLWxpbmVycyB3aXRoIG5vIHNpZ25pZmljYW50IGNvZGUgZHVwbGljYXRpb24KPiA+
IENvbnM6IE1vcmUgZnVuY3Rpb25zIG1heSBpbmNyZWFzZSBtYWludGVuYW5jZSBidXJkZW4KPiA+
IE9waW5pb25zOiBPbmx5IEkgc3VwcG9ydCB0aGlzIGFwcHJvYWNoCj4gPiAKPiAKPiBPSywgc28g
SSByZXNwb25kZWQgdG8gdGhpcyBidXQgSSBjYW4ndCBmaW5kIG15IHJlcGx5IG9yIGFueSBvZiB0
aGUKPiBmb2xsb3d1cHMsIHNvIGxldCBtZSBnbyBhZ2FpbjoKPiAKPiBJIHByZWZlciB0aGlzIG9w
dGlvbiwgYmVjYXVzZToKPiAKPiBhLiBWaXJ0dWFsbHkgYWxsIHVzZXMgb2YgcGFyaXR5IGlzIGRv
bmUgaW4gY29udGV4dHMgd2hlcmUgdGhlIHNpemVzIG9mIHRoZQo+IGl0ZW1zIGZvciB3aGljaCBw
YXJpdHkgaXMgdG8gYmUgdGFrZW4gYXJlIHdlbGwtZGVmaW5lZCwgYnV0IGl0IGlzICpyZWFsbHkq
Cj4gZWFzeSBmb3IgaW50ZWdlciBwcm9tb3Rpb24gdG8gY2F1c2UgYSB2YWx1ZSB0byBiZSBleHRl
bmRlZCB0byAzMiBiaXRzCj4gdW5uZWNlc3NhcmlseSAoc2lnbiBvciB6ZXJvIGV4dGVuZCwgYWx0
aG91Z2ggZm9yIHBhcml0eSBpdCBkb2Vzbid0IG1ha2UgYW55Cj4gZGlmZmVyZW5jZSAtLSBpZiB0
aGUgY29tcGlsZXIgcmVhbGl6ZXMgaXQuKQo+IAo+IGIuIEl0IG1ha2VzIGl0IGVhc2llciB0byBh
ZGQgYXJjaC1zcGVjaWZpYyBpbXBsZW1lbnRhdGlvbnMsIG5vdGFibHkgdXNpbmcKPiBfX2J1aWx0
aW5fcGFyaXR5IG9uIGFyY2hpdGVjdHVyZXMgd2hlcmUgdGhhdCBpcyBrbm93biB0byBnZW5lcmF0
ZSBnb29kIGNvZGUuCj4gCj4gYy4gRm9yIGFyY2hpdGVjdHVyZXMgd2hlcmUgb25seSAqc29tZSog
cGFyaXR5IGltcGxlbWVudGF0aW9ucyBhcmUKPiBmYXN0L3ByYWN0aWNhbCwgdGhlIGdlbmVyaWMg
ZmFsbGJhY2tzIHdpbGwgZWl0aGVyIG5hdHVyYWxseSBzeW50aGVzaXplIHRoZW0KPiBmcm9tIGNv
bXBvbmVudHMgdmlhIHNoaWZ0LXhvciwgb3IgdGhleSBjYW4gYmUgZGVmaW5lZCB0byB1c2UgYSBs
YXJnZXIKPiB2ZXJzaW9uOyB0aGUgZnVuY3Rpb24gcHJvdG90eXBlIGFjdHMgbGlrZSBhIGNhc3Qu
Cj4gCj4gZC4gSWYgdGhlcmUgaXMgYSByZWFzb24gaW4gdGhlIGZ1dHVyZSB0byBhZGQgYSBnZW5l
cmljIHZlcnNpb24sIGl0IGlzIHJlYWxseQo+IGVhc3kgdG8gZG8gdXNpbmcgdGhlIHNpemUtc3Bl
Y2lmaWMgZnVuY3Rpb25zIGFzIGNvbXBvbmVudHM7IHRoaXMgaXMKPiBzb21ldGhpbmcgd2UgZG8g
bGl0ZXJhbGx5IGFsbCBvdmVyIHRoZSBwbGFjZSwgdXNpbmcgYSBwYXR0ZXJuIHNvIGNvbW1vbiB0
aGF0Cj4gaXQsIGl0c2VsZiwgcHJvYmFibHkgc2hvdWxkIGJlIG1hY3JvaXplZDoKPiAKPiAjZGVm
aW5lIHBhcml0eSh4KSAJCQkJXAo+ICh7CQkJCQkJXAo+IAl0eXBlb2YoeCkgX194ID0gKHgpOwkJ
CVwKPiAJYm9vbCBfX3k7CQkJCVwKPiAJc3dpdGNoIChzaXplb2YoX194KSkgewkJCVwKPiAJCWNh
c2UgMToJCQkJXAo+IAkJCV9feSA9IHBhcml0eTgoX194KTsJXAo+IAkJCWJyZWFrOwkJCVwKPiAJ
CWNhc2UgMjoJCQkJXAo+IAkJCV9feSA9IHBhcml0eTE2KF9feCk7CVwKPiAJCQlicmVhazsJCQlc
Cj4gCQljYXNlIDQ6CQkJCVwKPiAJCQlfX3kgPSBwYXJpdHkzMihfX3gpOwlcCj4gCQkJYnJlYWs7
CQkJXAo+IAkJY2FzZSA4OgkJCQlcCj4gCQkJX195ID0gcGFyaXR5NjQoX194KTsJXAo+IAkJCWJy
ZWFrOwkJCVwKPiAJCWRlZmF1bHQ6CQkJXAo+IAkJCUJVSUxEX0JVRygpOwkJXAo+IAkJCWJyZWFr
OwkJCVwKPiAJfQkJCQkJXAo+IAlfX3k7CQkJCQlcCj4gfSkKPgpUaGFuayB5b3UgZm9yIHlvdXIg
ZGV0YWlsZWQgcmVzcG9uc2UgYW5kIGZvciBleHBsYWluaW5nIHRoZSByYXRpb25hbGUKYmVoaW5k
IHlvdXIgcHJlZmVyZW5jZS4gVGhlIHBvaW50cyB5b3Ugb3V0bGluZWQgaW4gKGEp4oCTKGQpIGFs
bCBzZWVtCnF1aXRlIHJlYXNvbmFibGUgdG8gbWUuCgpZdXJ5LApkbyB5b3UgaGF2ZSBhbnkgZmVl
ZGJhY2sgb24gdGhpcz8KVGhhbmsgeW91LgoKUmVnYXJkcywKS3Vhbi1XZWkKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
