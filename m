Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50007C04EBE
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 20:00:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8625C22267
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 20:00:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k5KzDdU8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8625C22267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oC5ynv9Sw7XXU1NKVuSB+SNbjtDZ/wKjybq1kZ+JTZ8=; b=k5KzDdU8tHU6s1rLdMrWPJGkN
	HjeeKICL13u4JAknZFTr4v9X8VJmlEt0w8RuztJF3k0oYwYNpDdGxU61Lvkiy8DJ4UPMdT8tRvHei
	+DO2BYooAJaY/J84ZpRdHd7UKgsWkCM9MPThiGjHqDv5mD5upKXFeVvfWDQZkoPn/0S2P4LWkLKRx
	yggi+rayuX/HF+dhYjAevVGaJq1UKp01U4SfG0/BTXdDgQjoKfYZtQ6mMWBwynzZA9swa/zecSoC9
	Fo0sATi1T2JSpJPCuYG91Vq6bWv3UgkrUpodLjTePDOI2eAyDwpySVKc7QNLrFxP6EskzkZbm80Sl
	XE3pm/Bhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQyXX-0004j8-Qa; Fri, 09 Oct 2020 19:58:56 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQySo-0001lx-GN; Fri, 09 Oct 2020 19:54:11 +0000
IronPort-SDR: MPcsiC75o2j3e3TC2EtaE39WlISHMnH3xapOdDQfa5oDyIA42RX8K1WqoizpEymyAzzu0K65gn
 vvoKP2fKZBgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="153363857"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="153363857"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:54 -0700
IronPort-SDR: bZn0Zma13YkX7FJFkNsCYMjMNff2FSiB/MgoUwYT50qMOfu0yRYfZtOtUYx1uwuwPtN+tdFX+r
 hwly4wq6Ikyg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="519847271"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:53:53 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC PKS/PMEM 53/58] lib: Utilize new kmap_thread()
