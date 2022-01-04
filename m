Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C2EC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 18:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LfO8TpJvHA4EcQhY0cnHl+oOqFd9HLoNjt0tYYLchsc=; b=m8Wz42EAoWp+uJtvrLFsRVHpfl
	12Wot1CvUEysiYH2ynsurNAs7TNc3xLTENz0HPrInnZF/6GERx0pjJVxAdtVDSOR6wUT/WxQ2J5IM
	aInX5tHXdv5U822maeLp2OrzJIbyFOEF6ZSeIQ/d25AKzv+/Pp9hXgiOeun0yOVLHtO0YT/bOlmi8
	ui2oY3ibcirehmXBjwBqPMyHLqDvmvUOKKAytxqf8z9/9tx0bNROnKjSMBwYBtu7+pKowYxQU0P40
	pOyTuxZ/jJUKizMy+pRmD7jtwAniICVnSZjJKPljjTkZiSsbg2CcZK8GMgjYbqIGsO4CS1OjD3565
	D/Qesexw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4o7P-00CR6X-36; Tue, 04 Jan 2022 18:01:07 +0000
Received: from out03.mta.xmission.com ([166.70.13.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4o7L-00CR5L-Uy
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 18:01:05 +0000
Received: from in01.mta.xmission.com ([166.70.13.51]:57206)
 by out03.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1n4o7C-00Fz0d-Et; Tue, 04 Jan 2022 11:00:55 -0700
Received: from ip68-110-24-146.om.om.cox.net ([68.110.24.146]:33276
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1n4o73-006IOp-EO; Tue, 04 Jan 2022 11:00:50 -0700
From: ebiederm@xmission.com (Eric W. Biederman)
To: Walt Drummond <walt@drummond.us>
Cc: aacraid@microsemi.com,  viro@zeniv.linux.org.uk,
 anna.schumaker@netapp.com,  arnd@arndb.de,  bsegall@google.com,
 bp@alien8.de,  chuck.lever@oracle.com,  bristot@redhat.com,
 dave.hansen@linux.intel.com,  dwmw2@infradead.org,
 dietmar.eggemann@arm.com,  dinguyen@kernel.org,  geert@linux-m68k.org,
 gregkh@linuxfoundation.org,  hpa@zytor.com,  idryomov@gmail.com,
 mingo@redhat.com,  yzaikin@google.com,  ink@jurassic.park.msu.ru,
 jejb@linux.ibm.com,  jmorris@namei.org,  bfields@fieldses.org,
 jlayton@kernel.org,  jirislaby@kernel.org,  john.johansen@canonical.com,
 juri.lelli@redhat.com,  keescook@chromium.org,  mcgrof@kernel.org,
 martin.petersen@oracle.com,  mattst88@gmail.com,  mgorman@suse.de,
 oleg@redhat.com,  pbonzini@redhat.com,  peterz@infradead.org,
 rth@twiddle.net,  richard@nod.at,  serge@hallyn.com,
 rostedt@goodmis.org,  tglx@linutronix.de,
 trond.myklebust@hammerspace.com,  vincent.guittot@linaro.org,
 x86@kernel.org,  linux-kernel@vger.kernel.org,
 ceph-devel@vger.kernel.org,  kvm@vger.kernel.org,
 linux-alpha@vger.kernel.org,  linux-arch@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,  linux-m68k@vger.kernel.org,
 linux-mtd@lists.infradead.org,  linux-nfs@vger.kernel.org,
 linux-scsi@vger.kernel.org,  linux-security-module@vger.kernel.org
References: <20220103181956.983342-1-walt@drummond.us>
Date: Tue, 04 Jan 2022 12:00:34 -0600
In-Reply-To: <20220103181956.983342-1-walt@drummond.us> (Walt Drummond's
 message of "Mon, 3 Jan 2022 10:19:48 -0800")
Message-ID: <87iluzidod.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1n4o73-006IOp-EO; ; ;
 mid=<87iluzidod.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.110.24.146; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1/0+Xd8qpWrAnE4XcvYwEAmBpc7eG84nVw=
X-SA-Exim-Connect-IP: 68.110.24.146
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [RFC PATCH 0/8] signals: Support more than 64 signals
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_100104_027847_F527B048 
X-CRM114-Status: GOOD (  19.87  )
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

V2FsdCBEcnVtbW9uZCA8d2FsdEBkcnVtbW9uZC51cz4gd3JpdGVzOgoKPiBUaGlzIHBhdGNoIHNl
dCBleHBhbmRzIHRoZSBudW1iZXIgb2Ygc2lnbmFscyBpbiBMaW51eCBiZXlvbmQgdGhlCj4gY3Vy
cmVudCBjYXAgb2YgNjQuICBJdCBzZXRzIGEgbmV3IGNhcCBhdCB0aGUgc29tZXdoYXQgYXJiaXRy
YXJ5IGxpbWl0Cj4gb2YgMTAyNCBzaWduYWxzLCBib3RoIGJlY2F1c2UgaXTigJlzIHdoYXQgR0xp
YmMgYW5kIE1VU0wgc3VwcG9ydCBhbmQKPiBiZWNhdXNlIG1hbnkgYXJjaGl0ZWN0dXJlcyBwYWQg
c2lnc2V0X3Qgb3IgdWNvbnRleHRfdCBpbiB0aGUga2VybmVsIHRvCj4gdGhpcyBjYXAuICBUaGlz
IGxpbWl0IGlzIG5vdCBmaXhlZCBhbmQgY2FuIGJlIGZ1cnRoZXIgZXhwYW5kZWQgd2l0aGluCj4g
cmVhc29uLgoKQWhoaGghIQoKUGxlYXNlIGxldCdzIG5vdCBleHBhbmQgdGhlIG51bWJlciBvZiBz
aWduYWxzIHN1cHBvcnRlZCBpZiB0aGVyZSBpcyBhbnkKYWx0ZXJuYXRpdmUuICBTaWduYWxzIG9u
bHkgcmVhbGx5IG1ha2Ugc2Vuc2UgZm9yIHN1cHBvcnRpbmcgZXhpc3RpbmcKaW50ZXJmYWNlcy4g
IEZvciBuZXcgYXBwbGljYXRpb25zIHRoZXJlIGlzIGFsbW9zdCBhbHdheXMgc29tZXRoaW5nCmJl
dHRlci4KCkluIHRoZSBsYXN0IGRpc2N1c3Npb24gb2YgYWRkaW5nIFNJR0lORk8KaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDYyNTE2MTE1My4yOTgxMS0xLWFyQGNzLm1zdS5ydS8g
dGhlCmFwcHJvYWNoIGV4YW1pbmVkIHdhcyB0byBmaXggU0lHUFdSIHRvIGJlIGlnbm9yZWQgYnkg
ZGVmYXVsdCBhbmQgdG8KZGVmaW5lIFNJR0lORk8gYXMgU0lHUFdSLgoKSSBkdWcgdGhyb3VnaCB0
aGUgcHJldmlvdXMgY29udmVyc2F0aW9ucyBhbmQgdGhlcmUgaXMgYSBsaXR0bGUgZGViYXRlCmFi
b3V0IHdoYXQgbWFrZXMgc2Vuc2UgZm9yIFNJR1BXUiB0byBkbyBieSBkZWZhdWx0LiAgQWxhbiBD
b3ggcmVtZW1iZXJlZApTSUdQV1Igd2FzIHNlbnQgd2hlbiB0aGUgcG93ZXIgd2FzIHJlc3RvcmVk
LCBzbyBpZ25vcmluZyBTSUdQV1IgYnkKZGVmYXVsdCBtYWRlIHNlbnNlLiAgVGVkIFRzbyBwb2lu
dGVkIG91dCBhIGRpZmZlcmVudCBzY2VuYXJpbyB3aGVyZSBpdAp3YXMgcmVhc29uYWJsZSBmb3Ig
U0lHUFdSIHRvIGJlIGEgdGVybWluYXRpbmcgc2lnbmFsLgoKU28gZmFyIG5vIG9uZSBoYXMgYWN0
dWFsbHkgZm91bmQgYW55IGFwcGxpY2F0aW9ucyB0aGF0IHdpbGwgcmVncmVzcyBpZgpTSUdQV1Ig
YmVjb21lcyBpZ25vcmVkIGJ5IGRlZmF1bHQuICBGdXJ0aGVybW9yZSBvbiBsaW51eCBTSUdQV1Ig
aXMgb25seQpkZWZpbmVkIHRvIGJlIHNlbnQgdG8gaW5pdCwgYW5kIGluaXQgaWdub3JlcyBhbGwg
c2lnbmFscyBieSBkZWZhdWx0IHNvCmluIHByYWN0aWNlIFNJR1BXUiBpcyBpZ25vcmVkIGJ5IHRo
ZSBvbmx5IHByb2Nlc3MgdGhhdCByZWNlaXZlcyBpdApjdXJyZW50bHkuCgpJIGFtIHBlcnN1YWRl
ZCBhdCBsZWFzdCBlbm91Z2ggdGhhdCBJIGNvdWxkIHNlZSBhZGRpbmcgYSBwYXRjaCB0bwpsaW51
eC1uZXh0IGFuZCB0aGVtIHNlbmRpbmcgdG8gTGludXMgdGhhdCBjb3VsZCBiZSByZXZlcnRlZCBp
ZiBhbnl0aGluZwpicm9rZS4KCldoZXJlIEkgc2F3IHRoZSBsYXN0IGNvbnZlcnNhdGlvbiBmYWx0
ZXIgd2FzIGluIG1ha2luZyBhIHBlcnN1YXNpdmUKY2FzZSBvZiB3aHkgU0lHSU5GTyB3YXMgaW50
ZXJlc3RpbmcgdG8gYWRkLiAgR2l2ZW4gYSB3b3JsZCBvZiBzc2gKY29ubmVjdGlvbnMgSSBleHBl
Y3QgYSBwZXJzdWFzaXZlIGNhc2UgY2FuIGJlIG1hZGUuICBFc3BlY2lhbGx5IGlmIHRoZXJlCmFy
ZSBhIGhhbmRmdWwgb2YgdXRpbGl0aWVzIHdoZXJlIGl0IGlzIGFscmVhZHkgaW1wbGVtZW50ZWQg
dGhhdCBqdXN0Cm5lZWQgdG8gYmUgYnVpbHQgd2l0aCBTSUdJTkZPIGRlZmluZWQuCgo+ICAtIEFk
ZCBCU0QgU0lHSU5GTyAoYW5kIFZTVEFUVVMpIGFzIGEgdGVzdC4KCklmIHlvdXIgYWN0dWFsIHBv
aW50IGlzIG5vdCB0byBpbXBsZW1lbnQgU0lHSU5GTyBhbmQgeW91IHJlYWxseSBoYXZlCmFub3Ro
ZXIgdXNlIGNhc2UgZm9yIGV4cGFuZGluZyBzaWdzZXRfdCBwbGVhc2UgbWFrZSBpdCBjbGVhci4K
CldpdGhvdXQgc2VlaW5nIHRoZSBwZXJzdWFzaXZlIGNhc2UgZm9yIG1vcmUgc2lnbmFscyBJIGhh
dmUgdG8gc2F5IHRoYXQKYWRkaW5nIG1vcmUgc2lnbmFscyB0byB0aGUga2VybmVsIHNvdW5kcyBs
aWtlIGEgYmFkIGlkZWEuCgpFcmljCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
