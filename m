Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D32C021B1
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Feb 2025 14:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bygaeScixs4Z/TEJXlavhkJstxPR/3BvDXlgxZ5PNgg=; b=v7+f3K6Nb1dpfd
	NqxTWR++5v7ajTCeZYFW1qKZkvMPa1ZC9cS7IUpE7aSGFieZylyDfut3tTIQzx2do9E9fS8JPUURa
	c/kkLKS8K8A1V/iDp0z7xXKhLK7Z5SFh1x8B7uEhFBSfzZGNmniqpsPZvGPASF2CFPTiDSUZccoWG
	KxSOvU+ew3aCcmowBV59RXf6RydQSXUU6dgFF0DfOZin+KxYOo+1Qt8F3jU+iNIdTXf4RaEBXh80L
	TKl9MqF6nb9Dllkgcpp9JSQl4tjnO2gASibWSlFOU6FMRBhSE3r4jKSQjNYAH6rSrndam1dVmAf/x
	u+zZX9v+N6NcMz8Vhu7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl81R-00000001RkD-2hFS;
	Thu, 20 Feb 2025 14:59:29 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl80d-00000001RV6-2Kv0
	for linux-mtd@lists.infradead.org;
	Thu, 20 Feb 2025 14:58:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A7534430B;
	Thu, 20 Feb 2025 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740063516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zecOynphgxT+qOIC8isrCC7iHpZKrBxbXOC6nGD/R6I=;
	b=cASbn3vu6Y34Cr0GKv8BB1HFj7hua+DrFvQCN3q4H0q/E0FWNZ4yvN11x+uSjR0RN4tFpK
	T4YQqwlAI4Wsj+8zFLSKBzWpg0F9tcHAIuiM3IK0lIShrHeXoNvcu8DWIOUleqdiPK/NHc
	7N5r8aTVh53QsqifsmD3XKkdzlCwo1B5H8moQdI28cWF6f/QTlSYFuHO+j/VOUQb1uvgGZ
	oXczk5yAjvf6HtnNqaEw03gnmIGY6ELlHb272rD7VoMCu/sQ2Qm6/jQdBeHrc19/xkQ+xD
	Htu+U317gywf50Yvi26hI/AvAQjWTG2C3/NGiFvhb9iP2KBgUMGWrvf5PUnk1A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,  MTD Mailing
 List <linux-mtd@lists.infradead.org>,  Buildroot Mailing List
 <buildroot@busybox.net>,  "Josh Boyer (Fedora)"
 <mtd-utils-maintainers@fedoraproject.org>,  "Bastian Germann (Debian)"
 <bage@debian.org>,  "(Rosa Linux)" <a.proklov@rosalinux.ru>,  Embedded
 Gentoo <embedded@gentoo.org>,  "Robin H. Johnson" <robbat2@gentoo.org>,
  "John (OpenWRT)" <john@phrozen.org>,  "Michael Tross (T2 SDE)"
 <michael@tross.org>,  "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
  "Orphaned (Void Linux)" <orphan@voidlinux.org>,  "Sergey Bolshakov (ALT
 Linux)" <sbolshakov@altlinux.org>,  "Silvan Calarco (openmamba)"
 <silvan.calarco@mambasoft.it>,  "Viric (nixpkgs)" <viric@viric.name>,
  "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,  "Levente Polyak
 (Arch)" <anthraxx@archlinux.org>, <shaba@altlinux.org>,  Richard Weinberger
 <richard@nod.at>
Subject: Re: [ANNOUNCE] mtd-utils-2.3.0 is released
In-Reply-To: <016049d9-c15e-ee5f-e69a-4e5a6d351613@huawei.com> (Zhihao Cheng's
	message of "Thu, 20 Feb 2025 22:04:51 +0800")
References: <1b7a55a6-1c5b-4e86-8006-e2010e54367e@sigma-star.at>
	<87zfigk9ai.fsf@bootlin.com>
	<016049d9-c15e-ee5f-e69a-4e5a6d351613@huawei.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 20 Feb 2025 15:58:36 +0100
Message-ID: <875xl4k6hv.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeijeegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeefudfhfedvkeehjeeuiedvvdetheelffejjeehgfehtdffuefffeekudeigeffnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegthhgvnhhgiihhihhhrghoudeshhhurgifvghirdgtohhmpdhrtghpthhtohepuggrvhhiugdrohgsvghrhhholhhlvghniigvrhesshhighhmrgdqshhtrghrrdgrthdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsghuihhlughrohhothessghushihs
 ghogidrnhgvthdprhgtphhtthhopehmthguqdhuthhilhhsqdhmrghinhhtrghinhgvrhhssehfvgguohhrrghprhhojhgvtghtrdhorhhgpdhrtghpthhtohepsggrghgvseguvggsihgrnhdrohhrghdprhgtphhtthhopegrrdhprhhokhhlohhvsehrohhsrghlihhnuhigrdhruhdprhgtphhtthhopegvmhgsvgguuggvugesghgvnhhtohhordhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_065840_072836_92C3DA68 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8gWmhpaGFvLAoKPj4gVGhlIGNvbW1pdHMgZnJvbSBaaGloYW8gYWN0dWFsbHkgbGlzdCB0
aGVzZSAuZ3ogZmlsZXMgaW4gdGhlIC5hbQo+PiBmaWxlcywKPj4gYW5kIHRoZXkgYWxzbyBhcHBl
YXIgaW4gdGhlIE1ha2VmaWxlLmluIGFzCj4+ICAgICAgQEJVSUxEX1RFU1RTX1RSVUVAYW1fX2Fw
cGVuZF8yMgo+PiB5ZXQgdGhleSBhcmUgbm90IHBhcnQgb2YgdGhlIGZpbmFsIGRpc3RyaWJ1dGVk
IHRhcmJhbGwuIEFueSBpZGVhIGhvdwo+PiB0bwo+PiBmaXggdGhhdCBwcm9wZXJseT8KPgo+IEhp
IE1pcXVlbCwgc29ycnkgZm9yIGludHJvZHVjaW5nIHRoZSBwcm9ibGVtLiBJdCBjb3VsZCBiZSBm
aXhlZCBieSB0aGlzCj4gcGF0Y2g6Cj4KPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvbGludXgtbXRkL3BhdGNoLzIwMjUwMjIwMTEyNTU0LjIxNTAwNDYtMS1tLm9sYnJpY2hA
cGVuZ3V0cm9uaXguZGUvCgpFeGNlbGxlbnQhIEhhcHB5IHRvIGtub3cgdGhlcmUgaXMgYSBmaXgg
YWxyZWFkeS4gVW5mb3J0dW5hdGVseSBpdCBmZWVscwpsaWtlIHRoZXJlIGlzIG5vdCBtdWNoIHdl
IGNhbiBkbyBkaXJlY3RseSBpbiBCUiwgc28gSSdsbCB3YWl0IGZvciB0aGUKZml4IHRvIGxhbmQg
aW4gYSAuMSBtaW5vciByZWxlYXNlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
