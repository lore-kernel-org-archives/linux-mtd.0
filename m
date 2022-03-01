Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E244C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 10:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeQ26p6N4zOj8XEmI3/hiPhoIBlD2uo9yXwec+/ayzA=; b=weI1uHr+d8KQt+
	JgVRDQ8ehQIPCRRkSav8AL3a/3MI2hNIr6+J7I/pjOhUCO7dyBxJut9CvYYufUzqLEOhk0V+db1dU
	hmC5Jr0e5RtYdQeAtszSkOX97nOZv0kwqSJK7sdudv4EMp6JEqDE4NXbYo7/Gl5dnUnXcnPrjgp3y
	1T32EW+LkgETqd8MsXkSozAuyBIuMop0Wu9Nbpm97PP3Oxgkq2xxfzdth+lvU3+Tu3tGeGmpeijVx
	As50LVLB65tJdNPwRiNYRMGes6cL7glQIh8rgkliGF4livMzejiKTQHk5oASR8xUzCGVpY/6pCa6n
	0xXxQGlcFdknZL27u7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOznu-00G8Xk-0H; Tue, 01 Mar 2022 10:32:26 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOznq-00G8Vg-C3
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2022 10:32:23 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 2FF4121637;
 Tue,  1 Mar 2022 10:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646130739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=La5buFbnjrPhn2o1sUWwzQOTEyfMerZi3ZYeAU8/Uv0=;
 b=ir6wKv7+9TEqXDAv3qmydQ5wBbusxZq25vcTSERRcfsYAthVuwyzGudcKtcu5nR7eD8N9w
 Xf1dhJfFABjK3gR6RVu2WwBtXG7aTJA9ivU3pX+9IyTxtrODSdDHmoGMphU/lnLO+kWTuX
 xskgcZyntzbQGHPrndLL+oVBRDjnBFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646130739;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=La5buFbnjrPhn2o1sUWwzQOTEyfMerZi3ZYeAU8/Uv0=;
 b=tKcMBac1PgJGoG8rsYC6c4tom0Ydqe9lf86KLgjfVmM5zQc0oUPxg2PqqyEdGUi7u05yLw
 yje4esCKuBhlKoAA==
Received: from quack3.suse.cz (unknown [10.100.224.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 19928A3B89;
 Tue,  1 Mar 2022 10:32:19 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 8B603A0608; Tue,  1 Mar 2022 11:32:18 +0100 (CET)
Date: Tue, 1 Mar 2022 11:32:18 +0100
From: Jan Kara <jack@suse.cz>
To: Richard Weinberger <richard@nod.at>
Cc: wuchi.zero@gmail.com,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, jack@suse.cz,
 tj@kernel.org, mszeredi@redhat.com, sedat.dilek@gmail.com,
 axboe@fb.com, akpm@linux-foundation.org,
 torvalds@linux-foundation.org, linux-mm <linux-mm@kvack.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Different writeback timing since v5.14
Message-ID: <20220301103218.ulbmakdy4gbw2fso@quack3.lan>
References: <2104629126.100059.1646129517209.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2104629126.100059.1646129517209.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_023222_608655_82469B5E 
X-CRM114-Status: GOOD (  16.04  )
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

SGkhCgpPbiBUdWUgMDEtMDMtMjIgMTE6MTE6NTcsIFJpY2hhcmQgV2VpbmJlcmdlciB3cm90ZToK
PiBSYWZhxYIgYW5kIEkgZGlzY292ZXJlZCB0aGF0IHBhZ2Ugd3JpdGViYWNrIG9uIFVCSUZTIGJl
aGF2ZXMgZGlmZmVyZW50IHNpbmNlIHY1LjE0Lgo+IFdoZW4gYSBzaW1wbGUgd3JpdGUsIHN1Y2gg
YXMgImVjaG8gZm9vID4gL21udC91YmliZnMvYmFyLnR4dCIsIGhhcHBlbnMgaXQgdGFrZXMKPiBh
IGZldyBzZWNvbmRzIHVudGlsIHdyaXRlYmFjayBjYWxscyB1Ymlmc193cml0ZXBhZ2UoKS4KPiAK
PiBCZWZvcmUgY29tbWl0IGFiMTk5MzlhNmE1MCAoIm1tL3BhZ2Utd3JpdGViYWNrOiBGaXggcGVy
Zm9ybWFuY2Ugd2hlbiBCREkncyBzaGFyZSBvZiByYXRpbyBpcyAwLiIpCj4gaXQgd2FzIDMwIHNl
Y29uZHMgKHZtLmRpcnR5X2V4cGlyZV9jZW50aXNlY3MpLCBhZnRlciB0aGlzIGNoYW5nZSBpdCBo
YXBwZW5zIGFmdGVyIDUgc2Vjb25kcwo+ICh2bS5kaXJ0eV93cml0ZWJhY2tfY2VudGlzZWNzKS4K
PiAKPiBJcyB0aGlzIGV4cGVjdGVkPwo+IEp1c3Qgd2FudCB0byBtYWtlIHN1cmUgdGhhdCB0aGUg
c2FpZCBjb21taXQgZGlkbid0IHVuY292ZXIgYW4gVUJJRlMgaXNzdWUuCgpZZXMsIEkgdGhpbmsg
aXQgaXMgZXhwZWN0ZWQuIExpa2VseSB0aGUgYmFja2dyb3VuZCB0aHJlc2hvbGQgZm9yIFVCSUZT
IGJkaQppcyB2ZXJ5IHNtYWxsIChwcm9iYWJseSBVQklGUyBpcyBub3QgdXNlZCBtdWNoIGZvciB3
cml0ZWJhY2sgY29tcGFyZWQgdG8Kb3RoZXIgZmlsZXN5c3RlbXMpLiBQcmV2aW91c2x5LCB3ZSBq
dXN0IHVzZWQgd2Jfc3RhdCgpIHdoaWNoIHJldHVybmVkIDAKKFBDUCBjb3VudGVyIGluZXhhY3Qg
dmFsdWUpIGFuZCBzbyBiYWNrZ3JvdW5kIHdyaXRlYmFjayBkaWRuJ3QgdHJpZ2dlci4gTm93Cndl
IHVzZSB3Yl9zdGF0X3N1bSgpIHdoZW4gdGhyZXNob2xkIGlzIHNtYWxsLCBnZXQgZXhhY3QgdmFs
dWUgb2YgZGlydHkKcGFnZXMgYW5kIGRlY2lkZSB0byBzdGFydCBiYWNrZ3JvdW5kIHdyaXRlYmFj
ay4KClRoZSBvbmx5IHRoaW5nIGlzLCB3aGV0aGVyIGl0IGlzIHJlYWxseSBleHBlY3RlZCB0aGF0
IHRoZSB0aHJlc2hvbGQgZm9yClVCSUZTIGJkaSBpcyBzbyBzbWFsbC4gWW91IGNhbiBjaGVjayB0
aGUgdmFsdWVzIGluCi9zeXMva2VybmVsL2RlYnVnL2JkaS88YmRpPi9zdGF0cy4KCgkJCQkJCQkJ
SG9uemEKLS0gCkphbiBLYXJhIDxqYWNrQHN1c2UuY29tPgpTVVNFIExhYnMsIENSCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
