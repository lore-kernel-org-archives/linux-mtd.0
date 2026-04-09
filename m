Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3129FEA3C55
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Apr 2026 11:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bPq19sblKpfNX6ZDf2/idqQP5p3Am1GWyxZ4a0tfubg=; b=x6qYy6S9D3IcOx
	3cVeEYE0nHp54IOQ9YFYFSy5NT9XXCabepruf5FpkqJJco0HO4hMkoG8//ufbTHEZOg0XmxHrcbOU
	Zzplqi4ZkHQN19aa/Rm5ESeEum1tYcC+qCP17eEUhhPFL0kHYKznw/Yw52uQm427MxEUpkOm6F0Op
	ITCDGSDKp59ENoTRHahWBDNG0MVHZxtRN2JzgZ58xIQ76F9K6qCV6Ii0udUT8Jr/cvUeLa1/8Y0Zg
	NuT3a4Rrb4xePjjljkrhvo8e0vQdJbI4bdMHo3O+ZgtQeZdms7pR6ul6teUUkhX2bvA/NhTydBgbA
	/Ssb0nZVYCr3TGIN+aVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnZ7-0000000AGvl-2NyD;
	Thu, 09 Apr 2026 11:28:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnZ5-0000000AGvQ-3KtN
	for linux-mtd@lists.infradead.org;
	Thu, 09 Apr 2026 11:28:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so11251955e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 09 Apr 2026 04:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775734130; x=1776338930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2BUFDAL9oSVMfLEfPisTlW9oC5QFI4D3xBlET5WyxE=;
        b=rqKDFCdLDkNtslbwM9zuEFOe/uVna5+YbnDwC9uEDwXYEEy0zcwj0dyzR4uuj/SD3r
         5LabgvYD29DbQkSgmn00546Wwa/ieHfr50wmQ5ao4fRQ5yKHdtOavtwstq7I2C6wwJ/c
         kOULvvfOvlYmxFFTJWP6LMR4/6xz2bT/reLv/uVYv6TgTQdH5JPoaYESS1KTxBVZcpsy
         xA1kXhA72aiJrt+et0cw3+Zyo9H6bZYXEKBFWs1pT14rmZHjbUu6946EVbZf4BymqHW9
         PrQhKL32Uhr8evAWFaM8akh0/XDggU77rAszUswveZ87UstlwAbhGDGN3OCrSbJutIMg
         abrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775734130; x=1776338930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D2BUFDAL9oSVMfLEfPisTlW9oC5QFI4D3xBlET5WyxE=;
        b=mHTg+MwBGj0am8SgfIapxQgrP77WipFI8Kj61OPekkUBeg7auGrWU/aeackOKSPuSP
         p0n96tE1v5GBQYWtOE0ogIygXvdEDhIbC2TyVhBPyE19e9sTcYdUQ7M9QqzE3MNT8VdA
         JWVmAltdQHhIDg2TiE9Gy/xSPu/ko41DLAE7kUMSVy56pyXt7FOjuVIFb5Sf3rfrAVDw
         vEXUUmh75KBs5O1LTkTFD5AnL8JJmsPYIbiUq/g9s8Mmwlbr+8Jrvx3SqF976WJcYUtx
         jDDJnKLorUKTcxhI1PzFoQ0IDCPQj6pFWKTvb95+Osh7Q8PVX0kSK82BTaeywhl0NxA3
         b14Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaV7p0uKQu5bjVPKlmpSdGBeu0pIHxk7ybDFa7crm9fHdSmXoYOWTfYQXuBsbWQJA5OpDxqPXSSoQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNLQ3FFAW5qCp2s62gzgp7kcSmVmP41WEfYesRz9bVW7dexUgB
	funhL4hB0ntTkCLyOPFfRDQyZLm0CXVCQ0A3pAWn31wAevBdZJE0UkEp
X-Gm-Gg: AeBDievKhtzoIx6ZEX8tsxsl0f+9mBiaQoxnyRvloQchzY7FkmYGYjUFVHO/oa2IbGv
	QzcXgNTqnBVt88cI9sZsRMLnHElzN+c5d0/OD4/ylaSt/7uuJ0pNiahueSk/ghysRglWVXK46yI
	9xmLUw2qX2zggxVvUdQfwNJS+g5A3cp/2XghnAF9vDx46+gUg2JKBdUMgrEwFtOp0cQCVmWXEYG
	DWTjx3cYF61xxGxkReSKQNv6KoPRxK/BQAqzwdPCwdWH9jWUCnEayqniWotnx3AaYbxMEU3Ty8v
	8HFKN5/Rq5EOAEAwAYVC6EUT1V8uemNMPFzepPzfxmzpDDCul8Ih1GoGmEYTLVu6n2E9IMpK0km
	7yV3q4Lis0DXP/rewF3L2v9OtM6Ox0WcbkcA3GIaqM4OFndufn+vO5Hf4BwdSSJVFmCc1GnjA63
	iLWbZ4sS2OBUdRC3VI6e4+xR0D8mSVXsKqrtMqmxs/0x88iWtDE3lsr90XlH/G/jFu