Date: Fri,  9 Oct 2020 12:50:28 -0700
Message-Id: <20201009195033.3208459-54-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_155402_791371_47B98BBA 
X-CRM114-Status: GOOD (  14.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-aio@kvack.org, Song Liu <songliubraving@fb.com>,
 linux-efi@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-rdma@vger.kernel.org, x86@kernel.org,
 John Fastabend <john.fastabend@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-afs@lists.infradead.org, cluster-devel@redhat.com,
 linux-cachefs@redhat.com, intel-wired-lan@lists.osuosl.org,
 Yonghong Song <yhs@fb.com>, linux-ext4@vger.kernel.org,
 Andrii Nakryiko <andriin@fb.com>, Fenghua Yu <fenghua.yu@intel.com>,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, xen-devel@lists.xenproject.org,
 KP Singh <kpsingh@chromium.org>, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-bcache@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgoKVGhlc2Uga21hcCgpIGNhbGxz
IGFyZSBsb2NhbGl6ZWQgdG8gYSBzaW5nbGUgdGhyZWFkLiAgVG8gYXZvaWQgdGhlIG92ZXIKaGVh
ZCBvZiBnbG9iYWwgUEtSUyB1cGRhdGVzIHVzZSB0aGUgbmV3IGttYXBfdGhyZWFkKCkgY2FsbC4K
CkNjOiBBbGV4YW5kZXIgVmlybyA8dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+CkNjOiAiSsOpcsO0
bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogTWFydGluIEthRmFpIExhdSA8a2Fm
YWlAZmIuY29tPgpDYzogU29uZyBMaXUgPHNvbmdsaXVicmF2aW5nQGZiLmNvbT4KQ2M6IFlvbmdo
b25nIFNvbmcgPHloc0BmYi5jb20+CkNjOiBBbmRyaWkgTmFrcnlpa28gPGFuZHJpaW5AZmIuY29t
PgpDYzogSm9obiBGYXN0YWJlbmQgPGpvaG4uZmFzdGFiZW5kQGdtYWlsLmNvbT4KQ2M6IEtQIFNp
bmdoIDxrcHNpbmdoQGNocm9taXVtLm9yZz4KU2lnbmVkLW9mZi1ieTogSXJhIFdlaW55IDxpcmEu
d2VpbnlAaW50ZWwuY29tPgotLS0KIGxpYi9pb3ZfaXRlci5jIHwgMTIgKysrKysrLS0tLS0tCiBs
aWIvdGVzdF9icGYuYyB8ICA0ICsrLS0KIGxpYi90ZXN0X2htbS5jIHwgIDggKysrKy0tLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvbGliL2lvdl9pdGVyLmMgYi9saWIvaW92X2l0ZXIuYwppbmRleCA1ZTQwNzg2YzhmMTIu
LjFkNDdmOTU3Y2Y5NSAxMDA2NDQKLS0tIGEvbGliL2lvdl9pdGVyLmMKKysrIGIvbGliL2lvdl9p
dGVyLmMKQEAgLTIwOCw3ICsyMDgsNyBAQCBzdGF0aWMgc2l6ZV90IGNvcHlfcGFnZV90b19pdGVy
X2lvdmVjKHN0cnVjdCBwYWdlICpwYWdlLCBzaXplX3Qgb2Zmc2V0LCBzaXplX3QgYgogCX0KIAkv
KiBUb28gYmFkIC0gcmV2ZXJ0IHRvIG5vbi1hdG9taWMga21hcCAqLwogCi0Ja2FkZHIgPSBrbWFw
KHBhZ2UpOworCWthZGRyID0ga21hcF90aHJlYWQocGFnZSk7CiAJZnJvbSA9IGthZGRyICsgb2Zm
c2V0OwogCWxlZnQgPSBjb3B5b3V0KGJ1ZiwgZnJvbSwgY29weSk7CiAJY29weSAtPSBsZWZ0OwpA
QCAtMjI1LDcgKzIyNSw3IEBAIHN0YXRpYyBzaXplX3QgY29weV9wYWdlX3RvX2l0ZXJfaW92ZWMo
c3RydWN0IHBhZ2UgKnBhZ2UsIHNpemVfdCBvZmZzZXQsIHNpemVfdCBiCiAJCWZyb20gKz0gY29w
eTsKIAkJYnl0ZXMgLT0gY29weTsKIAl9Ci0Ja3VubWFwKHBhZ2UpOworCWt1bm1hcF90aHJlYWQo
cGFnZSk7CiAKIGRvbmU6CiAJaWYgKHNraXAgPT0gaW92LT5pb3ZfbGVuKSB7CkBAIC0yOTIsNyAr
MjkyLDcgQEAgc3RhdGljIHNpemVfdCBjb3B5X3BhZ2VfZnJvbV9pdGVyX2lvdmVjKHN0cnVjdCBw
YWdlICpwYWdlLCBzaXplX3Qgb2Zmc2V0LCBzaXplX3QKIAl9CiAJLyogVG9vIGJhZCAtIHJldmVy
dCB0byBub24tYXRvbWljIGttYXAgKi8KIAotCWthZGRyID0ga21hcChwYWdlKTsKKwlrYWRkciA9
IGttYXBfdGhyZWFkKHBhZ2UpOwogCXRvID0ga2FkZHIgKyBvZmZzZXQ7CiAJbGVmdCA9IGNvcHlp
bih0bywgYnVmLCBjb3B5KTsKIAljb3B5IC09IGxlZnQ7CkBAIC0zMDksNyArMzA5LDcgQEAgc3Rh
dGljIHNpemVfdCBjb3B5X3BhZ2VfZnJvbV9pdGVyX2lvdmVjKHN0cnVjdCBwYWdlICpwYWdlLCBz
aXplX3Qgb2Zmc2V0LCBzaXplX3QKIAkJdG8gKz0gY29weTsKIAkJYnl0ZXMgLT0gY29weTsKIAl9
Ci0Ja3VubWFwKHBhZ2UpOworCWt1bm1hcF90aHJlYWQocGFnZSk7CiAKIGRvbmU6CiAJaWYgKHNr
aXAgPT0gaW92LT5pb3ZfbGVuKSB7CkBAIC0xNzQyLDEwICsxNzQyLDEwIEBAIGludCBpb3ZfaXRl
cl9mb3JfZWFjaF9yYW5nZShzdHJ1Y3QgaW92X2l0ZXIgKmksIHNpemVfdCBieXRlcywKIAkJcmV0
dXJuIDA7CiAKIAlpdGVyYXRlX2FsbF9raW5kcyhpLCBieXRlcywgdiwgLUVJTlZBTCwgKHsKLQkJ
dy5pb3ZfYmFzZSA9IGttYXAodi5idl9wYWdlKSArIHYuYnZfb2Zmc2V0OworCQl3Lmlvdl9iYXNl
ID0ga21hcF90aHJlYWQodi5idl9wYWdlKSArIHYuYnZfb2Zmc2V0OwogCQl3Lmlvdl9sZW4gPSB2
LmJ2X2xlbjsKIAkJZXJyID0gZigmdywgY29udGV4dCk7Ci0JCWt1bm1hcCh2LmJ2X3BhZ2UpOwor
CQlrdW5tYXBfdGhyZWFkKHYuYnZfcGFnZSk7CiAJCWVycjt9KSwgKHsKIAkJdyA9IHY7CiAJCWVy
ciA9IGYoJncsIGNvbnRleHQpO30pCmRpZmYgLS1naXQgYS9saWIvdGVzdF9icGYuYyBiL2xpYi90
ZXN0X2JwZi5jCmluZGV4IGNhN2Q2MzViY2NkOS4uNDQxZjgyMmY1NmJhIDEwMDY0NAotLS0gYS9s
aWIvdGVzdF9icGYuYworKysgYi9saWIvdGVzdF9icGYuYwpAQCAtNjUwNiwxMSArNjUwNiwxMSBA
QCBzdGF0aWMgdm9pZCAqZ2VuZXJhdGVfdGVzdF9kYXRhKHN0cnVjdCBicGZfdGVzdCAqdGVzdCwg
aW50IHN1YikKIAkJaWYgKCFwYWdlKQogCQkJZ290byBlcnJfa2ZyZWVfc2tiOwogCi0JCXB0ciA9
IGttYXAocGFnZSk7CisJCXB0ciA9IGttYXBfdGhyZWFkKHBhZ2UpOwogCQlpZiAoIXB0cikKIAkJ
CWdvdG8gZXJyX2ZyZWVfcGFnZTsKIAkJbWVtY3B5KHB0ciwgdGVzdC0+ZnJhZ19kYXRhLCBNQVhf
REFUQSk7Ci0JCWt1bm1hcChwYWdlKTsKKwkJa3VubWFwX3RocmVhZChwYWdlKTsKIAkJc2tiX2Fk
ZF9yeF9mcmFnKHNrYiwgMCwgcGFnZSwgMCwgTUFYX0RBVEEsIE1BWF9EQVRBKTsKIAl9CiAKZGlm
ZiAtLWdpdCBhL2xpYi90ZXN0X2htbS5jIGIvbGliL3Rlc3RfaG1tLmMKaW5kZXggZTdkYzNkZTM1
NWI3Li5lNDBkMjZmOTdmNDUgMTAwNjQ0Ci0tLSBhL2xpYi90ZXN0X2htbS5jCisrKyBiL2xpYi90
ZXN0X2htbS5jCkBAIC0zMjksOSArMzI5LDkgQEAgc3RhdGljIGludCBkbWlycm9yX2RvX3JlYWQo
c3RydWN0IGRtaXJyb3IgKmRtaXJyb3IsIHVuc2lnbmVkIGxvbmcgc3RhcnQsCiAJCWlmICghcGFn
ZSkKIAkJCXJldHVybiAtRU5PRU5UOwogCi0JCXRtcCA9IGttYXAocGFnZSk7CisJCXRtcCA9IGtt
YXBfdGhyZWFkKHBhZ2UpOwogCQltZW1jcHkocHRyLCB0bXAsIFBBR0VfU0laRSk7Ci0JCWt1bm1h
cChwYWdlKTsKKwkJa3VubWFwX3RocmVhZChwYWdlKTsKIAogCQlwdHIgKz0gUEFHRV9TSVpFOwog
CQlib3VuY2UtPmNwYWdlcysrOwpAQCAtMzk4LDkgKzM5OCw5IEBAIHN0YXRpYyBpbnQgZG1pcnJv
cl9kb193cml0ZShzdHJ1Y3QgZG1pcnJvciAqZG1pcnJvciwgdW5zaWduZWQgbG9uZyBzdGFydCwK
IAkJaWYgKCFwYWdlIHx8IHhhX3BvaW50ZXJfdGFnKGVudHJ5KSAhPSBEUFRfWEFfVEFHX1dSSVRF
KQogCQkJcmV0dXJuIC1FTk9FTlQ7CiAKLQkJdG1wID0ga21hcChwYWdlKTsKKwkJdG1wID0ga21h
cF90aHJlYWQocGFnZSk7CiAJCW1lbWNweSh0bXAsIHB0ciwgUEFHRV9TSVpFKTsKLQkJa3VubWFw
KHBhZ2UpOworCQlrdW5tYXBfdGhyZWFkKHBhZ2UpOwogCiAJCXB0ciArPSBQQUdFX1NJWkU7CiAJ
CWJvdW5jZS0+Y3BhZ2VzKys7Ci0tIAoyLjI4LjAucmMwLjEyLmdiNmE2NThiZDAwYzkKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
