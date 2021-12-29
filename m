Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE56C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Dec 2021 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z6aPPGAnIazbEABtgrjzqiOcc2Kz8OosExR3ANaAx4k=; b=VX9NV6bCGxoWKl
	qSgruDW6uTK/7KdfXapBY5qYVUHimGkWErNepmWIap1gQvgRM+WZb2laEp0Umeml3KqwxfGQl8bd/
	7D1p2m4eaXcA9MilLSUSCq82bZIKDrOepDwqMGzwV9GlUClcymQaeQaQfpLDZLxWLCAtEV9JKjf/E
	M7GD0RdhPqoDWRLsn0EsiabWJs9Ugp8phHJWjrV9nYQupbom3IDtT2t8LfgK+WiM46xMWt1IN5kO0
	a5lTVPdhiSsJC/K8CD28avTUf/Jvzq4Y7zy2iCq/d+EesU2pB1Ow8A1M4n9cOQ5YCQ9C+iCZuwddv
	JhWNhhtKoBfHoWDmH9lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2arD-00310z-No; Wed, 29 Dec 2021 15:27:15 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2arA-003107-8C
 for linux-mtd@lists.infradead.org; Wed, 29 Dec 2021 15:27:14 +0000
Received: by mail-lj1-x241.google.com with SMTP id r22so36241852ljk.11
 for <linux-mtd@lists.infradead.org>; Wed, 29 Dec 2021 07:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RdskZ3DIWmnCrKzc0P8lQBtcPf0vTCkS8urqejAq9dk=;
 b=aOgQjjY0wAD1A11xLgRR9ScZHOJt7fSzGgVtGa1G2p794zEPO7ShId84P5BU8YQB+A
 i24In0JajikL0nY62TuDi2wCrViuOIQRm/PnAMBm4u80orqYIJxmDQQrvNxZ/wVzqvKk
 ZWzQvYp+UlEOXY+CIsAaAfHqgF2Mqog8e44Ryh4liRUfx7kT2sPBZ3K7QCHCnp2XAykR
 iM9FTr+Kkv308q5IzHz4oxy0V7peQiDm7N2ehIW6UwEAsld7PgEedTLDaDyP9Ke4EqO3
 Lnb48gPRGXl30liOsKEwa+yDaY97T/GFEWJYw8ldWQ9IOYfxSqHN7IJ4RAJ0ITvPK2a6
 BtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RdskZ3DIWmnCrKzc0P8lQBtcPf0vTCkS8urqejAq9dk=;
 b=YB2wq6pVilRvzxVqRxZq/gXyRSAcOp34BK2I1oWAsIxRI2iRB3vFcvDtQ4U+6D30mY
 OHz5X232F1hKumVXRL1TjuP9fbR1gejnQ56LkGYKaDIxslnbDvDLuAdbgnnjTBk1q9Q0
 BqKLKSVuxEORvCY4aCwq0wWFd/6ypwuLECAA5eGiHu0EPstVrXql5A2gSM65hmGqKRyq
 0ZwaIEt34rbM0TmI5SV/TU1wri0euFtq9JaQ1DRU8WGOpcYKQumk34b2/dKJRAqTJmK3
 numtbFZCqDqyDDFFErsqTQD+YKvx+esb/oYOCRoWmgJD0JPUE5mMV2YQi7vEbUAAPFiK
 xyuw==
X-Gm-Message-State: AOAM532ZtE/Wo0gZsPf2y3UqFIb0amPzXGUQMlxaRO0S6DU5F4v8h3Bg
 +BKFk2JlfupZTlpyB0dyeIJMQrWHlTnWBiG8hazlQCJXa6HleA==
X-Google-Smtp-Source: ABdhPJz7SKbuZsVd7AZRYF0UDgY6AaPeoGBgm/iLCieCL5SSo1pIKqnjBpwxzKuIcYLR+DZBrEKofjz09u8GD3fTqVw=
X-Received: by 2002:a05:651c:b13:: with SMTP id
 b19mr16910516ljr.298.1640791629024; 
 Wed, 29 Dec 2021 07:27:09 -0800 (PST)
MIME-Version: 1.0
References: <CADPmmj4xHLvptkPXga-Cv1WfBr+qXbaib1io1FUfRx+Ac1e+sQ@mail.gmail.com>
 <9c6d1f5d-0f84-4e2a-3d05-9bbb11eb985c@huawei.com>
In-Reply-To: <9c6d1f5d-0f84-4e2a-3d05-9bbb11eb985c@huawei.com>
From: =?UTF-8?B?6Z+p5LuB5p2w?= <hanrenjie123@gmail.com>
Date: Wed, 29 Dec 2021 23:26:47 +0800
Message-ID: <CADPmmj6kcEYYHE4w-BKQ2y4ceATTU7N=h-M821ksrt1eTLpiOg@mail.gmail.com>
Subject: Re: UBIFS: ubifs_recover_leb() always execute fix_unclean_leb() even
 all the nodes are valid
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_072713_124444_15D1CF02 
X-CRM114-Status: GOOD (  27.38  )
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

