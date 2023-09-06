Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63156EB8FA5
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 10:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghJE7Zfb3lMciL8Vl2dkLh5KNz+Nn8gT0C2VLKx2z/c=; b=elJvUrwxoVuN7N
	V7XiVwemGNWAyT0MnFRQg+HkvR8jPgCR7XqhWlHfPGgV00vLuT6H24AYWna6IYe0JoIrYoEJDqFp0
	tOHXjQgAc+Aq+3RaQaSX5vdOXkDo1jmQZa5F8npMtQI0ztZ8kAKrQkwBpNaf3tidAxMT3x+yiqAQs
	klRExUrx9T57H0OJXxfxVkBLysYbE4EmNq8k9W+xVZsncyCRfqvx68o2vGQ6e60EEJmaKvq2X5RCs
	OKwBHcUEHRqZnOic7QZASwDYE6wifdFsFyOp1zh/gM9IzYL1cOhMQ9ipvXgKFn0spKKF9/vkwyzoO
	4iktDI+0elQDWSjIpiAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdq2g-008Ha8-2t;
	Wed, 06 Sep 2023 10:45:50 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdo49-007lBH-0p
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 08:39:15 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-402be83929eso33274125e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 06 Sep 2023 01:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693989550; x=1694594350; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxF9a0nuPd31DZXq2ybf318AAEvSPhpZeghrqW9FdpA=;
        b=KRU1YNF7DcYenWjaHsWnvlGX1bL2m9tS/B4oRoI8byha9u0vEknISLQcP/qjffpHxX
         fQnHV9Tg7ZCQfjmoFfa00nl2sdnfxcyTZH4lBUiQIM6z4AAZcXXKPNAxfLmkAIPQCByi
         qFS7JR4rIo39V560Jp0jm46m/8AHbTXaowymll9dHqutm22Pz9hzyEfyqRbj4ug9Lz5L
         lWPn82theTYMdEmcAmCIfhYcydobZvuXn5eZk4TKRQOFtfOCt3SzCmdfMsJjAdQ87VLn
         iucMSyHaspFkGhEVtMiWTY8zzrSCTkfgLQOGC3zQQwg2a4dQIEKkpNeGxvq2cpsf73NY
         yaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693989550; x=1694594350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxF9a0nuPd31DZXq2ybf318AAEvSPhpZeghrqW9FdpA=;
        b=DGxIFTtvx3QIhHsfr2+oPk7/LCYIOWPaS4Ip1+LKGCDsNlh0IVydaytADyGDmadR6n
         3d/e5b62i+Dvzv4qKz+Chj94oK4YboX/vd7Z2i/8tqxZKSWL1O1ETM/b4GGYIwNAb3J9
         FZCpbshn1vnhp2GVkKx5xXA1mXdcTsBa9X6lxoyUcZplopDqH8Tsj90KGpg/59CNvXXW
         9X2pUnTsOzCnVceazhNdzmMNI5jP8hMDxtnny01nq9xfvZrHQo3xjVb+QUk9x9jmqNrJ
         kuYUEzndqjHDONp0mtX8DlATixnLsHzLPcsLqPTcuT3QUXBPvF+EOfhX0Gp29J57Dzm6
         dQ7w==
X-Gm-Message-State: AOJu0YyYXLAmY/ILzSumSug9N7S8GcIMaHC0fUo9tGPxIu93+l+Ud38L
	U/3XuE2+gqXApQT3CINk08xKqgLrHWDWJgy6Wc8=
X-Google-Smtp-Source: AGHT+IGDX690Ab49IwuYJfb8nI9XuHAInISJDo7jsad0+A6JS6JKzTipSJ2rvZ+goBWNtQw8TDF0OX8l1jtFY6KKi7k=
X-Received: by 2002:a5d:6448:0:b0:31c:6697:6947 with SMTP id
 d8-20020a5d6448000000b0031c66976947mr1580162wrw.69.1693989549490; Wed, 06 Sep
 2023 01:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAM===sRg0v6_1xDjv7BxRFLMQTsj3z8-C_uO5Jh3ZDdWk_mEsA@mail.gmail.com>
 <dd4b7c09-64cf-4041-4dad-cd3d43340f98@huawei.com> <52ba4755-ade0-4b4a-f4a2-13160bb6129b@huawei.com>
 <CAM===sQ+-2A=R_Rn4iiLyaVsBh0Y1Dp8QDeT2fevEiWCfLtmnw@mail.gmail.com>
 <212e499d-324a-d553-2a2c-35bec47195db@huawei.com> <CAM===sSTKnmRdRx-LwJ50G4P4Er8+gfQ0vznEYOsqi63_UFaQQ@mail.gmail.com>
 <c9dea479-91d3-659c-28ba-39299b27b174@huawei.com>
