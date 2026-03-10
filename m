Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB768EB107C
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 15:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGgUu+1y9vg5Eu6A346b2OkmSOkL4iMpi9VVNaX/vbo=; b=xceAbvAO/awvvG
	N74zL6OPA2itAo24lfRt/VEjQkJrhHUDi2A9rgAL1MTXJV3RFPMN/S5hByOvE3qpqLu2fle/tygia
	NpuzFZuSWCAiP1NUN3huKCCulBndj14aAO6G621f0xe/aqMZ+Z8WuPPA0aoBPWkh7S8tfm8LgLxOg
	o6nDux/aEhs22TzRYykBZbbIMSIPJzkowc3sTowGDgrUI3z5m24dH5RaOSGtoSr6+EINHQ+E506ST
	VrTnZaZOC9JlHx5idpcuIkbnwJB47QJWcz0Bii1swfu0L+07iCbSO9p01EiXW+B5Q0vlAxHP4m/PD
	w625izXqWw0hGEZ12UzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzSE-00000009ruz-2Zzt;
	Tue, 10 Mar 2026 15:57:06 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzS9-00000009rsx-3mZD
	for linux-mtd@lists.infradead.org;
	Tue, 10 Mar 2026 15:57:05 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-41540f23deaso561673fac.2
        for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2026 08:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773158220; cv=none;
        d=google.com; s=arc-20240605;
        b=bJUsSTMTOzsPj0Pll6hlTsGvjlmCiiSmnLHA2L9u7iZT/KpPyqMrbgrypyFeaed/Wu
         j0vTBBA8SZ3eo7f4R1vxQ6F7nxzfxoyTP8jLf2w2AsjICeGa59x6KsTPsHCW97VIbdl/
         8r4WZ6iSPqK6vUIlHAjqTuv5pzZaaKUdujspzvqwxCTNue4/UW/tgU6lXTIGFECv6Tm3
         pVOJPt4M7vFDSZrlxom1ktKP7eJpz7XtdJ6vxJ+SeetEYUipViLB6GmYqcVpI9zMLJR8
         vyKnDGv/pCh7vNDPwhkDMx+X3JZVY5yKtsjky8iu4T9yuNcxnx6Ko/N+b6TqJGSs/hJI
         +q1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k0ZfmdoKETAu32CUc6DaYZn/AQfT5ZtxxhfQJEgADr8=;
        fh=mfv/lbZk/Yje6hCDMqu1bJ7Wg/pNeWegmKyKB69D87k=;
        b=QdPVuHrcKjQ9R5KK6HfkrFapOXU3hNnWGqxwtT9cUFCZfBXuNxkOqtKJejgyRUaTYI
         fNPYxhwlaYgZiKC1wis6ySdGfUl2pQFI9z0PoE1rJEdkcBEofXQ5YLtwns/hZWjqndea
         gUqkuVUQ1lfHk2ZCDWkGhphQjFkd3GYsIj36w+6sicTvvNc/QLnMknh7lqDynnpxoZge
         rl4OtAgR6goBzNcIK4RHMhqDhbD5Ec2a5QJs50Nt896rPMjQDHruWKfIEmuX/qAb4Rg5
         o800gaW/xsj12aOsv9SWHANuMUdqEz9aevnvfcW43diovWywYx3VwMU8gghZxqi1mKHV
         tmEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1773158220; x=1773763020; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0ZfmdoKETAu32CUc6DaYZn/AQfT5ZtxxhfQJEgADr8=;
        b=Hle9sW6Fu2aRonCKUeTgczqon4CQBEtOK36ksYLjuy4nJPbMYbGyL53lWN5Fw3/5Wl
         HP7qvFnQ9cl8UmyYEAjPi6VdZ08k0hEFzkWCzqtmn1vm4Pk+S99EHVdsUXDrwFpybBJm
         vyzjp9tP22xczj07xbIfPWHAFNOx2YDXEaO4SsyB8LQxdX4TwrtruJ/Q2hWjqOtHoBFX
         CgDwzVdp8mrzgOQcHET1lDoK8PHpOUi0NHKSRQ3eyUh0G5NL88YmrnHCGhK4xKMSCrNA
         KBWaA2gx6sTOK1myE1p0798wNjuJPh2Q/mZfjk09RU5lXr4mIoT4rvZvre+pMlmdy7Qh
         OPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773158220; x=1773763020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k0ZfmdoKETAu32CUc6DaYZn/AQfT5ZtxxhfQJEgADr8=;
        b=XBnzt6rs8fqpKStqh+kqChHm38xRRdlbrfapkM0BCaub0BNNfb8RtOT0gnQA85DdeO
         SNQPK6GLLvmZ/G6wCJjWu6I2uutHU4dEeS8IWG598aoDbh1KaMupJfii46twmc7A+Cej
         DvDJxSPVJh3gG3NLI84DgoYiVUiyFPHjdlutxsFaGavF09wH3BGNCfxc6bS/JXmrOtdU
         KFOSo09EXpWbd4nJ+92qVIXpy133XnfJTLOfVb1itPCCJOUWAEAsy2OsZD1UvsZEFfNB
         M+UPEwjtSTBqd8Bq/NU9DeoWOm0daxp6+fSRoPcyG8WFLS9+Jflw11BRN1VCc9aTrCWd
         vAvg==
