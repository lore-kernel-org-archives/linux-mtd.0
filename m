Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9C6C4167B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Nov 2023 09:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwI7w3S1Y3o0mh9YwHRKI5b+S9oLgtdNUM3iZw7AvvM=; b=EKr+iU14qH75+n
	Ekf8KJ338LPTNXLzDTmZMyLPRyhs84xNY9E0eDJcISQ5LiFsuMcoHEdVILAA0WvsAd9PYuMnb3iGh
	7Sun8LAbQ3V649j7CIVpNIPpIr4Iwv/tJuNFBDMxJep8UemaBOPUoCGPm7q66MJT5ne4emxW4jTfv
	Ye6ANHZJs/gylVfOOOiCw2LxTkOp9hHBP5uJtS2CwNn/PS4elG2ptbnAYtZ+DzHBZdDuCYYQYUeAf
	t9R/yNbvf3+SN4WZHf81GNyCB+Sp2qEGtIM8aUdtn89sCuOB2Omjza5keOV2R6mkI/s3kcXHKo8wS
	wqTy8+IuXVat6b3p4umQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Gal-007a0h-0n;
	Wed, 29 Nov 2023 09:10:47 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Gah-007Zz7-28
	for linux-mtd@lists.infradead.org;
	Wed, 29 Nov 2023 09:10:45 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-46447559b88so202965137.3
        for <linux-mtd@lists.infradead.org>; Wed, 29 Nov 2023 01:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701249040; x=1701853840; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DXF9O1RgHRA6Q4+fsCadrVtEFEpBPHwaju2dJOOLyU=;
        b=SVPhcPks1JzMv+kzh0ZwpGbi0gNwnLq3I64bh1DXh86YmxXWau5Uer75CRkX7a7hJ6
         a0ci+FVfTAaxUBqSjErrbPMGYTB42Ri9DO99cUKOlmwnX3xZQMWRrlWfR/ntI2KNTX3B
         rpKaoN8jbRzJAUm7KS3CmtbGU96Rpy44IAJovnx3QM3bmqRYoiVKWyS1RwwtTlhnLH22
         N7S8FN1qsjf3zfriRXnX9MBEItA2dTKCI2n5g6J1Ws77pG6BnlpaLhQdX0OXt4LamH+w
         svizdQ0ZbUJgBgMVv/ZFcY6fjpAoI9xjuoMAtewWF+coCx5flh6a3hJ9I/5GqjZoW1Hg
         xuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701249040; x=1701853840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7DXF9O1RgHRA6Q4+fsCadrVtEFEpBPHwaju2dJOOLyU=;
        b=gLphdwF59xUQ4YF5Hzt6nCww2heegTQFEKO09KlmqQvFPs9QHjbH3rYIqQvYIwwf1u
         YmpiGcwFfI3fGv30lXvYM5S1l46suB7g9ytV1ggDY89DdLZNIONhMKmJlFzwONitHUDt
         V1qydm9/JV+yd8B3hkJAqLii3bIOgizdGW2yhjCDZX0gUVXdBboN8u4kEJcJuD459LBt
         Qi76SxlmYbWPq+hW3JzbfDGJ8/fe13Qyh7q7uP1LTloQnaznkYNUbk+qrVm7fbnVKpDF
         KpapBGY/dpXUpy35e4xAQ06sHcEqO4QBdPaE0F+VdtLUiivqL+dNoSfAvMFpbwknrgqQ
         p7IA==
X-Gm-Message-State: AOJu0YwYTsq9ffG0vlmjW2niK1kQWHs8mIZWJijBUwD7h/3SilsRPMGW
	qqobH7FsIZV7m3XESheOAWa/fAuReOFITG4MWYARcQ==
X-Google-Smtp-Source: AGHT+IF2abYTUSSPdqJxK8T5iWMOWvfZzKBy02SfSs6APR/05/WMDIgddE4+dHi4tbmO6pUDo8nkRwKOy9RHzF4FKCA=
X-Received: by 2002:a05:6102:3746:b0:462:866e:2f2f with SMTP id
 u6-20020a056102374600b00462866e2f2fmr14921238vst.9.1701249039789; Wed, 29 Nov
 2023 01:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20231127164623.1008176-1-m.felsch@pengutronix.de>
