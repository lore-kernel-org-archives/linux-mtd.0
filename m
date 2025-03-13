Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC4EC282DE
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 07:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKHAhSUT/htk2CVmlC9BmW0G5YNE0cs6TyORsdf+x1c=; b=yr7LT03/Jqzq9y
	Jd144WwB0FEU8T3MWRqR2ck/nH4u3tYqum069NmlHlLbOglHYqZHZQf4Fpy46lCh1TnaSyWixa40a
	FVpDEMh+IKzrwHoLUlujHMXhSySVU0NyKnDtB9rpYzVbksCechkyxmZhQBg/LevRSN+TdC1IXQwBW
	Ess2HZ+PDQPbVLd8ZN7DtOB0+IF0TkiZ75U3KKzMT64Syg/13NVUjlngZzmpikZsOT9jQt2MkcXYw
	5j9SCM4/pPOT8a5jkD+ZM759h9qVJ8IVhyTmdvW2Lzag78HRCx/4wkAlXrs8D4EGiObos58vNUt6b
	lc/nwLmxxMZssP5tG8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdMQ-0000000ARrO-00Yb;
	Thu, 13 Mar 2025 07:52:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdCQ-0000000APQ0-1dv9
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 07:41:51 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-224171d6826so14552935ad.3
        for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2025 00:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741851710; x=1742456510; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q+GuHgctQUjPu8SmpY2/kJHnsOJEHrIhv+etu/GaNm0=;
        b=NiFQtKZel9hdJ11fMAeJEf/DdQTRFMl3j9PLzV5L8K5vmo5bdxoOGuhvsV7nPGFuSg
         1WvGtcgto96b9VHOQjtUHh4wa5B2hQYGc3ukYhdIwfkuq1GdQGi+9uxMKGH8BzUjXEN1
         EDo74ZxBbMvPOSVG39/HaGfJlRmFDT7lMT2AcWZ0g8cy9ni5LpTjkCuNgNGk4s3kzlen
         Kk6SE/TVhUbtjWq8iYdKAM6x9QZpE5aNIWEaI5F4aEgsSWBlOeD0WK/IyEj/Qt/mhjVL
         SKfBfPVDV6SB//yHPuss7Wq+QYNxn8oW9T60/x9mZwrR8fP40lAUwmDzF+ueSQ0bZyrx
         v+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741851710; x=1742456510;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+GuHgctQUjPu8SmpY2/kJHnsOJEHrIhv+etu/GaNm0=;
        b=vTSpIUalJ5K+weLlJwB41Fos7xmDrWhGlKQ3z2FFlBd/yJnA0GbP2SUzWFyfKW6Rfv
         9XlmUh53xuosqxoyWnx1SHE30BZ7gEw5hC7MCSCFAoaBPg5DfW1zHAiQJO7CgzF/NCYz
         tElTshLeWVxXNkqOtTfyGXoaGD0FEnLpAuPT+lWsCaPLvtbfJ/mqSY+CPb/2KYnGujOp
         YESMTsTnxQjxR1HIdprT5SNnIOKWlxzpPhg39Clwf6TPb5+RDWkS3+9iwnIAy3xkScgt
         6lwWSE35NlMB3mXs3jcIxuZ7PrrQpX+PlX7CRCDT5KeiTarkuScElCCXj3hlSWRAzxjM
         ZL4w==
X-Forwarded-Encrypted: i=1; AJvYcCVbJFxjcUQ4nbEuc8XV5qlzu6gNBYRv5BGZE6EORaRvSZMDFoeke46+RHrJDoUml6AApRYTDKXF/MQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvaQU8yrJ1WWndgkGRyyXRAvZ9Sts6nAYwcxA849+yDigTdm2N
	jXv2PIPQaLJTs6MrTgQo38g/B+qCgSR7Q1QLvvKGLPPriOqnsu01
