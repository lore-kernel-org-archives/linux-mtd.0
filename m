Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02639C3ABC5
	for <linux-mtd@archiver.kernel.org>; Sun, 11 May 2025 09:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Z8vmmah0dL+3MjLJyg237LW89t1DcCC3gyBeboL8VNs=; b=0vH
	/RZ+FyoTlx6iRnGbrAuHS4lojYXRUt3aAXQYfBW89qKlrCc04MfYOcmJ/jft5Eb4u9siGlO3hYAs3
	siPN1VkvCF5Jt8G6TN4RsmWKuhAe/s5sek5V1ylErb4cQhroR8J0TGztiVCFDLXhbfEWWLGgt0oZQ
	N2PiJ2AQeuMPZU4i6p5svscfI1Y+42fv5URHSWqSk8pqS6/oSLq7DYpDxsi1UFj27w7h6aXSVNjdX
	MWFeE9WrGWMUQ68+/dR6UVlxbgOdzMrHdzt6URy8F/lyG8lrEvedVcXPYfsflWVWMTly3SZdCVQNw
	0qVUSRecWb9J5UppHr1L348K6JdO+YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3D9-000000071at-3Dgj;
	Sun, 11 May 2025 09:43:07 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3D6-000000071aQ-21r4
	for linux-mtd@lists.infradead.org;
	Sun, 11 May 2025 09:43:05 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so3506835b3a.1
        for <linux-mtd@lists.infradead.org>; Sun, 11 May 2025 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746956583; x=1747561383; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SnC89AHyslSef6V2aYLkekOdGeOj9PF1IUYLzzXqRiM=;
        b=nMGR/CLl/QjqAMhJjqjgh1xjDuHK3QROY/cqUmv8iKbFwrV79INv0Aun9DwFHgYQFN
         oOxvFQUEAPADZmhS6lco2ODTcY16dqbUtXjqTv8CoA0BtcOpJf1kQLbSEeLPLb0Hx9IP
         hLhoBwVoRtE7xWaxijUmx+G1/VcyjJAPWi22ATIh6JDY413ebKDNYKvniKEgkNmnqcd9
         WHNNFSr1kYvepbwONrIMl24l2s59R1Qd2N1VhRercjv9h4PE8pFFf2/aUYcL7+MVUv/V
         guOgdzMrneq3jxv2O7m3Ocs/U88b9ehnJgWc+6rda6UJ/I6rSr/RAP+EZYBvV2v0fVAB
         d4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746956583; x=1747561383;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnC89AHyslSef6V2aYLkekOdGeOj9PF1IUYLzzXqRiM=;
        b=WNCEx0F+1wUzDWfMSnxnj+C13bpFj7YZZiEO28LAjrbalhMwFIMn2OdADHdzBir5zT
         855FlnAfgM6u6a4451phHWxSK8Lrp86oVwN2mvaCtc4SgMOV3gQQF0JdqofNpCU+Uj40
         MyZc5JHsjwjytZ9WsptaPHyp+o8WtfUPbfzorn6+I4B4nuBxlSxmogW4Dk2fUbXGv6nu
         HkL5Pci7itTf1FXENeEM/RIV+2zuAPZ+D9HvLwvHOtL4ELPwcQv5TJHTrpd6pQ+fsMrx
         hbCuCqzXLi3oFuu+kBaq7MDR82gR6WnSuPfZSVDkP/Fhj57ewfInqBWSs10mAhYc73bO
         s4qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsW7Fw/+8iZHKInB28gRKfV2v2S13ieaHP72CoGh+blV1nQpHN4+DcNcI6MMs1eOTg6y7O5ADiRps=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5ZwritG4mnybDFoSLiRwk+gVsKQN2FfXIupk0aVh0aJfEf/u6
	8kzZHNrxI5rlt2BTkG5A1b9EvrhmW6o0K4AJRJ5wGASr5WhF5mkeiarrFRALMgUofoGE1ZrumDG
	uxz1Pfv1bj0tcMtN3yQIH/F2fH8KGiTsZ
X-Gm-Gg: ASbGncueFYS/FrznuCIjbBGru5YzQGMYQm4eGiKZ3CKBmU1CKvl1t8Ud/SHp3TY7K/F
	GU17n7+GARbmvRU42criQfGz/rcV4Ed71Ipq5ne6fz8PODOXkxUPi6loRkeG2VCSioVHrA1s932
	lbYrJV3SRxraFeaNnFZwHrihiHWWJqyMUCq6Oxa40ZAkc8s7ZvOdJEA6BpejY7oJxvc7E=
