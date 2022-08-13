Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750C7C19F2D
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Aug 2022 22:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G4UQzws3DI3JA5U5SEFGh9TvWMU4Uti/C0MUSlXBVDo=; b=2EZT6Z4rEU4ydz
	Jqzg2dsVXt25mlaEc1Uxg//+RLdK93IISFrVSsj7hTVdoIC6/sOCka+LVWSHlJvnpp2M3o6jviqn1
	OF/SOV6+6PcDYROUg2zWKA+2WchJRmmFrVgtu6/mOporbHyY4p6RVJlFt56A7iF5bH+2DBkxsB/+A
	ruWFCIGyhJ+zxiizUc1jmBfim2JL9GyqtRG0nn3AlHYo+I0OxT0dUBU4XunZPEK9yqXPMogPRfwc5
	bxydwBG6PtJd4YCAtAupAXn/MJb6FswWnewE5QEB+D/7kGugxtoDf+5wS/oXF9pvGvXGU0cmhrrkd
	1rmosEwpR2QlWpXP/JsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMzBv-000TYW-Vv; Sat, 13 Aug 2022 22:01:12 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMzBY-000TIE-MQ; Sat, 13 Aug 2022 22:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660428048; x=1691964048;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J2stkkYmPik2bQMds1PPTKQFWYY4K6w3/+pjsawBn4I=;
  b=bgxIXp/xs6uqFfuM6aAWeTAoUIo1/VNWQ6sXhCQ1i4dMlgfFeE9h0qQB
   5zs/rFahDROxg4W15UVWXO0hHmUrz8kHLF9CDRMc6hcafEqXJq1FyK+8m
   p+dXT1NlM83o/3eDKqDGK9MZ+6RLlClAGL2FNEJanAXecp4YmHZ0lC83Q
   QMs+bC97GQslZQouN58C80Ugw1tJEpcbNL42y/xHFOiE00cDvffvMJ2HZ
   VYTRsIPbu+aKBA1HtjsBeIKsJ/jgtdwj4JScBynUXhl2ycUHdS1VMUaZO
   Wg8VYDh3IwNX281LAoscoFBcV5GJCtyKch5RXH5u/h+mQIAv1UZj8e6tl
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="291778709"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="291778709"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 15:00:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="635047705"
Received: from tsaiyinl-mobl1.amr.corp.intel.com (HELO localhost) ([10.209.125.19])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 15:00:40 -0700
From: ira.weiny@intel.com
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>
Cc: Ira Weiny <ira.weiny@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-xtensa@linux-xtensa.org,
	keyrings@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net,
	dri-devel@lists.freedesktop.org,
	dm-devel@redhat.com,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-fsdevel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net,
	iommu@lists.linux.dev,
	bpf@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH] checkpatch: Add kmap and kmap_atomic to the deprecated list
Date: Sat, 13 Aug 2022 15:00:34 -0700
Message-Id: <20220813220034.806698-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220813_150048_831036_70734D68 
X-CRM114-Status: GOOD (  12.91  )
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

RnJvbTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgoKa21hcCgpIGFuZCBrbWFwX2F0
b21pYygpIGFyZSBiZWluZyBkZXByZWNhdGVkIGluIGZhdm9yIG9mCmttYXBfbG9jYWxfcGFnZSgp
LgoKVGhlcmUgYXJlIHR3byBtYWluIHByb2JsZW1zIHdpdGgga21hcCgpOiAoMSkgSXQgY29tZXMg
d2l0aCBhbiBvdmVyaGVhZAphcyBtYXBwaW5nIHNwYWNlIGlzIHJlc3RyaWN0ZWQgYW5kIHByb3Rl
Y3RlZCBieSBhIGdsb2JhbCBsb2NrIGZvcgpzeW5jaHJvbml6YXRpb24gYW5kICgyKSBpdCBhbHNv
IHJlcXVpcmVzIGdsb2JhbCBUTEIgaW52YWxpZGF0aW9uIHdoZW4KdGhlIGttYXDigJlzIHBvb2wg
d3JhcHMgYW5kIGl0IG1pZ2h0IGJsb2NrIHdoZW4gdGhlIG1hcHBpbmcgc3BhY2UgaXMgZnVsbHkK
dXRpbGl6ZWQgdW50aWwgYSBzbG90IGJlY29tZXMgYXZhaWxhYmxlLgoKa21hcF9sb2NhbF9wYWdl
KCkgaXMgc2FmZSBmcm9tIGFueSBjb250ZXh0IGFuZCBpcyB0aGVyZWZvcmUgcmVkdW5kYW50Cndp
dGgga21hcF9hdG9taWMoKSB3aXRoIHRoZSBleGNlcHRpb24gb2YgYW55IHBhZ2VmYXVsdCBvciBw
cmVlbXB0aW9uCmRpc2FibGUgcmVxdWlyZW1lbnRzLiAgSG93ZXZlciwgdXNpbmcga21hcF9hdG9t
aWMoKSBmb3IgdGhlc2Ugc2lkZQplZmZlY3RzIG1ha2VzIHRoZSBjb2RlIGxlc3MgY2xlYXIuICBT
byBhbnkgcmVxdWlyZW1lbnQgZm9yIHBhZ2VmYXVsdCBvcgpwcmVlbXB0aW9uIGRpc2FibGUgc2hv
dWxkIGJlIG1hZGUgZXhwbGljaXRseS4KCldpdGgga21hcF9sb2NhbF9wYWdlKCkgdGhlIG1hcHBp
bmdzIGFyZSBwZXIgdGhyZWFkLCBDUFUgbG9jYWwsIGNhbiB0YWtlCnBhZ2UgZmF1bHRzLCBhbmQg
Y2FuIGJlIGNhbGxlZCBmcm9tIGFueSBjb250ZXh0IChpbmNsdWRpbmcgaW50ZXJydXB0cykuCkl0
IGlzIGZhc3RlciB0aGFuIGttYXAoKSBpbiBrZXJuZWxzIHdpdGggSElHSE1FTSBlbmFibGVkLiBG
dXJ0aGVybW9yZSwKdGhlIHRhc2tzIGNhbiBiZSBwcmVlbXB0ZWQgYW5kLCB3aGVuIHRoZXkgYXJl
IHNjaGVkdWxlZCB0byBydW4gYWdhaW4sCnRoZSBrZXJuZWwgdmlydHVhbCBhZGRyZXNzZXMgYXJl
IHJlc3RvcmVkLgoKU3VnZ2VzdGVkLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25p
eC5kZT4KU3VnZ2VzdGVkLWJ5OiBGYWJpbyBNLiBEZSBGcmFuY2VzY28gPGZtZGVmcmFuY2VzY29A
Z21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+
CgotLS0KU3VnZ2VzdGVkIGJ5IGNyZWRpdHMuCglUaG9tYXM6IElkZWEgdG8ga2VlcCBmcm9tIGdy
b3dpbmcgbW9yZSBrbWFwL2ttYXBfYXRvbWljIGNhbGxzLgoJRmFiaW86IFN0b2xlIHNvbWUgb2Yg
aGlzIGJvaWxlciBwbGF0ZSBjb21taXQgbWVzc2FnZS4KCk5vdGVzIG9uIHRyZWUtd2lkZSBjb252
ZXJzaW9uczoKCkkndmUgY2MnZWQgbWFpbGluZyBsaXN0cyBmb3Igc3Vic3lzdGVtcyB3aGljaCBj
dXJyZW50bHkgY29udGFpbnMgZWl0aGVyIGttYXAoKQpvciBrbWFwX2F0b21pYygpIGNhbGxzLiAg
QXMgc29tZSBvZiB5b3UgYWxyZWFkeSBrbm93IEZhYmlvIGFuZCBJIGhhdmUgYmVlbgp3b3JraW5n
IHRocm91Z2ggY29udmVydGluZyBrbWFwKCkgY2FsbHMgdG8ga21hcF9sb2NhbF9wYWdlKCkuICBC
dXQgdGhlcmUgaXMgYQpsb3QgbW9yZSB3b3JrIHRvIGJlIGRvbmUuICBIZWxwIGZyb20gdGhlIGNv
bW11bml0eSBpcyBhbHdheXMgd2VsY29tZSwKZXNwZWNpYWxseSB3aXRoIGttYXBfYXRvbWljKCkg
Y29udmVyc2lvbnMuICBUbyBrZWVwIGZyb20gc3RlcHBpbmcgb24gZWFjaApvdGhlcnMgdG9lcyBJ
J3ZlIGNyZWF0ZWQgYSBzcHJlYWRzaGVldCBvZiB0aGUgY3VycmVudCBjYWxsc1sxXS4gIFBsZWFz
ZSBsZXQgbWUKb3IgRmFiaW8ga25vdyBpZiB5b3UgcGxhbiBvbiB0YWNraW5nIG9uZSBvZiB0aGUg
Y29udmVyc2lvbnMgc28gd2UgY2FuIG1hcmsgaXQKb2ZmIHRoZSBsaXN0LgoKWzFdIGh0dHBzOi8v
ZG9jcy5nb29nbGUuY29tL3NwcmVhZHNoZWV0cy9kLzFpX2NrWjEwcDkwYkhfQ2t4RDJiWU5pMDVT
MlF6ODRFMk9GUHY4enFfXzB3L2VkaXQjZ2lkPTE2Nzk3MTQzNTcKCi0tLQogc2NyaXB0cy9jaGVj
a3BhdGNoLnBsIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBiL3NjcmlwdHMvY2hlY2twYXRjaC5wbAppbmRl
eCA3OWU3NTlhYWM1NDMuLjlmZjIxOWUwYTlkNSAxMDA3NTUKLS0tIGEvc2NyaXB0cy9jaGVja3Bh
dGNoLnBsCisrKyBiL3NjcmlwdHMvY2hlY2twYXRjaC5wbApAQCAtODA3LDYgKzgwNyw4IEBAIG91
ciAlZGVwcmVjYXRlZF9hcGlzID0gKAogCSJyY3VfYmFycmllcl9zY2hlZCIJCQk9PiAicmN1X2Jh
cnJpZXIiLAogCSJnZXRfc3RhdGVfc3luY2hyb25pemVfc2NoZWQiCQk9PiAiZ2V0X3N0YXRlX3N5
bmNocm9uaXplX3JjdSIsCiAJImNvbmRfc3luY2hyb25pemVfc2NoZWQiCQk9PiAiY29uZF9zeW5j
aHJvbml6ZV9yY3UiLAorCSJrbWFwIgkJCQkJPT4gImttYXBfbG9jYWxfcGFnZSIsCisJImttYXBf
YXRvbWljIgkJCQk9PiAia21hcF9sb2NhbF9wYWdlIiwKICk7CiAKICNDcmVhdGUgYSBzZWFyY2gg
cGF0dGVybiBmb3IgYWxsIHRoZXNlIHN0cmluZ3MgdG8gc3BlZWQgdXAgYSBsb29wIGJlbG93Cgpi
YXNlLWNvbW1pdDogNGE5MzUwNTk3YWZmNTBiYmQwZjRiODBjY2Y0OWQyZTAyZDExMTFmNQotLSAK
Mi4zNS4zCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