X-Forwarded-Encrypted: i=1; AJvYcCXi4N7isg3TXSE06XLvhzyk0Mavy5IYMwdXDrabY4Q9HEp1atQh3C3lVMcKlpKn9F46jBmt8Y3p+hI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAZw+aLdQj0LwfZVFhv2EAkwhcTWCnVxl/Ir9LhlCu36Q92HL5
	NDSJTGbogCpIwx12uA2eaNPorG1oVge26WYMRgAdaluTHchWQjo5uMWhLnVdH4c38Hy97numTb5
	29k96XbfUph1TxR6FG+rnkeGhecOx5lVduBxU84Y83Q==
X-Gm-Gg: ATEYQzw+3I30gRU1gKhcBel9bXcc6jdz1vEsPxh18At1gztmnHbSlmJhbBg90eL7Tx8
	TYtxmQmg31AJJ4CxSi/IXV05S+otdFgiLMM35TdHjR1BbkXGwkGnkkg+fLDJ/Rs32lELYvj4Oic
	UoBMriAsYsT+uCKQF3g8xZORV4PlTuOgJd9LUJ84dVIDG+t5+Dle3QiBjH5Xc/tILOnw2wp8WcT
	FWBOZbDvagyFb8CJJvCVlB6JuwTRaJl2FyGO1D0Q260Gdi+S/R3oF90WGjcD03AwVrc9yGErRZI
	1YmFzu4w
X-Received: by 2002:a05:6870:854b:b0:416:3f50:ea2 with SMTP id
 586e51a60fabf-416e45c1dc6mr7199342fac.8.1773158220092; Tue, 10 Mar 2026
 08:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com>
 <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com>
In-Reply-To: <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Tue, 10 Mar 2026 08:56:48 -0700
X-Gm-Features: AaiRm52sHfM1lLReXhJ6K_-eQeuNMsoWbyv4AHit6rY5_ursGYcV9eDpU-ihUic
Message-ID: <CADUfDZppWyOOPME0eJbmO1q+qvehxGiCk8Zz_nVxaQk08aukFw@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: Sungwoo Kim <iam@sung-woo.kim>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
	Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chao Shi <cshi008@fiu.edu>, 
	Weidong Zhu <weizhu@fiu.edu>, Dave Tian <daveti@purdue.edu>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-scsi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_085701_947715_7445CE4B 
X-CRM114-Status: GOOD (  24.46  )
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