X-Received: by 2002:a05:600c:4188:b0:488:a2ac:a34c with SMTP id 5b1f17b1804b1-488a2aca466mr158005365e9.12.1775734129648;
        Thu, 09 Apr 2026 04:28:49 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd1a028esm21313545e9.35.2026.04.09.04.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:28:49 -0700 (PDT)
Date: Thu, 9 Apr 2026 12:28:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <20260409122846.7d08d2b4@pumpkin>
In-Reply-To: <addcJP2erqYh8pD2@wunner.de>
References: <20260408211407.2295175-1-andriy.shevchenko@linux.intel.com>
	<20260409082611.73fac9ab@pumpkin>
	<addcJP2erqYh8pD2@wunner.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_042851_897838_EF56BD34 
X-CRM114-Status: GOOD (  26.31  )
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

T24gVGh1LCA5IEFwciAyMDI2IDA5OjU4OjI4ICswMjAwCkx1a2FzIFd1bm5lciA8bHVrYXNAd3Vu
bmVyLmRlPiB3cm90ZToKCj4gT24gVGh1LCBBcHIgMDksIDIwMjYgYXQgMDg6MjY6MTFBTSArMDEw
MCwgRGF2aWQgTGFpZ2h0IHdyb3RlOgo+ID4gT24gV2VkLCAgOCBBcHIgMjAyNiAyMzoxMTo0OCAr
MDIwMCBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4g
d3JvdGU6ICAKPiA+ID4gQ29tcGlsZXIgaXMgbm90IGhhcHB5IGFib3V0IHVzZWQgc3RhY2sgZnJh
bWU6Cj4gPiA+IAo+ID4gPiBkcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDEuYzogSW4g
ZnVuY3Rpb24gJ2RvX3dyaXRlX2J1ZmZlcic6Cj4gPiA+IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9j
bWRzZXRfMDAwMS5jOjE4ODc6MTogZXJyb3I6IHRoZSBmcmFtZSBzaXplIG9mIDEyOTYgYnl0ZXMg
aXMgbGFyZ2VyIHRoYW4gMTI4MCBieXRlcyBbLVdlcnJvcj1mcmFtZS1sYXJnZXItdGhhbj1dCj4g
PiA+IAo+ID4gPiBGaXggdGhpcyBieSBmYWN0b3Jpbmcgb3V0IGRvX3dyaXRlX2J1ZmZlcl9sb2Nr
ZWQoKS4gIAo+ID4gCj4gPiBEb2VzIHRoaXMganVzdCBzcGxpdCB0aGUgbGFyZ2Ugc3RhY2sgZnJh
bWUgYmV0d2VlbiB0d28gbmVzdGVkIGZ1bmN0aW9ucz8KPiA+IEknZCBhbHNvIGV4cGVjdCB0aGUg
Y29tcGlsZXIgdG8gaW5saW5lIGRvX3dyaXRlX2J1ZmZlcl9sb2NrZWQoKSBzbyBpdAo+ID4gbWFr
ZXMgbGl0dGxlIGRpZmZlcmVuY2UuCj4gPiBPVE9IIEkgY2FuJ3QgaW1tZWRpYXRlbHkgc2VlIHdo
ZXJlIHRoZSBsYXJnZSBzdGFjayBmcmFtZSBjb21lcyBmcm9tLiAgCj4gCj4gVGhlIGVycm9yIG9j
Y3VycyBmb3IgYW4gYWxsbW9kY29uZmlnIGJ1aWxkIG9uIGFybSwgd2hpY2ggaW1wbGllcwo+IENP
TkZJR19LQVNBTl9TVEFDSz15IGFuZCB0aHVzIGluY3JlYXNlcyBzdGFjayB1c2FnZSB2aXMtw6At
dmlzIGEKPiAicmVndWxhciIgYnVpbGQuCj4gCj4gU3RhY2sgdXNhZ2UgaXMgaGlnaCBoZXJlIGJl
Y2F1c2Ugb2YgdGhlIHRocmVlICJtYXBfd29yZCIgdHlwZXMsCj4gd2hpY2ggY2FuIGVhY2ggYmUg
dXAgdG8gMjU2IHVuc2lnbmVkIGxvbmdzICgzMiAqIDgpLCBzZWUgdGhlCj4gZGVmaW5pdGlvbnMg
b2YgTUFYX01BUF9MT05HUywgTUFYX01BUF9CQU5LV0lEVEgsIG1hcF93b3JkIGluCj4gaW5jbHVk
ZS9saW51eC9tdGQvbWFwLmguCgpVZ2cgLSB0aGF0IGNvZGUgaXMgaG9ycmlkLgpSZXR1cm5pbmcg
c3RydWN0dXJlcyBieSB2YWx1ZSBpc24ndCByZWFsbHkgYSBnb29kIGlkZWEuCgo+IAo+IFBvc3Np
YmxlIHNvbHV0aW9uczoKPiAKPiAtIERpc2FibGUgS0FTQU4gZW50aXJlbHkgZm9yIHRoaXMgZmls
ZToKPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hZFgzU0hZZ2F6aWphaGJHQHd1bm5l
ci5kZS8KPiAKPiAgIE5vdCBhbHdheXMgYSBnb29kIG9wdGlvbiwgcGFydGljdWxhcmx5IGZvciBz
dHVmZiBsaWtlIGxpYi9tYXBsZV90cmVlLmMKPiAgIHdoZXJlIHRoZSBzYW1lIGlzc3VlIGV4aXN0
cyBpbiBtYXNfd3Jfc3Bhbm5pbmdfc3RvcmUoKSBhbmQgS0FTQU4gd291bGQKPiAgIGNlcnRhaW5s
eSBiZSBnb29kIHRvIGhhdmUgZm9yIHRoYXQgb25lLgoKSSd2ZSBwZWVrZWQgYXQgdGhhdCBhdCBs
ZWFzdCBvbmNlLgpTb21lIGJpZyBmdW5jdGlvbnMgZ2V0IGlubGluZWQ7IElJUkMgb25lIHNtYWxs
IGZ1bmN0aW9uIGlzIGJhc2ljYWxseToKCWlmIChleHByKSBhKGFyZ3MpIGVsc2UgYihhcmdzKTsK
YW5kIG1hcmtpbmcgYm90aCBhIGFuZCBiIG5vaW5saW5lIHdvdWxkIGhlbHAgYSBsb3QuCgo+IAo+
IC0gVXNlIGhlYXAgaW5zdGVhZCBvZiBzdGFjay4KPiAKPiAtIFNwbGl0IGZ1bmN0aW9uIGluIHNt
YWxsZXIgY2h1bmtzIGFuZCBtYXJrIHRoZW0gIm5vaW5saW5lIi4KClRoYXQgbWlnaHQgbWFrZSB0
aGUgY29kZSBlYXNpZXIgdG8gcmVhZCBhcyB3ZWxsLgoKQnV0IGxvb2tpbmcgYXQgaXQsIEkgdGhp
bmsgdGhhdCBhIHNtYWxsIGFtb3VudCBvZiByZWZhY3RvcmluZwoobW9zdGx5IG1vdmluZyB0aGUg
aW5pdGlhbCAnc3RhdHVzJyBjaGVjayBiZWZvcmUgdGhlIGNvbW1hbmQKaXMgd3JpdHRlbikgd291
bGQgbWVhbiB0aGF0IG9ubHkgb25lICdtYXBfd29yZCcgd291bGQgYmUgdmFsaWQKYXQgYW55IG9u
ZSB0aW1lLgoKSSBkaWRuJ3QgbG9vayBhdCB3aGF0IHdhcyByZWFsbHkgaGFwcGVuaW5nIHRob3Vn
aC4KSSBzdXNwZWN0IGl0IGlzIHNpbWlsYXIgdG8gc29tZSBjb2RlIEkndmUgd3JpdHRlbiBmb3Ig
YWNjZXNzaW5nIHNlcmlhbApFRVBST00gd2hlcmUgdGhlIGNvbnRyb2wgZGF0YSBpcyB3cml0dGVu
IG9uZSBiaXQgYXQgYSB0aW1lLCBidXQgdGhlCmRhdGEgaXRzZWxmIGlzIHJlYWQvd3JpdHRlbiBp
biA0IGJpdCBjaHVua3MgKGFsdGhvdWdoIHRoZSBsb3ctbGV2ZWwgaGFyZHdhcmUKZGlkIG11bHRp
cGxlICduaWJibGUnIGFjY2Vzc2VzIGZvciB3aWRlciB0cmFuc2ZlcnMpLgpJbiBhbnkgY2FzZSBp
dCBzdXJlbHkgY2FuJ3QgYmUgbmVjZXNzYXJ5IHRvIGhhdmUgYSAyNTYrIGJ5dGUgc3RydWN0dXJl
CnRvIGhvbGQgdGhlIDgtYml0IGNvbW1hbmQvc3RhdHVzIHZhbHVlcy4KKEluIG15IGNhc2UgdGhl
IDggYml0cyBnb3QgJ3NwcmVhZCcgYWNyb3NzIGEgMzJiaXQgd29yZCBhbmQgd3JpdHRlbgoodG8g
dGhlIGZncGEgLSBoZWxwZWQgYmVjYXVzZSBJIHdhcyB3cml0aW5nIHRoYXQgZW5kIGFzIHdlbGwp
IGFzIGEgc2luZ2xlIHdvcmQuKQoKCURhdmlkCgo+IAo+IFRoYW5rcywKPiAKPiBMdWthcwo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