In-Reply-To: <c9dea479-91d3-659c-28ba-39299b27b174@huawei.com>
From: Leon Pollak <leon.pollak@gmail.com>
Date: Wed, 6 Sep 2023 11:38:58 +0300
Message-ID: <CAM===sRtnHxuWG__FW_KZZG0iF0ZpYs4N+wtM9XuGKTUX2scHg@mail.gmail.com>
Subject: Re: Can't find correct configuration
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_013913_442756_9E24EB9B 
X-CRM114-Status: GOOD (  30.32  )
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

WWVzLCB5b3UgYXJlIHJpZ2h0IGFib3V0IHRoZSBzaXR1YXRpb24uCk15IHBhcnRpdGlvbiBmb3Ig
VUJJIGlzIDI0OE1pQi4KU28sIHRoZSBxdWVzdGlvbiByZW1haW5zIC0gY2FuIHRoaXMgOE1CIGJl
IHV0aWxpemVkPwpPciBhcmUgdGhleSBhbHJlYWR5IGluIHVzZSBieSBVQkkgd2hpY2ggc2VlcyBw
YXJ0aXRpb24gc2l6ZT8KCgpPbiBXZWQsIDYgU2VwdCAyMDIzIGF0IDEwOjM0LCBaaGloYW8gQ2hl
bmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiB3cm90ZToKPgo+IOWcqCAyMDIzLzkvNiAxNToy
NywgTGVvbiBQb2xsYWsg5YaZ6YGTOgo+ID4gSSB3b3JrIG9uIGVtYmVkZGVkIGRldmljZS4gVGhl
IHJlc3Qgb2YgdGhlIE5BTkQgaXMgdXNlZCBmb3IgU1BMLAo+ID4gVS1Cb290LCBVLUJvb3QgZW52
aXJvbm1lbnQgYW5kIGtlcm5lbC4KPiA+IFdoYXQgaXMgbGVmdCBpcyAyNDhNaUIuCj4gPiBJIGFt
IG5vdCBzdXJlIEkgY2FuIHVzZSB0aGUgd2hvbGUgc3BhY2UgZm9yIFVCSSAtIGhvdyB3aWxsIHRo
ZSBTUEwvVS1Cb290IHdvcms/Cj4KPiBEbyB5b3UgbWVhbiBVQkkgYW5kIHVib290IGFyZSBwdXQg
aW50byBzYW1lIGZsYXNoKDI1Nk0pPyBJZiBzbywgeW91cgo+IHBhcnRpdGlvbmluZyBtZXRob2Qg
aXMgcmlnaHQuCj4KPiA4TShtdGQwKSAtIHVib290Cj4gMjQ4TShtdGQxKSAtIFVCSQo+Cj4gVUJJ
IHdvbid0IGFjY2VzcyBtdGQwLgo+Cj4KPiA+Cj4gPiBPbiBXZWQsIDYgU2VwdCAyMDIzIGF0IDEw
OjIxLCBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiB3cm90ZToKPiA+Pgo+
ID4+IOWcqCAyMDIzLzkvNiAxNDo1NywgTGVvbiBQb2xsYWsg5YaZ6YGTOgo+ID4+PiBUaG91c2Fu
ZHMgb2YgdGhhbmtzLCBaaGloYW8gQ2hlbmchISEKPiA+Pj4gSXQgd29ya2VkIGV4YWN0bHkgYXMg
eW91IHdyb3RlLgo+ID4+PiBUaGUgb25seSBxdWVzdGlvbiByZW1haW5lZCBpczoKPiA+Pj4gTXkg
cGFydGl0aW9uIHNpemUgaXMgMjQ4TWlCLgo+ID4+PiBJIHRob3VnaHQgdGhhdCBsZWF2aW5nIDhN
aUIgInNwYXJlJyB3aWxsIGJlIHVzZWQganVzdCBmb3IgdGhlc2UKPiA+Pj4gcmVzZXJ2ZWQgUEVC
cywgYnV0IG5vdyBJIHVuZGVyc3RhbmQgdGhpcyB3YXMgaW5jb3JyZWN0Lgo+ID4+PiBTbywgbWF5
IEkgdXRpbGl6ZSB0aGVzZSA4TWlCIGJhY2sgb3Igd2lsbCB0aGV5IHN0aWxsIGJlIHVzZWQgYnkg
VUJJCj4gPj4+IGZvciBzb21ldGhpbmc/Cj4gPj4+Cj4gPj4KPiA+PiBJIGJlbGlldmUgeW91IGhh
dmUgdHdvIG10ZCBkZXZpY2VzLCAyNDhNKG10ZDAgZm9yIHViaSkgYW5kIDhNKHJlc2VydmVkLAo+
ID4+IHdvbid0IGJlIGFjY2Vzc2VkIGJ5IFVCSSkgbm93LiBQbGVhc2UgZG9uJ3Qgc3BsaXQgdGhl
IDI1Nk0gaW50byB0d28gbXRkCj4gPj4gZGV2aWNlcyBpZiB5b3Ugb25seSBuZWVkIDEgVUJJIGRl
dmljZSwganVzdCBmb3JtYXQgdGhlIHdob2xlIGZsYXNoKDI1Nk0pCj4gPj4gaW50byBVQkksIGFu
ZCBVQkkgaXRzZWxmIHdpbGwgaGFuZGxlIGl0cyByZXNlcnZhdGlvbiB3aXRob3V0IHVzZXIKPiA+
PiBpbnRlcnZlbmluZy4KPiA+Pgo+ID4+PiBPbiBXZWQsIDYgU2VwdCAyMDIzIGF0IDA1OjUwLCBa
aGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiB3cm90ZToKPiA+Pj4+Cj4gPj4+
PiDlnKggMjAyMy85LzYgMTA6NDIsIFpoaWhhbyBDaGVuZyDlhpnpgZM6Cj4gPj4+Pj4g5ZyoIDIw
MjMvOS81IDIyOjQ1LCBMZW9uIFBvbGxhayDlhpnpgZM6Cj4gPj4+Pj4gSGkKPiA+Pj4+Pj4gSGVs
bG8sIGFsbC4KPiA+Pj4+Pj4gSSB3aWxsIGJlIHZlcnkgdmVyeSB0aGFua2Z1bCBmb3IgdGhlIGhl
bHAgdG8gZmluZCB0aGUgY29ycmVjdAo+ID4+Pj4+PiBjb25maWd1cmF0aW9uIGZvciBteSBOQU5E
Lgo+ID4+Pj4+PiBJIHBhc3NlZCB0aHJvdWdoIGEgbG90IG9mIG1haWxzIGluIHRoZSBsaXN0cyBh
bmQgZ29vZ2xlIGFuZCBDaGF0R1BUIC0KPiA+Pj4+Pj4gbm8gc3VjY2Vzcy4KPiA+Pj4+Pj4gSSBo
YXZlIDI1Nk1CIE5BTkQgYW5kIDI0OE1CIHBhcnRpdGlvbiBmb3IgVUJJRlMuIEkgcnVuOgo+ID4+
Pj4+PiBta2ZzLnViaWZzIC12IC1yIHJvb3RmcyAtRiAtbSAyMDQ4IC1lIDEyNjk3NiAtYyAxOTgx
IC1vIC4vdWJpZnMuaW1nCj4gPj4+Pj4+IHViaW5pemUgLXYgLW8gcm9vdGZzLmltZyAtbSAyMDQ4
IC1wIDEyOEtpQiAtcyA1MTIgLU8gMjA0OCB1YmluaXplLmNmZwo+ID4+Pj4+PiAtLS0tLQo+ID4+
Pj4+PiBhbmQgdWJpbml6ZS5jZmcgbG9va3MgbGlrZToKPiA+Pj4+Pj4gW3ViaWZzXQo+ID4+Pj4+
PiBtb2RlPXViaQo+ID4+Pj4+PiBpbWFnZT0uL3ViaWZzLmltZwo+ID4+Pj4+PiB2b2xfaWQ9MAo+
ID4+Pj4+PiB2b2xfc2l6ZT0yNDBNaUIKPiA+Pj4+Pj4gdm9sX3R5cGU9ZHluYW1pYwo+ID4+Pj4+
PiB2b2xfbmFtZT11Ymlfcm9vdGZzCj4gPj4+Pj4+IHZvbF9hbGlnbm1lbnQ9MQo+ID4+Pj4+PiB2
b2xfZmxhZ3M9YXV0b3Jlc2l6ZQo+ID4+Pj4+PiAtLS0tLS0KPiA+Pj4+Pj4gS2VybmVsIGNvbmZp
Z3VyYXRpb24gIHdhcyB3aXRoIENPTkZJR19NVERfVUJJX0JFQl9MSU1JVD0yMC4KPiA+Pj4+Pj4g
YW5kIGhlcmUgaXMgdGhlIGtlcm5lbCBsb2c6Cj4gPj4+Pj4+IFsgICAgMi42OTU2NTldIHViaTA6
IGF0dGFjaGluZyBtdGQ0Cj4gPj4+Pj4+IFsgICAgMy4zNzIzNDNdIHViaTA6IHNjYW5uaW5nIGlz
IGZpbmlzaGVkCj4gPj4+Pj4+IFsgICAgMy4zODMwNjZdIHViaTAgd2FybmluZzogdWJpX2ViYV9p
bml0OiBjYW5ub3QgcmVzZXJ2ZSBlbm91Z2ggUEVCcwo+ID4+Pj4+PiBmb3IgYmFkIFBFQiBoYW5k
bGluZywgcmVzZXJ2ZWQgNCwgbmVlZCA0MAo+ID4+Pj4+PiBbICAgIDMuNDA0MzIwXSB1YmkwOiB2
b2x1bWUgMCAoInViaV9yb290ZnMiKSByZS1zaXplZCBmcm9tIDE5ODIgdG8KPiA+Pj4+Pj4gMTk4
MiBMRUJzCj4gPj4+Pj4+IFsgICAgMy40MTE2NjddIHViaTA6IGF0dGFjaGVkIG10ZDQgKG5hbWUg
IkZTIiwgc2l6ZSAyNDggTWlCKQo+ID4+Pj4+PiBbICAgIDMuNDE3MDk1XSB1YmkwOiBQRUIgc2l6
ZTogMTMxMDcyIGJ5dGVzICgxMjggS2lCKSwgTEVCIHNpemU6Cj4gPj4+Pj4+IDEyNjk3NiBieXRl
cwo+ID4+Pj4+PiBbICAgIDMuNDI0MDA2XSB1YmkwOiBtaW4uL21heC4gSS9PIHVuaXQgc2l6ZXM6
IDIwNDgvMjA0OCwgc3ViLXBhZ2UKPiA+Pj4+Pj4gc2l6ZSA1MTIKPiA+Pj4+Pj4gWyAgICAzLjQz
MDc0MF0gdWJpMDogVklEIGhlYWRlciBvZmZzZXQ6IDIwNDggKGFsaWduZWQgMjA0OCksIGRhdGEK
PiA+Pj4+Pj4gb2Zmc2V0OiA0MDk2Cj4gPj4+Pj4+IFsgICAgMy40Mzc3MzRdIHViaTA6IGdvb2Qg
UEVCczogMTk5MCwgYmFkIFBFQnM6IDAsIGNvcnJ1cHRlZCBQRUJzOiAwCj4gPj4+Pj4+IFsgICAg
My40NDM4NjBdIHViaTA6IHVzZXIgdm9sdW1lOiAxLCBpbnRlcm5hbCB2b2x1bWVzOiAxLCBtYXgu
IHZvbHVtZXMKPiA+Pj4+Pj4gY291bnQ6IDEyOAo+ID4+Pj4+PiBbICAgIDMuNDUxMTE3XSB1Ymkw
OiBtYXgvbWVhbiBlcmFzZSBjb3VudGVyOiAxLzAsIFdMIHRocmVzaG9sZDogNDA5NiwKPiA+Pj4+
Pj4gaW1hZ2Ugc2VxdWVuY2UgbnVtYmVyOiAxNTkwNTcwMDczCj4gPj4+Pj4+IFsgICAgMy40NjAy
OTVdIHViaTA6IGF2YWlsYWJsZSBQRUJzOiAwLCB0b3RhbCByZXNlcnZlZCBQRUJzOiAxOTkwLAo+
ID4+Pj4+PiBQRUJzIHJlc2VydmVkIGZvciBiYWQgUEVCIGhhbmRsaW5nOiA0Cj4gPj4+Pj4+IFsg
ICAgMy40Njk1NzVdIHViaTA6IGJhY2tncm91bmQgdGhyZWFkICJ1YmlfYmd0MGQiIHN0YXJ0ZWQs
IFBJRCAxMzEKPiA+Pj4+Pj4gWyAgICA0LjY0ODcxOF0gVUJJRlMgKHViaTA6MCk6IGJhY2tncm91
bmQgdGhyZWFkICJ1Ymlmc19iZ3QwXzAiCj4gPj4+Pj4+IHN0YXJ0ZWQsIFBJRCAxMzYKPiA+Pj4+
Pj4gWyAgICA0LjY3NjY0MF0gVUJJRlMgKHViaTA6MCk6IHN0YXJ0IGZpeGluZyB1cCBmcmVlIHNw
YWNlCj4gPj4+Pj4+IFsgICAxMC4yNTAwOTldIFVCSUZTICh1YmkwOjApOiBmcmVlIHNwYWNlIGZp
eHVwIGNvbXBsZXRlCj4gPj4+Pj4+IFsgICAxMC4yNjkwNDZdIFVCSUZTICh1YmkwOjApOiBVQklG
UzogbW91bnRlZCBVQkkgZGV2aWNlIDAsIHZvbHVtZSAwLAo+ID4+Pj4+PiBuYW1lICJ1Ymlfcm9v
dGZzIgo+ID4+Pj4+PiBbICAgMTAuMjc2ODMwXSBVQklGUyAodWJpMDowKTogTEVCIHNpemU6IDEy
Njk3NiBieXRlcyAoMTI0IEtpQiksCj4gPj4+Pj4+IG1pbi4vbWF4LiBJL08gdW5pdCBzaXplczog
MjA0OCBieXRlcy8yMDQ4IGJ5dGVzCj4gPj4+Pj4+IFsgICAxMC4yODY3OTRdIFVCSUZTICh1Ymkw
OjApOiBGUyBzaXplOiAyNTAxNDI3MjAgYnl0ZXMgKDIzOCBNaUIsIDE5NzAKPiA+Pj4+Pj4gTEVC
cyksIGpvdXJuYWwgc2l6ZSA5MDIzNDg4IGJ5dGVzICg4IE1pQiwgNzIgTEVCcykKPiA+Pj4+Pj4g
WyAgIDEwLjI5NzU0MF0gVUJJRlMgKHViaTA6MCk6IHJlc2VydmVkIGZvciByb290OiAwIGJ5dGVz
ICgwIEtpQikKPiA+Pj4+Pj4gWyAgIDEwLjMwMzQwNl0gVUJJRlMgKHViaTA6MCk6IG1lZGlhIGZv
cm1hdDogdzQvcjAgKGxhdGVzdCBpcyB3NS9yMCksCj4gPj4+Pj4+IFVVSUQgQTE0RDU4NkEtMzJF
Mi00NUQ3LUEwN0UtQkRDNDcyRkRGMzFELCBzbWFsbCBMUFQgbW9kZWwKPiA+Pj4+Pj4KPiA+Pj4+
Pj4gTXkgcXVlc3Rpb24gaXM6IHdoeSBkb2VzIHRoaXMgd2FybmluZyBhYm91dCByZXNlcnZlZCA0
LCBuZWVkZWQgNDAKPiA+Pj4+Pj4gYXBwZWFyPyBIb3cgY2FuIEkgc29sdmUgdGhpcz8KPiA+Pj4+
Pj4KPiA+Pj4+Pgo+ID4+Pj4+IFNvbHV0aW9uOiBNb2RpZnkgdWJpbml6ZS5jZmcsICB2b2xfc2l6
ZT0yNDBNaUIgLT4gdm9sX3NpemU9MjM1TWlCCj4gPj4+Pj4KPiA+Pj4+PiBXaHkgZG9lcyB0aGlz
IHdhcm5pbmcgYWJvdXQgcmVzZXJ2ZWQgNCwgbmVlZGVkIDQwIGFwcGVhcj8KPiA+Pj4+PiBUaGUg
Y291bnQgb2YgYmFkIFBFQnMgcmVzZXJ2ZWQgYnkgVUJJIGlzOiB0b3RhbF9wZWJzKG5hbmQgY2hp
cCkgKgo+ID4+Pj4+IENPTkZJR19NVERfVUJJX0JFQl9MSU1JVC8xMDI0ID0gMjA0OCAqICAyMCAv
IDEwMjQgPSA0MAo+ID4+Pj4+IFdoZW4gZmFzdG1hcCBpcyBub3QgZW5hYmxlZCwgdGhlIGNvdW50
IG9mIGludGVybmFsIFBFQnMgcmVzZXJ2ZWQgYnkgVUJJCj4gPj4+Pj4gaXM6IFVCSV9MQVlPVVRf
Vk9MVU1FX0VCU1syXSArIFdMX1JFU0VSVkVEX1BFQlNbMV0gKwo+ID4+Pj4+IEVCQV9SRVNFUlZF
RF9QRUJTWzFdID0gNAo+ID4+Pj4+Cj4gPj4+Pj4gVG90YWwgUEVCcyBmb3IgVUJJIGlzIDE5OTAo
Z29vZCBQRUJzOiAxOTkwKSwgdGhlIG1heCBjb3VudCBvZiB1c2VyCj4gPj4+Pj4gdm9sdW1lIFBF
QnMgaXMgMTk5MCAtIDQwIC0gNCA9IDE5NDYKPiA+Pj4+Pgo+ID4+Pj4+IEluIHViaW5pemUuY2Zn
LCB2b2xfc2l6ZT0yNDBNaUIsIHRoZSBjb3VudCBvZiB1c2VyIHZvbHVtZSBQRUJzIGlzKHNlZQo+
ID4+Pj4+IHViaW5pemUuYyBpbiBtdGR1aXRscyk6IHZpX3NpemUgKyAobGViX3NpemUgLSAxKSAv
IGxlYl9zaXplCj4gPj4+Pj4gdmlfc2l6ZSA9IDI0ME0gPSAyNDAgKiAxMDI0ICogMTAyNAo+ID4+
Pj4+IGxlYl9zaXplID0gMTI4SyAtIDJLKGVjKSAtIDJLKHZpZCkgPSAxMjQgKiAxMDI0Cj4gPj4+
Pj4gcmVzdWx0ID0gMTk4Mgo+ID4+Pj4+Cj4gPj4+Pj4gU28gdGhlcmUgYXJlIDE5OTAgLSAxOTgy
IC0gNCA9IDQgUEVCcyByZXNlcnZlZCBmb3IgYmFkIFBFQiBoYW5kbGluZywKPiA+Pj4+PiB3aGlj
aCBpcyBsZXNzIHRoYW4gNDAuCj4gPj4+Pj4KPiA+Pj4+PiBXaGVuIHdlIHNldCAgdm9sX3NpemU9
MjM1TWlCLCB0aGUgY291bnQgb2YgdXNlciB2b2x1bWUgUEVCcyBpczogKDIzNSAqCj4gPj4+Pj4g
MTAyNCAqIDEwMjQgKyAxMjQgKiAxMDI0IC0gMSkgLyAoMTI0ICogMTAyNCkgPSAxOTQxCj4gPj4+
Pj4gMTk5MCAtIDQgLSA0MCA9IDE5NDYsIGZpbmFsbHkgbWF5YmUgdGhlcmUgaXMgbWVzc2FnZSBm
cm9tIGtlcm5lbCBsaWtlCj4gPj4+Pj4gIigidWJpX3Jvb3RmcyIpIHJlLXNpemVkIGZyb20gMTk0
MSB0byAxOTQ2IExFQnMiLgo+ID4+Pj4KPiA+Pj4+IEFjdXRhbGx5LCB0aGUgJ3ZvbF9zaXplJyBp
biB1YmluaXplLmNmZyBtZWFucyB0aGUgc2l6ZSBvZiBkYXRhIG9uCj4gPj4+PiB2b2x1bWUoZXhj
bHVkZSB2aWQvZWMpLCBub3QgdGhlIHNpemUgb2Ygdm9sdW1lKGluY2x1ZGUgdmlkL2VjKS4KPiA+
Pj4+Cj4gPj4+Cj4gPj4+IC4KPiA+Pj4KPiA+Pgo+ID4KPiA+IC4KPiA+Cj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