T24gTW9uLCBNYXIgOSwgMjAyNiBhdCA0OjU14oCvUE0gU3VuZ3dvbyBLaW0gPGlhbUBzdW5nLXdv
by5raW0+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXIgOSwgMjAyNiBhdCAxMTozMeKAr0FNIENhbGVi
IFNhbmRlciBNYXRlb3MKPiA8Y3NhbmRlckBwdXJlc3RvcmFnZS5jb20+IHdyb3RlOgo+ID4KPiA+
IE9uIFN1biwgTWFyIDgsIDIwMjYgYXQgMTE6MzDigK9QTSBTdW5nd29vIEtpbSA8aWFtQHN1bmct
d29vLmtpbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFRoZSBudW1hX25vZGUgY2FuIGJlIDwgMCBzaW5j
ZSBOVU1BX05PX05PREUgPSAtMS4gSG93ZXZlciwKPiA+ID4gc3RydWN0IGJsa19tcV9od19jdHh7
fSBkZWZpbmVzIG51bWFfbm9kZSBhcyB1bnNpZ25lZCBpbnQuIEFzIGEgcmVzdWx0LAo+ID4gPiBu
dW1hX25vZGUgaXMgc2V0IHRvIFVJTlRfTUFYIGZvciBOVU1BX05PX05PREUgaW4gYmxrX21xX2Fs
bG9jX2hjdHgoKS4KPiA+Cj4gPiBUaGUgbm9kZSBhcmd1bWVudCB0byBibGtfbXFfYWxsb2NfaGN0
eCgpIGNvbWVzIGZyb20KPiA+IGJsa19tcV9hbGxvY19hbmRfaW5pdF9oY3R4KCksIHdoaWNoIGlz
IGNhbGxlZCBieQo+ID4gYmxrX21xX2FsbG9jX2FuZF9pbml0X2hjdHgoKSB3aXRoIGludCBub2Rl
ID0gYmxrX21xX2dldF9oY3R4X25vZGUoc2V0LAo+ID4gaSkuIG5vZGUgPSBOVU1BX05PX05PREUg
d291bGQgc3VnZ2VzdCB0aGF0IGJsa19tcV9od19xdWV1ZV90b19ub2RlKCkKPiA+IGRvZXNuJ3Qg
ZmluZCBhbnkgQ1BVIGFmZmluaXRpemVkIHRvIHRoZSBxdWV1ZS4gSXMgdGhhdCBldmVuIHBvc3Np
YmxlPwo+Cj4gVGhhbmtzIGZvciB5b3VyIHJldmlldywgQ2VsZWIuCgpXaGlsZSBJJ20gZmxhdHRl
cmVkIHlvdSBjb25zaWRlciBtZSBhIGNlbGVicml0eSwgbXkgbmFtZSBpcyBDYWxlYiA6KQoKPgo+
IGJsa19tcV9od19xdWV1ZV90b19ub2RlKCkgY2FuIHJldHVybiBOVU1BX05PX05PREUgaWYgdGhl
IGRldmljZSBxdWV1ZXMKPiBleGNlZWQgdGhlCj4gbnVtYmVyIG9mIENQVXMuIEFmdGVyd2FyZCwg
aXQgaXMgYWRqdXN0ZWQgb24gdGhlIGNhbGxlciBzaWRlIHRvCj4gbnVtYV9ub2RlID0gc2V0LT5u
dW1hX25vZGUuCgpJIHRob3VnaHQgdGhlIE5WTWUgZHJpdmVyIGNhcHBlZCB0aGUgbnVtYmVyIG9m
IHF1ZXVlcyBzbyBldmVyeSBxdWV1ZQppcyBhZmZpbml0aXplZCB0byBzb21lIENQVSAoc2VlIG52
bWVfbWF4X2lvX3F1ZXVlcygpKS4gV2hhdCBhbSBJCm1pc3Npbmc/CgpCZXN0LApDYWxlYgoKPgo+
IHNldC0+bnVtYV9ub2RlIGNhbiBzdGlsbCBiZSBOVU1BX05PX05PREUgaWYgQ09ORklHX05VTUE9
biAodHJpdmlhbCkgb3IKPiBwY2lidXNfdG9fbm9kZSgpIHJldHVybnMgTlVNQV9OT19OT0RFIGlm
IEFDUEkgZG9lc24ndCBwcm92aWRlCj4gcHJveGltaXR5IGluZm9ybWF0aW9uLgo+IEJ1dCBJJ20g
bm90IHN1cmUgaWYgdGhpcyBpcyB1c3VhbCBpbiB0aGUgcmVhbCBtYWNoaW5lcy4gV2UgZm91bmQg
dGhlCj4gY3Jhc2ggaW4gUUVNVS4KPgo+ID4gPiAgc3RhdGljIHN0cnVjdCBudm1lX2Rlc2NyaXB0
b3JfcG9vbHMgKgo+ID4gPiAtbnZtZV9zZXR1cF9kZXNjcmlwdG9yX3Bvb2xzKHN0cnVjdCBudm1l
X2RldiAqZGV2LCB1bnNpZ25lZCBudW1hX25vZGUpCj4gPiA+ICtudm1lX3NldHVwX2Rlc2NyaXB0
b3JfcG9vbHMoc3RydWN0IG52bWVfZGV2ICpkZXYsIGludCBudW1hX25vZGUpCj4gPiA+ICB7Cj4g
PiA+IC0gICAgICAgc3RydWN0IG52bWVfZGVzY3JpcHRvcl9wb29scyAqcG9vbHMgPSAmZGV2LT5k
ZXNjcmlwdG9yX3Bvb2xzW251bWFfbm9kZV07Cj4gPiA+ICsgICAgICAgc3RydWN0IG52bWVfZGVz
Y3JpcHRvcl9wb29scyAqcG9vbHM7Cj4gPiA+ICAgICAgICAgc2l6ZV90IHNtYWxsX2FsaWduID0g
TlZNRV9TTUFMTF9QT09MX1NJWkU7Cj4gPiA+Cj4gPiA+ICsgICAgICAgaWYgKG51bWFfbm9kZSA9
PSBOVU1BX05PX05PREUpCj4gPiA+ICsgICAgICAgICAgICAgICBwb29scyA9ICZkZXYtPmRlc2Ny
aXB0b3JfcG9vbHNbbnVtYV9ub2RlX2lkKCldOwo+ID4gPiArICAgICAgIGVsc2UKPiA+ID4gKyAg
ICAgICAgICAgICAgIHBvb2xzID0gJmRldi0+ZGVzY3JpcHRvcl9wb29sc1tudW1hX25vZGVdOwo+
ID4KPiA+IFNpbXBsZXI6IGlmIChudW1hX25vZGUgPT0gTlVNQV9OT19OT0RFKSBudW1hX25vZGUg
PSBudW1hX25vZGVfaWQoKTsKPiA+Cj4KPiBUaGFua3MsIEkgd2lsbCBtb2RpZnkgaXQgaW4gVjIu
Cj4KPiBTdW5nd29vLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