X-Google-Smtp-Source: AGHT+IH/mJ0x32ZlNKoI2eDR9O84MqogT0fzcKY9eBjFtKcEWG4I2sMg71tE4UvVNHYrlB5MENrq/i8SwY18K6OTj4U=
X-Received: by 2002:a05:6a21:3510:b0:1f5:7cb4:b713 with SMTP id
 adf61e73a8af0-215abb3a301mr14054823637.19.1746956583393; Sun, 11 May 2025
 02:43:03 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Sun, 11 May 2025 11:42:27 +0200
X-Gm-Features: AX0GCFuZrFjEp_RkcV0WctIvu4X1yuw5s5lS-0WHsmvO4h373KZg12qijyqjgv4
Message-ID: <CAKR-sGezB_SEb7UfPV6o6T2yibkAzNSqK9Hry1kNM46BMsH2_g@mail.gmail.com>
Subject: mtd: rawnand: brcmnand: exec_op patch broke < v5.0 controllers
To: dregan@broadcom.com, Miquel Raynal <miquel.raynal@bootlin.com>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	MTD Maling List <linux-mtd@lists.infradead.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	joel.peshkin@broadcom.com, Brian Norris <computersforpeace@gmail.com>, 
	dan.beygelman@broadcom.com, William Zhang <william.zhang@broadcom.com>, 
	frieder.schrempf@kontron.de, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vignesh R <vigneshr@ti.com>, 
	Richard Weinberger <richard@nod.at>, bbrezillon@kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>, 
	liao jaime <jaimeliao.tw@gmail.com>, kilobyte@angband.pl, 
	Jonas Gorski <jonas.gorski@gmail.com>, dgcbueu <dgcbueu@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_024304_533353_50511D5E 
X-CRM114-Status: UNSURE (   9.00  )
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

SGkgRGF2aWQsCgpJJ3ZlIGp1c3QgcmVhbGl6ZWQgdGhhdCB5b3VyIGV4ZWNfb3AgaW1wbGVtZW50
YXRpb24gcGF0Y2ggYnJva2UKc3VwcG9ydCBvZiB2Mi4xLCB2Mi4yIGFuZCB2NC4wIGNvbnRyb2xs
ZXJzLgpodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0LzNjODI2MGNlNzY2
MzQyOTFhZWQ4NzcwMzJhNDFlMzczODg0ZDY5ZTQKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2xpbnV4LW10ZC9wYXRjaC8yMDIzMTEyNTAxMjQzOC4xNTE5MS00LWRyZWdhbkBi
cm9hZGNvbS5jb20vCkkga25vdyBpdCdzIGFuIG9sZCBwYXRjaCBmcm9tIDYuOCBidXQgSSBqdXN0
IGRpc2NvdmVyZWQgdGhpcyB3aGlsZQp0cnlpbmcgdG8gYWRkIDYuMTIgc3VwcG9ydCBmb3IgYm1p
cHMgb24gT3BlbldydCAoZnJvbSA2LjYpOgpodHRwczovL2dpdGh1Yi5jb20vb3BlbndydC9vcGVu
d3J0L3B1bGwvMTg3NDYKClRoZSBpc3N1ZSBpcyB0aGF0IGxvdyBsZXZlbCBvcHMgYWx3YXlzIHJl
dHVybiAwIG9uIHY0LjAgY29udHJvbGxlcnMKYW5kIHYyLjEvdjIuMiBjb250cm9sbGVycyBkb24n
dCBldmVuIGhhdmUgdGhlIGxvdyBsZXZlbCByZWdpc3RlcnMKZGVmaW5lZDoKaHR0cHM6Ly9naXRo
dWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvM2NlOTkyNTgyM2M3ZDZiYjBlNmViOTUxYmYyZGIw
ZTllMTgyNTgyZC9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jI0wzNTcK
aHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvM2NlOTkyNTgyM2M3ZDZiYjBl
NmViOTUxYmYyZGIwZTllMTgyNTgyZC9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNt
bmFuZC5jI0wzNzEKCkkgZ3Vlc3MgdGhhdCByZXN0b3JpbmcgdGhlIGxlZ2FjeSBmdW5jdGlvbnMg
aXNuJ3QgZ29pbmcgdG8gaGFwcGVuLCBidXQKaXMgaXQgcG9zc2libGUgdG8gcmVzdG9yZSA8IHY1
LjAgY29tcGF0aWJpbGl0eSBvbiB0aGUgbmV3IGV4ZWNfb3AKaW1wbGVtZW50YXRpb24/CgpCZXN0
IHJlZ2FyZHMsCsOBbHZhcm8uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
