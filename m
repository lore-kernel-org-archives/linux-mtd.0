Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4DDFF885A
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 10:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOO9u0gUdr5V2U+NhZcvpGMDRjTXpk7vHl4hrGeYWqA=; b=iSuPTEzZe+RXff
	VdHntzxBKbDWe3se3BnfD5cGy/wKGlHl4DBcLMJY9Hc367UKL7rvM5aptkBfTSs5fqVwuybm5GYPa
	GxA2QeJ4vTIMtmpJkFSeffkgPjKfcPOPZyI5vmszxiKBjGuG0Xj9mgMOl0jDlCRC2lQxWtQPLNWgI
	/3txC+pYWLgZVxmgEuwRvS9lTEUDls5cobiap1+6mOtwHY4fskfyenYt9Mw/6qRHMw4ysaCZdTpF1
	7sIKmbB2m9efpopPNwvgELl6bckhLOzGCV+nqgK3jU14ami5qQ4V61euRO0h8VESt1mjHFlI96I78
	WaUrV8TOXDSBbQ8aRfsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKD8u-0000000FuHy-2LPP;
	Tue, 05 May 2026 10:36:44 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKD8q-0000000FuGl-3dVw
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 10:36:41 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so4816096e87.2
        for <linux-mtd@lists.infradead.org>; Tue, 05 May 2026 03:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777977398; x=1778582198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYe0UsBMCaRl/SSTsNMvYXizf5N50Ge9yNyjOI2yeog=;
        b=I8/mx/z4Cjdnt7/uBs2Jmjn7sb9OEOL89aM9CNKXG/0pjASy1CoNHghEIfS42Txi/B
         UYKPdsGzxQh9182rtHtZfkAPMyOTLd2ZMTxfdC6uGs9GbtnhR6TDKNXSCnJ76pXFppAa
         K9zStiVgNMbTqvPZ6WgsF/om34GQFORCFHRO6iAJ2gynMWdnLDXp3lN5FT5S+nxcQD/Q
         oWwSbcbx8BUOQ9rp9ikvrJPnanJorloUQ4TfzGT+XLyv0Kl9QOOTnVT7FAXc4NY1/gaP
         q++IB9Y1NO1WvVUOJclCLclYKgmgDmxjIxmNPaaoiObYbpg0P5CVx7JKglG7yLReqrzn
         e1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777977398; x=1778582198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YYe0UsBMCaRl/SSTsNMvYXizf5N50Ge9yNyjOI2yeog=;
        b=ZpBnMqXLqEysaTUz2GgEGZ+XzbukjFBEvD4/STRl0Gk6PbwkUWZdcJoQf1NjvmnPQe
         3w0XR6Ey6NFX5avvu6lxdX/CqnzMMaJYdCHILFqdABzy/0Gr6fzQsp35t4B76E56kHsC
         LDNSmd1QKxEmYRbNOMx3nYJ53W8iIkKmT2pcn3HyGzriPKOGgJ0Oc/ftlwLaa9m7vzms
         eYbKrOqI36hlrZ/nuNuvniQWFo6QH4srFq0F3Cpri8xmPFwNNEIkStHbjsKzms7sevtx
         5OguN3T8HrR7ETlOaLpvbpluzIKGMi2jDjCUx/4E8FnjL10xxahrnim549rqBVWhv2XN
         jVmA==
X-Forwarded-Encrypted: i=1; AFNElJ+sgpfNi0vMJvZ/Ozm0vSXVSUJXXC6aIMse0IzNR2CyqMWM2sk2UP8d2CTiAH+Uy2r6iUXgjBK8c3M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9UdetIirfPtpyxT4GWBpzEyfnbhsZGgpgS2cNMFqrvKkumfbE
	9BKwnrjfyTKKySJDOZXAQaqpBBJut5AfnncNLIWAnLxx95olrqrLL80t