In-Reply-To: <20231127164623.1008176-1-m.felsch@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Nov 2023 10:10:28 +0100
Message-ID: <CAMRc=MdsEWxJLHL__zYXGEMYvvLSH99GsTRv_NTaVXt2fGtNvg@mail.gmail.com>
Subject: Re: [RFC PATCH] mtd: devices: add AT24 eeprom support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, arnd@arndb.de, 
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_011043_901255_91798768 
X-CRM114-Status: GOOD (  25.71  )
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

T24gTW9uLCBOb3YgMjcsIDIwMjMgYXQgNTo0NuKAr1BNIE1hcmNvIEZlbHNjaCA8bS5mZWxzY2hA
cGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cgpbc25pcF0KCj4KPiBJIGRyb3BwZWQgdGhlIGJhY2t3
YXJkIGNvbXBhdGliaWxpdHkgc2luY2UgdGhpcyBpcyBhIG5ldyBkcml2ZXIgbm90Cj4gaGF2aW5n
IHRvIGRlYWwgd2l0aCBpdC4gVGhlIG9sZCBhbmQgdGhlIG5ldyBkcml2ZXIgY2FuIG5vdCBiZSB1
c2VkIGJ5Cj4gdGhlIHNhbWUga2VybmVsIGNvbmZpZy4gU28gaXQgaXMgZWl0aGVyIHVzaW5nIHRo
ZSBNVEQgZWVwcm9tIGRyaXZlcgo+IHN1cHBvcnRpbmcgcGFydGl0aW9uaW5nIGFuZCBOVk1FTSBv
ciB0aGUgb2xkZXIgb25lIHdoaWNoIGRvZXMgbm90Cj4gc3VwcG9ydCBwYXJ0aXRpb25pbmcgYnV0
IGtlZXBzIHRoZSBiYWNrd2FyZCBjb21wYXRpYmlsaXR5Lgo+Cj4gQ29tbWVudHMgYW5kIHN1Z2dl
c3Rpb25zIGFyZSB2ZXJ5IHdlbGNvbWUgOikKCkkgc2tpbW1lZCB0aHJvdWdoIHRoZSBjb2RlLiBO
b3RoaW5nIG9idmlvdXNseSB3cm9uZy4gV2hhdCBJIHdvdWxkCnN1Z2dlc3QgLSBpZiB3ZSdyZSBn
b2luZyB0byBoYXZlIHR3byBhdDI0IGRyaXZlcnMgLSBpcyBhIGxvdCBtb3JlIGNvZGUKcmV1c2Uu
IEkgZGlzbGlrZSB0aGUgaWRlYSBvZiBoYXZpbmcgYmFzaWNhbGx5IHRoZSBzYW1lIGNvZGUgaW4g
dHdvCnBsYWNlcyBpbiB0aGUga2VybmVsIGFuZCBoYXZpbmcgdG8gZml4IGJ1Z3MgaW4gYm90aC4K
ClRob3VnaCBpZiBJJ20gYmVpbmcgaG9uZXN0IC0gSSB3b3VsZCBwcmVmZXIgYSBzaW5nbGUgZHJp
dmVyIHdpdGgKYmFja3dhcmRzIGNvbXBhdGliaWxpdHkuIEhhdmUgeW91IGVzdGltYXRlZCB0aGUg
ZWZmb3J0IGl0IHdvdWxkIHRha2UKdG8gYWJzdHJhY3QgYm90aCBudm1lbSBhbmQgbXRkPwoKW3Nu
aXBdCgo+ICsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYXQyNF9vZl9tYXRj
aFtdID0gewo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJhdG1lbCwyNGMwMCIsICAgICAgICAg
IC5kYXRhID0gJmF0MjRfZGF0YV8yNGMwMCB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJh
dG1lbCwyNGMwMSIsICAgICAgICAgIC5kYXRhID0gJmF0MjRfZGF0YV8yNGMwMSB9LAo+ICsgICAg
ICAgeyAuY29tcGF0aWJsZSA9ICJhdG1lbCwyNGNzMDEiLCAgICAgICAgIC5kYXRhID0gJmF0MjRf
ZGF0YV8yNGNzMDEgfSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAiYXRtZWwsMjRjMDIiLCAg
ICAgICAgICAuZGF0YSA9ICZhdDI0X2RhdGFfMjRjMDIgfSwKPiArICAgICAgIHsgLmNvbXBhdGli
bGUgPSAiYXRtZWwsMjRjczAyIiwgICAgICAgICAuZGF0YSA9ICZhdDI0X2RhdGFfMjRjczAyIH0s
Cj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gImF0bWVsLDI0bWFjNDAyIiwgICAgICAgLmRhdGEg
PSAmYXQyNF9kYXRhXzI0bWFjNDAyIH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gImF0bWVs
LDI0bWFjNjAyIiwgICAgICAgLmRhdGEgPSAmYXQyNF9kYXRhXzI0bWFjNjAyIH0sCj4gKyAgICAg
ICB7IC5jb21wYXRpYmxlID0gImF0bWVsLHNwZCIsICAgICAgICAgICAgLmRhdGEgPSAmYXQyNF9k
YXRhX3NwZCB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJhdG1lbCwyNGMwNCIsICAgICAg
ICAgIC5kYXRhID0gJmF0MjRfZGF0YV8yNGMwNCB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9
ICJhdG1lbCwyNGNzMDQiLCAgICAgICAgIC5kYXRhID0gJmF0MjRfZGF0YV8yNGNzMDQgfSwKPiAr
ICAgICAgIHsgLmNvbXBhdGlibGUgPSAiYXRtZWwsMjRjMDgiLCAgICAgICAgICAuZGF0YSA9ICZh
dDI0X2RhdGFfMjRjMDggfSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAiYXRtZWwsMjRjczA4
IiwgICAgICAgICAuZGF0YSA9ICZhdDI0X2RhdGFfMjRjczA4IH0sCj4gKyAgICAgICB7IC5jb21w
YXRpYmxlID0gImF0bWVsLDI0YzE2IiwgICAgICAgICAgLmRhdGEgPSAmYXQyNF9kYXRhXzI0YzE2
IH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gImF0bWVsLDI0Y3MxNiIsICAgICAgICAgLmRh
dGEgPSAmYXQyNF9kYXRhXzI0Y3MxNiB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJhdG1l
bCwyNGMzMiIsICAgICAgICAgIC5kYXRhID0gJmF0MjRfZGF0YV8yNGMzMiB9LAo+ICsgICAgICAg
eyAuY29tcGF0aWJsZSA9ICJhdG1lbCwyNGNzMzIiLCAgICAgICAgIC5kYXRhID0gJmF0MjRfZGF0
YV8yNGNzMzIgfSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAiYXRtZWwsMjRjNjQiLCAgICAg
ICAgICAuZGF0YSA9ICZhdDI0X2RhdGFfMjRjNjQgfSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUg
PSAiYXRtZWwsMjRjczY0IiwgICAgICAgICAuZGF0YSA9ICZhdDI0X2RhdGFfMjRjczY0IH0sCj4g
KyAgICAgICB7IC5jb21wYXRpYmxlID0gImF0bWVsLDI0YzEyOCIsICAgICAgICAgLmRhdGEgPSAm
YXQyNF9kYXRhXzI0YzEyOCB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJhdG1lbCwyNGMy
NTYiLCAgICAgICAgIC5kYXRhID0gJmF0MjRfZGF0YV8yNGMyNTYgfSwKPiArICAgICAgIHsgLmNv
bXBhdGlibGUgPSAiYXRtZWwsMjRjNTEyIiwgICAgICAgICAuZGF0YSA9ICZhdDI0X2RhdGFfMjRj
NTEyIH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gImF0bWVsLDI0YzEwMjQiLCAgICAgICAg
LmRhdGEgPSAmYXQyNF9kYXRhXzI0YzEwMjQgfSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAi
YXRtZWwsMjRjMTAyNSIsICAgICAgICAuZGF0YSA9ICZhdDI0X2RhdGFfMjRjMTAyNSB9LAo+ICsg
ICAgICAgeyAuY29tcGF0aWJsZSA9ICJhdG1lbCwyNGMyMDQ4IiwgICAgICAgIC5kYXRhID0gJmF0
MjRfZGF0YV8yNGMyMDQ4IH0sCj4gKyAgICAgICB7IC8qIEVORCBPRiBMSVNUICovIH0sCj4gK307
Cj4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGF0MjRfb2ZfbWF0Y2gpOwoKVGhpcyBpcyBvbmUg
b2YgZXhhbXBsZXM6IEkgaGF2ZSBhIHBhdGNoIHF1ZXVlZCBmb3IgdGhlIG52bWVtIHZlcnNpb24K
d2hlcmUgd2UgdXNlIG9mX21hdGNoX3B0cigpIGFuZCBhZGQgX19tYXliZV91bnVzZWQgdG8gdGhp
cyBzdHJ1Y3QuClRoZXJlJ3Mgbm8gcmVhc29uIHJlYWxseSB0byBoYXZlIHRoYXQgc3RydWN0IGR1
cGxpY2F0ZWQuCgpbc25pcF0KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBi
L2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+IGluZGV4IDZkODNlNzJhMjRkMi4uMWE4NTBiMTk1MTVk
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L210ZGNvcmUuYwo+IEBAIC0xNDgsNiArMTQ4LDkgQEAgc3RhdGljIHNzaXplX3QgbXRkX3R5cGVf
c2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gICAgICAgICBjYXNlIE1URF9ST006Cj4gICAgICAg
ICAgICAgICAgIHR5cGUgPSAicm9tIjsKPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAg
ICBjYXNlIE1URF9FRVBST006Cj4gKyAgICAgICAgICAgICAgIHR5cGUgPSAiZWVwcm9tIjsKPiAr
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIE1URF9OT1JGTEFTSDoKPiAgICAg
ICAgICAgICAgICAgdHlwZSA9ICJub3IiOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS91YXBpL210ZC9tdGQtYWJpLmggYi9pbmNsdWRlL3VhcGkvbXRkL210
ZC1hYmkuaAo+IGluZGV4IDcxNGQ1NWI0OWQyYS4uNTliZjQzZDU4ZGRiIDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvdWFwaS9tdGQvbXRkLWFiaS5oCj4gKysrIGIvaW5jbHVkZS91YXBpL210ZC9tdGQt
YWJpLmgKPiBAQCAtMTQ2LDYgKzE0Niw3IEBAIHN0cnVjdCBtdGRfcmVhZF9yZXEgewo+ICAjZGVm
aW5lIE1URF9EQVRBRkxBU0ggICAgICAgICAgNgo+ICAjZGVmaW5lIE1URF9VQklWT0xVTUUgICAg
ICAgICAgNwo+ICAjZGVmaW5lIE1URF9NTENOQU5ERkxBU0ggICAgICAgOCAgICAgICAvKiBNTEMg
TkFORCAoaW5jbHVkaW5nIFRMQykgKi8KPiArI2RlZmluZSBNVERfRUVQUk9NICAgICAgICAgICAg
IDkKPgo+ICAjZGVmaW5lIE1URF9XUklURUFCTEUgICAgICAgICAgMHg0MDAgICAvKiBEZXZpY2Ug
aXMgd3JpdGVhYmxlICovCj4gICNkZWZpbmUgTVREX0JJVF9XUklURUFCTEUgICAgICAweDgwMCAg
IC8qIFNpbmdsZSBiaXRzIGNhbiBiZSBmbGlwcGVkICovCj4gQEAgLTE1OSw2ICsxNjAsNyBAQCBz
dHJ1Y3QgbXRkX3JlYWRfcmVxIHsKPiAgI2RlZmluZSBNVERfQ0FQX05PUkZMQVNIICAgICAgIChN
VERfV1JJVEVBQkxFIHwgTVREX0JJVF9XUklURUFCTEUpCj4gICNkZWZpbmUgTVREX0NBUF9OQU5E
RkxBU0ggICAgICAoTVREX1dSSVRFQUJMRSkKPiAgI2RlZmluZSBNVERfQ0FQX05WUkFNICAgICAg
ICAgIChNVERfV1JJVEVBQkxFIHwgTVREX0JJVF9XUklURUFCTEUgfCBNVERfTk9fRVJBU0UpCj4g
KyNkZWZpbmUgTVREX0NBUF9FRVBST00gICAgICAgICAoTVREX1dSSVRFQUJMRSB8IE1URF9CSVRf
V1JJVEVBQkxFIHwgTVREX05PX0VSQVNFKQo+Cj4gIC8qIE9ic29sZXRlIEVDQyBieXRlIHBsYWNl
bWVudCBtb2RlcyAodXNlZCB3aXRoIG9ic29sZXRlIE1FTUdFVE9PQlNFTCkgKi8KPiAgI2RlZmlu
ZSBNVERfTkFOREVDQ19PRkYgICAgICAgICAgICAgICAgMCAgICAgICAvKiBTd2l0Y2ggb2ZmIEVD
QyAoTm90IHJlY29tbWVuZGVkKSAqLwo+IC0tCj4gMi4zOS4yCj4KClRoZSBpbmZyYXN0cnVjdHVy
ZSBmb3Igc3VwcG9ydGluZyBFRVBST00gc2hvdWxkIGJlIHNlbnQgYXMgYSBzZXBhcmF0ZSBwYXRj
aCBJTU8uCgpCYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