SGkgWmhpaGFvCgo+SSBndWVzcyBpbXBvcnZlZCB1Ymlmc19yZWNvdmVyX2xlYigpIGNhbiBoYW5k
bGUgdW5zdGFibGUgd3JpdGluZyBvbiBuYW5kCj5mbGFzaCBieSBjYWxsaW5nIGZpeF91bmNsZWFu
X2xlYigpIGFmdGVyIGEgcG93ZXItY3V0LiBMYXN0IHByb2dyYW1taW5nCj5iZWZvcmUgcG93ZXIt
Y3V0IG9uIFBFQiBpcyB1bnRydXN0YWJsZSwgZXZlbiB0aG91Z2ggdGhlIFBFQiBpcwo+cmVjb2du
aXplZCBhcyB2YWxpZCBmb3IgdGhlIG1vbWVudCwgdGhlcmUgbWF5YmUgYW5vdGhlciBkYXRhIGNv
bnRlbnQKPnJlYWQgZnJvbSB0aGUgc2FtZSBQRUIgYWZ0ZXIgYSB3aGlsZS4gSnVzdCBsaWtlIGNv
bW1pdCBzYWlkLCB1bnN0YWJsZQo+Yml0cywgd2hpY2ggbWF5IGZhaWwgdWJpZnNfc2NhbigpLgoK
U29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiBJIHNhdyB0aGUgY29tbWVudCBpbiB0aGUgY29tbWl0
LCBidXQgSSBkb27igJl0CnVuZGVyc3RhbmQgdGhlIG1lYW5pbmcgb2YgdW5zdGFibGUgYml0cyB2
ZXJ5IHdlbGwuIERvZXMgaXQgbWVhbiB0aGF0CnVuc3RhYmxlIGJpdHMgbWF5IGFwcGVhciBpbiB0
aGUgYXJlYSBhZnRlciB0aGUgY3VycmVudCBvZmZzZXQgYW5kIGNhdXNlCnN1YnNlcXVlbnQgd3Jp
dGUgb3BlcmF0aW9ucyB0byBmYWlsPyBCdXQgd2hlbiBJIGNvcHkgdGhlIG9yaWdpbmFsIGRhdGEK
dG8gYW5vdGhlciBQRUIsIHRoZXJlIHNob3VsZCBiZSB0aGUgc2FtZSBwcm9iYWJpbGl0eSB0aGF0
IHVuc3RhYmxlIGJpdHMKd2lsbCBhcHBlYXI/CkkgaGF2ZSBhIGd1ZXNzLiBJcyBpdCBwb3NzaWJs
ZSB0aGF0IHRoZSBkYXRhIGlzIGNvcGllZCB0byBhbm90aGVyIFBFQgpiZWNhdXNlIHRoZXJlIG1h
eSBiZSBtb3JlIHVzZWxlc3MgZGF0YSBpbiB0aGUgY3VycmVudCBQRUIgaW4gb3JkZXIKdG8gcmVj
b3ZlciB0aGUgZW50aXJlIFBFQj8KClpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+IOS6jjIwMjHlubQxMuaciDI15pel5ZGo5YWtIDEwOjIz5YaZ6YGT77yaCj4KPiDlnKggMjAy
MS8xMi8yNCAxNTo1OCwg6Z+p5LuB5p2wIOWGmemBkzoKPiBIaSwg5LuB5p2wCj4gPiBJJ3ZlIGJl
ZW4gd29ya2luZyBvbiBMaW51eCA0LjQuNjAgcmVjZW50bHkgV2hlbiB1c2luZyBVQklGUyBmaWxl
IHN5c3RlbSwKPiA+Cj4gPiBJIHJlY2VudGx5IGVuY291bnRlcmVkIGEgcHJvYmxlbSB0aGF0IGV2
ZXJ5IHRpbWUgSSBwb3dlciBvZmYgYW5kIHJlc3RhcnQsCj4gPgo+ID4gSSB3aWxsIGVudGVyIHRo
ZSByZWNvdmVyeSBwcm9jZXNzIG9mIFVCSUZTLgo+ID4KPiA+Cj4gPgo+ID4gSSBkbyB1bmRlcnN0
YW5kIHRoZSByZWFzb24gZm9yIGVudGVyaW5nIHJlY292ZXJ5IGR1cmluZyBzdGFydHVwLCBhbmQg
dGhlCj4gPgo+ID4gbWFpbiAgcHVycG9zZSBvZiB1Ymlmc19yZWNvdmVyX2xlYigpIGlzIHRvIGRl
YWwgd2l0aCBhbiBpbnZhbGlkIG5vZGUgYW5kCj4gPgo+ID4gbWFrZSB1YmlmcyBtb3VudCBzdWNj
ZXNzZnVsbHkuIEJ1dCBldmVuIGlmIHRoZXJlIGFyZSBubyBpbnZhbGlkIG5vZGVzLAo+ID4KPiA+
IHViaWZzX3JlY292ZXJfbGViKCkgd2lsbCBjYWxsICBmaXhfdW5jbGVhbl9sZWIoKSwgd2hpY2gg
cmVzdWx0cyBpbiBmbGFzaOKAmXMgZXJhc2UKPiA+Cj4gPiBhbmQgd3JpdGUgb3BlcmF0aW9ucyBk
dXJpbmcgc3RhcnR1cC4KPiA+Cj4gPgo+ID4KPiA+IEkgY2hlY2tlZCB0aGUgbW9kaWZ5IGhpc3Rv
cnkgb2Yga2VybmVsL2ZzL3ViaWZzL3JlY292ZXJ5LmMsIGFuZCBmb3VuZCBhIHJlbGF0ZWQKPiA+
Cj4gPiBjb21taXQ6Cj4gPgo+ID4gICAgaHR0cDovL2dpdC5pbmZyYWRlYWQub3JnL2xpbnV4Lmdp
dC9jb21taXRkaWZmLzdjNDdiZmQwZGJiMjBlNWQ3ZmE0ZTM3Y2ZkNzZiYjcKPiA+Cj4gPiAzZDM5
YjMyYjQ/aHA9NjE3OTkyMDY5NTEzYzFlNzg5YzcwN2M0ZDc1ZmYwM2JmN2RkMGZiMC4KPiA+Cj4g
Pgo+ID4KPiA+IEluIHRoZSBjb21taXQsIHZhcmlhYmxlICJuZWVkX2NsZWFuIiB3YXMgZGVsZXRl
ZC4gTXkgcXVlc3Rpb24gaXMgdGhhdAo+ID4gd2hldGhlciBpdCBpcwo+ID4KPiA+IG5lY2Vzc2Fy
eSB0byBleGVjdXRlIGZpeF91bmNsZWFuX2xlYigpIGlmIHRoZXJlIGFyZSBubyBpbnZhbGlkIG5v
ZGUgPwo+ID4gSSBhbSBub3Qgc3VyZSBpZgo+ID4KPiA+IHRoZXJlIGFyZSBzb21lIGFkZGl0aW9u
YWwgY29uc2lkZXJhdGlvbnMgSSBkaWRuJ3QgdGhpbmsgb2YgPwo+Cj4gQWNjb3JkaW5nIHRvIHRo
ZSBkZXNjcmlwdGlvbiBpbiBjb21taXQKPiA3YzQ3YmZkMGRiYjIwZTVkN2ZhNGUzN2NmZDc2YmI3
M2QzOWIzMmI0KCJVQklGUzogYWx3YXlzIGNsZWFudXAgdGhlCj4gcmVjb3ZlcmVkIExFQiIpOgo+
ICJOb3cgd2hlbiB3ZSBjYWxsICd1Ymlmc19yZWNvdmVyX2xlYigpJyBvbmx5IGZvciBMRUJzIHdo
aWNoIGFyZQo+IHBvdGVudGlhbGx5IGNvcnJ1cHRlZCAoaS5lLiwgb25seSBmb3IgbGFzdCBidWRz
LCBub3QgZm9yIGFsbCBvZiB0aGVtKSwKPiB3ZSBjYW4gY2xlYW51cCBldmVyeSBMRUIsIG5vdCBv
bmx5IHRob3NlIHdoZXJlIHdlIGZpbmQgY29ycnVwdGlvbi4gVGhlCj4gcmVhc29uIC0gdW5zdGFi
bGUgYml0cy4gRXZlbiB0aG91Z2ggdGhlIExFQiBtYXkgbG9vayBnb29kIG5vdywgaXQgbWlnaHQK
PiBjb250YWluIHVuc3RhYmxlIGJpdHMgd2hpY2ggbWF5IGhpdCB1cyBhIGJpdCBsYXRlci4iCj4K
PiBJIGd1ZXNzIGltcG9ydmVkIHViaWZzX3JlY292ZXJfbGViKCkgY2FuIGhhbmRsZSB1bnN0YWJs
ZSB3cml0aW5nIG9uIG5hbmQKPiBmbGFzaCBieSBjYWxsaW5nIGZpeF91bmNsZWFuX2xlYigpIGFm
dGVyIGEgcG93ZXItY3V0LiBMYXN0IHByb2dyYW1taW5nCj4gYmVmb3JlIHBvd2VyLWN1dCBvbiBQ
RUIgaXMgdW50cnVzdGFibGUsIGV2ZW4gdGhvdWdoIHRoZSBQRUIgaXMKPiByZWNvZ25pemVkIGFz
IHZhbGlkIGZvciB0aGUgbW9tZW50LCB0aGVyZSBtYXliZSBhbm90aGVyIGRhdGEgY29udGVudAo+
IHJlYWQgZnJvbSB0aGUgc2FtZSBQRUIgYWZ0ZXIgYSB3aGlsZS4gSnVzdCBsaWtlIGNvbW1pdCBz
YWlkLCB1bnN0YWJsZQo+IGJpdHMsIHdoaWNoIG1heSBmYWlsIHViaWZzX3NjYW4oKS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