X-Gm-Gg: AeBDievMvcCBwl634j0nfw51pUGI7s+iVljB8wWJhUWDKiYOKzInx+DueULT60SO1i0
	r+K1Bf+XnK41/9OdOgSNVCIh805ai0xgC5DXnem6sE06nCDRIbS9FT2EOP+U3ePRSdWgks8X9HW
	bLaiPJzBjzIKVu/PNLwKjkKz6fzkdt6wBzuhxAk+sx/o9C/RjkwRDUPu7aZS+rwUYZAnjrx6WGx
	t4xqjakpE0L+DdKKsJ9f6uI7DjjyzJOH5sJlkcglkcE28/H1BQ8BGyLp8TjlRIZup+iTH76feMA
	E/7udjHgq2S1Y9MRYicwLpffAx+YVBwjcbMThC1ZZGa+czxl17uZYYWTG0MfzSJhxtOQEdFjgju
	aYKDq9qfDPmFl3HOZ7NP0V37Xar47s3ISr/Fy9N06o0klCzLrE4Z2+Ra3inl9SuIY+YEHFMOMbT
	UhqwwZe9jDSUGSq/+n/8j/je3Ve7u1Q91P3ZMMRUgN+I+csnA6tcIHk7Hl9+94k9xEqtIuAoY=
X-Received: by 2002:a05:6512:800e:20b0:5a8:6391:4fe5 with SMTP id 2adb3069b0e04-5a863915030mr3062779e87.26.1777977397888;
        Tue, 05 May 2026 03:36:37 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c341848sm3774443e87.65.2026.05.05.03.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:36:37 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	Valery Borovsky <vebohr@gmail.com>
Subject: Re: [PATCH 1/5] perf/arm_pmu_acpi: fix reference leak in arm_pmu_acpi_probe error path
Date: Tue,  5 May 2026 13:36:27 +0300
Message-ID: <inv007-withdrawal-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1777889235.git.vebohr@gmail.com>
References: <cover.1777889235.git.vebohr@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_033640_917476_D3376959 
X-CRM114-Status: GOOD (  11.53  )
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

WWVhaCwgeW91J3JlIHJpZ2h0LCBteSBiYWQuIFRoZSBgYXJtX3BtdV9hY3BpLmNgIHBhdGNoIGlz
IGRlZmluaXRlbHkgYnJva2VuLgoKU2luY2UgYHNwZV9kZXZgIGFuZCBgdHJiZV9kZXZgIGFyZSBz
dGF0aWNhbGx5IGFsbG9jYXRlZCwgdGhleSBkb24ndCBoYXZlIGEKYC5kZXYucmVsZWFzZWAgY2Fs
bGJhY2suIElmIHdlIGhpdCBgcGxhdGZvcm1fZGV2aWNlX3B1dCgpYCBoZXJlLCB0aGUgcmVmY291
bnQKZHJvcHMgdG8gemVybyBhbmQgdHJpZ2dlcnMgYGRldmljZV9yZWxlYXNlKClgLCB3aGljaCBp
cyBnb2luZyB0byBzY3JlYW0gYWJvdXQKdGhlIG1pc3NpbmcgcmVsZWFzZSBmdW5jdGlvbi4gQXQg
YmVzdCwgd2UgZ2V0IGEgbWVzc3kgV0FSTjsgYXQgd29yc3QsIGl0J2xsCnBhbmljIHRoZSBrZXJu
ZWwgaWYgc29tZW9uZSdzIHJ1bm5pbmcgd2l0aCBgcGFuaWNfb25fd2FybmAuCgpUaGUga2VybmVs
LWRvYyBub3RlIGFib3V0IGBwbGF0Zm9ybV9kZXZpY2VfcHV0KClgIGlzIHJlYWxseSBtZWFudCBm
b3IgZHluYW1pYwphbGxvY2F0aW9ucyB3aGVyZSB0aGUgcmVsZWFzZSBwYXRoIGFjdHVhbGx5IGZy
ZWVzIG1lbW9yeS4gRm9yIHN0YXRpYyBzZXR1cHMKbGlrZSB0aGlzLCB0aGUgb3JpZ2luYWwgY29k
ZSBpcyBhY3R1YWxseSB0aGUgcmlnaHQgd2F5IHRvIGdvLgoKUGxlYXNlIGRyb3AgcGF0Y2hlcyAx
LzUgdGhyb3VnaCA0LzUgZnJvbSB0aGUgdjEgc2VyaWVz4oCUdGhleSBhbGwgc3VmZmVyIGZyb20K
dGhlIHNhbWUgbG9naWMgZXJyb3IuIFBhdGNoIDUvNSAobWZkOiBzbTUwMSkgaXMgdGhlIG9ubHkg
Y2xlYW4gb25lLCBzbyBJJ3ZlCnJlLXNlbnQgdGhhdCBhcyBhIHN0YW5kYWxvbmUgdjIuCgpTb3Jy
eSBmb3IgdGhlIG5vaXNlLgoKVmFsZXJ5IEJvcm92c2t5CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