X-Gm-Gg: ASbGncv58b0YTGJmXT0p1tb8dS5la6CDPCSATn2RJys5dpy3a+kJx3ip+EYgguWSvDH
	w0rz0FMz8csH+5yjYtJvR1fUobL3L6qcLB4AA85Uycv8DiJx8XiCtuHe4hmpaG529bh+LMwW4II
	Ga7UkuGcfksrk/kTM63mSrRpgfUqJsolv/0+a1xsB+FICWmQATBrb/3v6josyfH6pdFhUSRvp9/
	ARbm+7hYboAAYJEQ3CwD0Q8/CMnI8qVAmWLcK/r3ZaVFuliHKQ/j3Zudk2ZxlW5y607OJO1EiqP
	4iTobimBiTY9I5CREQs8MYJnmKIK4v6C33iKcyGsP+babXj48AJOt9mDRRaNhWUT2fpLc9iC
X-Google-Smtp-Source: AGHT+IEOnE1UaBfwg9ZU2VkCWkw1Gp3ScOp6qbkmR7UKjY7r7OwrFGhsef4Fbyqmd9ry/T9u8Qiz3A==
X-Received: by 2002:a17:902:e5d2:b0:21f:859a:9eab with SMTP id d9443c01a7336-22428ab8647mr372797915ad.37.1741851709556;
        Thu, 13 Mar 2025 00:41:49 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6888d9bsm7284085ad.49.2025.03.13.00.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 00:41:48 -0700 (PDT)
Date: Thu, 13 Mar 2025 15:41:31 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
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
Message-ID: <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
 <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
 <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_004150_433039_F0854360 
X-CRM114-Status: GOOD (  50.04  )
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

T24gVGh1LCBNYXIgMTMsIDIwMjUgYXQgMTI6Mjk6MTNBTSArMDgwMCwgS3Vhbi1XZWkgQ2hpdSB3
cm90ZToKPiBPbiBXZWQsIE1hciAxMiwgMjAyNSBhdCAxMTo1MToxMkFNIC0wNDAwLCBZdXJ5IE5v
cm92IHdyb3RlOgo+ID4gT24gVHVlLCBNYXIgMTEsIDIwMjUgYXQgMDM6MjQ6MTRQTSAtMDcwMCwg
SC4gUGV0ZXIgQW52aW4gd3JvdGU6Cj4gPiA+IE9uIE1hcmNoIDExLCAyMDI1IDM6MDE6MzAgUE0g
UERULCBZdXJ5IE5vcm92IDx5dXJ5Lm5vcm92QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID5PbiBT
dW4sIE1hciAwOSwgMjAyNSBhdCAxMTo0ODoyNlBNICswODAwLCBLdWFuLVdlaSBDaGl1IHdyb3Rl
Ogo+ID4gPiA+PiBPbiBGcmksIE1hciAwNywgMjAyNSBhdCAxMjowNzowMlBNIC0wODAwLCBILiBQ
ZXRlciBBbnZpbiB3cm90ZToKPiA+ID4gPj4gPiBPbiBNYXJjaCA3LCAyMDI1IDExOjUzOjEwIEFN
IFBTVCwgRGF2aWQgTGFpZ2h0IDxkYXZpZC5sYWlnaHQubGludXhAZ21haWwuY29tPiB3cm90ZToK
PiA+ID4gPj4gPiA+T24gRnJpLCAwNyBNYXIgMjAyNSAxMTozMDozNSAtMDgwMAo+ID4gPiA+PiA+
ID4iSC4gUGV0ZXIgQW52aW4iIDxocGFAenl0b3IuY29tPiB3cm90ZToKPiA+ID4gPj4gPiA+Cj4g
PiA+ID4+ID4gPj4gT24gTWFyY2ggNywgMjAyNSAxMDo0OTo1NiBBTSBQU1QsIEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gPiA+PiA+ID4+ID4+IChp
bnQpdHJ1ZSBtb3N0IGRlZmluaXRlbHkgaXMgZ3VhcmFudGVlZCB0byBiZSAxLiAgCj4gPiA+ID4+
ID4gPj4gPgo+ID4gPiA+PiA+ID4+ID5UaGF0J3Mgbm90IHRlY2huaWNhbGx5IGNvcnJlY3QgYW55
IG1vcmUuCj4gPiA+ID4+ID4gPj4gPgo+ID4gPiA+PiA+ID4+ID5HQ0MgaGFzIGludHJvZHVjZWQg
aGFyZGVuZWQgYm9vbHMgdGhhdCBpbnRlbnRpb25hbGx5IGhhdmUgYml0IHBhdHRlcm5zCj4gPiA+
ID4+ID4gPj4gPm90aGVyIHRoYW4gMCBhbmQgMS4KPiA+ID4gPj4gPiA+PiA+Cj4gPiA+ID4+ID4g
Pj4gPmh0dHBzOi8vZ2NjLmdudS5vcmcvZ2NjLTE0L2NoYW5nZXMuaHRtbAo+ID4gPiA+PiA+ID4+
ID4KPiA+ID4gPj4gPiA+PiA+fkFuZHJldyAgCj4gPiA+ID4+ID4gPj4gCj4gPiA+ID4+ID4gPj4g
Qml0IHBhdHRlcm5zIGluIG1lbW9yeSBtYXliZSAobm90IHRoYXQgSSBjYW4gc2VlIHRoZSBMaW51
eCBrZXJuZWwgdXNpbmcgdGhlbSkgYnV0Cj4gPiA+ID4+ID4gPj4gZm9yIGNvbXBpbGVyLWdlbmVy
YXRlZCBjb252ZXJzYXRpb25zIHRoYXQncyBzdGlsbCBhIGdpdmVuLCBvciB0aGUgbWFuYWdlciBp
c24ndCBDCj4gPiA+ID4+ID4gPj4gb3IgYW55dGhpbmcgZXZlbiByZW1vdGVseSBsaWtlIGl0Lgo+
ID4gPiA+PiA+ID4+IAo+ID4gPiA+PiA+ID4KPiA+ID4gPj4gPiA+VGhlIHdob2xlIGlkZWEgb2Yg
J2Jvb2wnIGlzIHByZXR0eSBtdWNoIGJyb2tlbiBieSBkZXNpZ24uCj4gPiA+ID4+ID4gPlRoZSB1
bmRlcmx5aW5nIHByb2JsZW0gaXMgdGhhdCB2YWx1ZXMgb3RoZXIgdGhhbiAndHJ1ZScgYW5kICdm
YWxzZScgY2FuCj4gPiA+ID4+ID4gPmFsd2F5cyBnZXQgaW50byAnYm9vbCcgdmFyaWFibGVzLgo+
ID4gPiA+PiA+ID4KPiA+ID4gPj4gPiA+T25jZSB0aGF0IGhhcyBoYXBwZW5lZCBpdCBpcyBhbGwg
ZnViYXIuCj4gPiA+ID4+ID4gPgo+ID4gPiA+PiA+ID5UcnlpbmcgdG8gc2FuaXRpc2UgYSB2YWx1
ZSB3aXRoIChzYXkpOgo+ID4gPiA+PiA+ID5pbnQgZihib29sIHYpCj4gPiA+ID4+ID4gPnsKPiA+
ID4gPj4gPiA+CXJldHVybiAoaW50KXYgJiAxOwo+ID4gPiA+PiA+ID59ICAgIAo+ID4gPiA+PiA+
ID5qdXN0IGRvZXNuJ3Qgd29yayAoc2VlIGh0dHBzOi8vd3d3LmdvZGJvbHQub3JnL3ovTUVuZFAz
cTlqKQo+ID4gPiA+PiA+ID4KPiA+ID4gPj4gPiA+SSByZWFsbHkgZG9uJ3Qgc2VlIGhvdyB1c2lu
ZyAoc2F5KSAweGFhIGFuZCAweDU1IGhlbHBzLgo+ID4gPiA+PiA+ID5XaGF0IGhhcHBlbnMgaWYg
dGhlIHZhbHVlIGlzIHdyb25nPyBhIHRyYXAgb3IgZXhjZXB0aW9uPywgZ29vZCBsdWNrIHJlY292
ZXJpbmcKPiA+ID4gPj4gPiA+ZnJvbSB0aGF0Lgo+ID4gPiA+PiA+ID4KPiA+ID4gPj4gPiA+CURh
dmlkCj4gPiA+ID4+ID4gCj4gPiA+ID4+ID4gRGlkIHlvdSBqdXN0IGRpc2NvdmVyIEdJR08/Cj4g
PiA+ID4+IAo+ID4gPiA+PiBUaGFua3MgZm9yIGFsbCB0aGUgc3VnZ2VzdGlvbnMuCj4gPiA+ID4+
IAo+ID4gPiA+PiBJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiBvbiB0aGUgbmFtaW5nIG9y
IHJldHVybiB0eXBlLiBJJ20gc3RpbGwgYQo+ID4gPiA+PiBiaXQgY29uZnVzZWQgYWJvdXQgd2hl
dGhlciBJIGNhbiBhc3N1bWUgdGhhdCBjYXN0aW5nIGJvb2wgdG8gaW50IGFsd2F5cwo+ID4gPiA+
PiByZXN1bHRzIGluIDAgb3IgMS4KPiA+ID4gPj4gCj4gPiA+ID4+IElmIHRoYXQncyB0aGUgY2Fz
ZSwgc2luY2UgbW9zdCBwZW9wbGUgcHJlZmVyIGJvb2wgb3ZlciBpbnQgYXMgdGhlCj4gPiA+ID4+
IHJldHVybiB0eXBlIGFuZCBzb21lIGFyZSBhZ2FpbnN0IGludHJvZHVjaW5nIHUxLCBteSBjdXJy
ZW50IHBsYW4gaXMgdG8KPiA+ID4gPj4gdXNlIHRoZSBmb2xsb3dpbmcgaW4gdGhlIG5leHQgdmVy
c2lvbjoKPiA+ID4gPj4gCj4gPiA+ID4+IGJvb2wgcGFyaXR5X29kZCh1NjQgdmFsKTsKPiA+ID4g
Pj4gCj4gPiA+ID4+IFRoaXMga2VlcHMgdGhlIGJvb2wgcmV0dXJuIHR5cGUsIHJlbmFtZXMgdGhl
IGZ1bmN0aW9uIGZvciBiZXR0ZXIKPiA+ID4gPj4gY2xhcml0eSwgYW5kIGF2b2lkcyBleHRyYSBt
YWludGVuYW5jZSBidXJkZW4gYnkgaGF2aW5nIGp1c3Qgb25lCj4gPiA+ID4+IGZ1bmN0aW9uLgo+
ID4gPiA+PiAKPiA+ID4gPj4gSWYgSSBjYW4ndCBhc3N1bWUgdGhhdCBjYXN0aW5nIGJvb2wgdG8g
aW50IGFsd2F5cyByZXN1bHRzIGluIDAgb3IgMSwKPiA+ID4gPj4gd291bGQgaXQgYmUgYWNjZXB0
YWJsZSB0byBrZWVwIHRoZSByZXR1cm4gdHlwZSBhcyBpbnQ/Cj4gPiA+ID4+IAo+ID4gPiA+PiBX
b3VsZCB0aGlzIHdvcmsgZm9yIGV2ZXJ5b25lPwo+ID4gPiA+Cj4gPiA+ID5BbHJpZ2h0LCBpdCdz
IGNsZWFybHkgYSBzcGxpdCBvcGluaW9uLiBTbyB3aGF0IEkgd291bGQgZG8gbXlzZWxmIGluCj4g
PiA+ID5zdWNoIGNhc2UgaXMgdG8gbG9vayBhdCBleGlzdGluZyBjb2RlIGFuZCBzZWUgd2hhdCBw
ZW9wbGUgd2hvIHJlYWxseQo+ID4gPiA+bmVlZCBwYXJpdHkgaW52ZW50IGluIHRoZWlyIGRyaXZl
cnM6Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
b29sICAgICAgcGFyaXR5X29kZAo+ID4gPiA+c3RhdGljIGlubGluZSBpbnQgcGFyaXR5OCh1OCB2
YWwpICAgICAgIC0gICAgICAgICAgICAgICAtCj4gPiA+ID5zdGF0aWMgdTggY2FsY19wYXJpdHko
dTggdmFsKSAgICAgICAgICAgLSAgICAgICAgICAgICAgIC0KPiA+ID4gPnN0YXRpYyBpbnQgb2Rk
X3Bhcml0eSh1OCBjKSAgICAgICAgICAgICAtICAgICAgICAgICAgICAgKwo+ID4gPiA+c3RhdGlj
IGludCBzYWE3MTF4X29kZF9wYXJpdHkgICAgICAgICAgIC0gICAgICAgICAgICAgICArCj4gPiA+
ID5zdGF0aWMgaW50IG1heDMxMDBfZG9fcGFyaXR5ICAgICAgICAgICAgLSAgICAgICAgICAgICAg
IC0KPiA+ID4gPnN0YXRpYyBpbmxpbmUgaW50IHBhcml0eSh1bnNpZ25lZCB4KSAgICAtICAgICAg
ICAgICAgICAgLQo+ID4gPiA+c3RhdGljIGludCBiaXRfcGFyaXR5KHUzMiBwa3QpICAgICAgICAg
IC0gICAgICAgICAgICAgICAtCj4gPiA+ID5zdGF0aWMgaW50IG9hX3RjNl9nZXRfcGFyaXR5KHUz
MiBwKSAgICAgLSAgICAgICAgICAgICAgIC0KPiA+ID4gPnN0YXRpYyB1MzIgcGFyaXR5MzIoX19s
ZTMyIGRhdGEpICAgICAgICAtICAgICAgICAgICAgICAgLQo+ID4gPiA+c3RhdGljIHUzMiBwYXJp
dHkodTMyIHNhbXBsZSkgICAgICAgICAgIC0gICAgICAgICAgICAgICAtCj4gPiA+ID5zdGF0aWMg
aW50IGdldF9wYXJpdHkoaW50IG51bWJlciwgICAgICAgLSAgICAgICAgICAgICAgIC0KPiA+ID4g
PiAgICAgICAgICAgICAgICAgICAgICBpbnQgc2l6ZSkKPiA+ID4gPnN0YXRpYyBib29sIGkyY3Jf
Y2hlY2tfcGFyaXR5MzIodTMyIHYsICArICAgICAgICAgICAgICAgLQo+ID4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgYm9vbCBwYXJpdHkpCj4gPiA+ID5zdGF0aWMgYm9vbCBpMmNyX2NoZWNr
X3Bhcml0eTY0KHU2NCB2KSAgKyAgICAgICAgICAgICAgIC0KPiA+ID4gPnN0YXRpYyBpbnQgc3df
cGFyaXR5KF9fdTY0IHQpICAgICAgICAgICAtICAgICAgICAgICAgICAgLQo+ID4gPiA+c3RhdGlj
IGJvb2wgcGFyaXR5KHU2NCB2YWx1ZSkgICAgICAgICAgICsgICAgICAgICAgICAgICAtCj4gPiA+
ID4KPiA+ID4gPk5vdyB5b3UgY2FuIHJlZmVyIHRvIHRoYXQgdGFibGUgc2F5IHRoYXQgaW50IHBh
cml0eSh1WFgpIGlzIHdoYXQKPiA+ID4gPnBlb3BsZSB3YW50IHRvIHNlZSBpbiB0aGVpciBkcml2
ZXJzLgo+ID4gPiA+Cj4gPiA+ID5XaGljaGV2ZXIgaW50ZXJmYWNlIHlvdSBjaG9vc2UsIHBsZWFz
ZSBkaXNjdXNzIGl0J3MgcHJvcyBhbmQgY29ucy4KPiA+ID4gPldoYXQgYmxvYXQtby1tZXRlciBz
YXlzIGZvciBlYWNoIG9wdGlvbj8gV2hhdCdzIG1haW50ZW5hbmNlIGJ1cmRlbj8KPiA+ID4gPlBl
cmYgdGVzdD8gTG9vayBhdCBnZW5lcmF0ZWQgY29kZT8KPiA+ID4gPgo+ID4gPiA+SSBwZXJzb25h
bGx5IGZvciBhIG1hY3JvIHJldHVybmluZyBib29sZWFuLCBzb21ldGhpbmcgbGlrZSBJCj4gPiA+
ID5wcm9wb3NlZCBhdCB0aGUgdmVyeSBiZWdpbm5pbmcuCj4gPiA+ID4KPiA+ID4gPlRoYW5rcywK
PiA+ID4gPll1cnkKPiA+ID4gCj4gPiA+IEFsc28sIHBsZWFzZSBhdCBsZWFzdCBwcm92aWRlIGEg
d2F5IGZvciBhbiBhcmNoIHRvIG9wdCBpbiB0byB1c2luZyB0aGUgYnVpbHRpbnMsIHdoaWNoIHNl
ZW0gdG8gcHJvZHVjZSBhcyBnb29kIHJlc3VsdHMgb3IgYmV0dGVyIGF0IGxlYXN0IG9uIHNvbWUg
YXJjaGl0ZWN0dXJlcyBsaWtlIHg4NiBhbmQgcHJvYmFibHkgd2l0aCBDUFUgb3B0aW9ucyB0aGF0
IGltcGx5IGZhc3QgcG9wY250IGlzIGF2YWlsYWJsZS4KPiA+IAo+ID4gWWVhaC4gQW5kIGJlY2F1
c2UgbGludXgvYml0b3BzLmggYWxyZWFkeSBpbmNsdWRlcyBhc20vYml0b3BzLmgKPiA+IHRoZSBz
aW1wbGVzdCB3YXkgd291bGQgYmUgd3JhcHBpbmcgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiB3aXRo
Cj4gPiB0aGUgI2lmbmRlZiBwYXJpdHksIHNpbWlsYXJseSB0byBob3cgd2UgaGFuZGxlIGZpbmRf
bmV4dF9iaXQgY2FzZS4KPiA+IAo+ID4gU286Cj4gPiAxLiBLdWFuLVdlaSwgcGxlYXNlIGRvbid0
IGludmVudCBzb21ldGhpbmcgbGlrZSBBUkNIX0hBU19QQVJJVFk7Cj4gPiAyLiBUaGlzIG1heSwg
YW5kIHByb2JhYmx5IHNob3VsZCwgYmUgYSBzZXBhcmF0ZSBmb2xsb3ctdXAgc2VyaWVzLAo+ID4g
ICAgbGlrZWx5IGNyZWF0ZWQgYnkgY29ycmVzcG9uZGluZyBhcmNoIGV4cGVydHMuCj4gPiAKPiBJ
IHNhdyBkaXNjdXNzaW9ucyBpbiB0aGUgcHJldmlvdXMgZW1haWwgdGhyZWFkIGFib3V0IGJvdGgK
PiBfX2J1aWx0aW5fcGFyaXR5IGFuZCB4ODYtc3BlY2lmaWMgaW1wbGVtZW50YXRpb25zLiBIb3dl
dmVyLCBmcm9tIHRoZQo+IGRpc2N1c3Npb24sIEkgbGVhcm5lZCB0aGF0IGJlZm9yZSBjb25zaWRl
cmluZyBhbnkgb3B0aW1pemF0aW9uLCB3ZQo+IHNob3VsZCBmaXJzdCBhc2s6IHdoaWNoIGRyaXZl
ciBvciBzdWJzeXN0ZW0gYWN0dWFsbHkgY2FyZXMgYWJvdXQgcGFyaXR5Cj4gZWZmaWNpZW5jeT8g
SWYgc29tZW9uZSBkb2VzLCBJIGNhbiBoZWxwIHdpdGggYSBtaWNyby1iZW5jaG1hcmsgdG8KPiBw
cm92aWRlIHBlcmZvcm1hbmNlIG51bWJlcnMsIGJ1dCBJIGRvbid0IGhhdmUgZW5vdWdoIGRvbWFp
biBrbm93bGVkZ2UKPiB0byBpZGVudGlmeSBob3QgcGF0aHMgd2hlcmUgcGFyaXR5IGVmZmljaWVu
Y3kgbWF0dGVycy4KPiAKSU1ITywKCklmIHBhcml0eSBpcyBuZXZlciB1c2VkIGluIGFueSBob3Qg
cGF0aCBhbmQgd2UgZG9uJ3QgY2FyZSBhYm91dCBwYXJpdHk6CgpUaGVuIGJlbmNobWFya2luZyBp
dHMgcGVyZm9ybWFuY2Ugc2VlbXMgbWVhbmluZ2xlc3MuIEluIHRoaXMgY2FzZSwgYQpmdW5jdGlv
biB3aXRoIGEgdTY0IGFyZ3VtZW50IHdvdWxkIHN1ZmZpY2UsIGFuZCB3ZSBtaWdodCBub3QgZXZl
biBuZWVkCmEgbWFjcm8gdG8gb3B0aW1pemUgZm9yIGRpZmZlcmVudCB0eXBlc+KAlGVzcGVjaWFs
bHkgc2luY2UgdGhlIG1hY3JvCnJlcXVpcmVzIHNwZWNpYWwgaGFja3MgdG8gYXZvaWQgY29tcGls
ZXIgd2FybmluZ3MuIEFsc28sIEkgZG9uJ3QgdGhpbmsKY29kZSBzaXplIG1hdHRlcnMgaGVyZS4g
SWYgaXQgZG9lcywgd2Ugc2hvdWxkIGZpcnN0IGNvbnNpZGVyIG1ha2luZwpwYXJpdHkgYSBub24t
aW5saW5lIGZ1bmN0aW9uIGluIGEgLmMgZmlsZSByYXRoZXIgdGhhbiBhbiBpbmxpbmUKZnVuY3Rp
b24vbWFjcm8gaW4gYSBoZWFkZXIuCgpJZiBwYXJpdHkgaXMgdXNlZCBpbiBhIGhvdCBwYXRoOgoK
V2UgbmVlZCBkaWZmZXJlbnQgaGFuZGxpbmcgZm9yIGRpZmZlcmVudCB0eXBlIHNpemVzLiBBcyBw
cmV2aW91c2x5CmRpc2N1c3NlZCwgeDg2IGFzc2VtYmx5IG1pZ2h0IHVzZSBkaWZmZXJlbnQgaW5z
dHJ1Y3Rpb25zIGZvciB1OCBhbmQKdTE2LiBUaGlzIG1heSBzb3VuZCBzdHViYm9ybiwgYnV0IEkg
d2FudCB0byBhc2sgYWdhaW46IHNob3VsZCB3ZQpjb25zaWRlciB1c2luZyBwYXJpdHk4LzE2LzMy
LzY0IGludGVyZmFjZXM/IExpa2UgaW4gdGhlIGkzYyBkcml2ZXIKZXhhbXBsZSwgaWYgd2Ugb25s
eSBoYXZlIGEgc2luZ2xlIHBhcml0eSBtYWNybyB0aGF0IHNlbGVjdHMgYW4KaW1wbGVtZW50YXRp
b24gYmFzZWQgb24gdHlwZSBzaXplLCB1c2VycyBtdXN0IGV4cGxpY2l0bHkgY2FzdCB0eXBlcy4K
SWYgZnV0dXJlIHVzZXJzIGFsc28gbmVlZCBwYXJpdHkgaW4gYSBob3QgcGF0aCwgdGhleSBtaWdo
dCBub3QgYmUgYXdhcmUKb2YgdGhpcyByZXF1aXJlbWVudCBhbmQgZW5kIHVwIGdlbmVyYXRpbmcg
c3Vib3B0aW1hbCBjb2RlLiBTaW5jZSB3ZQpjYXJlIGFib3V0IGVmZmljaWVuY3kgYW5kIGdlbmVy
YXRlZCBjb2RlLCB3aHkgbm90IGZvbGxvdyBod2VpZ2h0KCkgYW5kCnByb3ZpZGUgc2VwYXJhdGUg
aW1wbGVtZW50YXRpb25zIGZvciBkaWZmZXJlbnQgc2l6ZXM/CgpSZWdhcmRzLApLdWFuLVdlaQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
