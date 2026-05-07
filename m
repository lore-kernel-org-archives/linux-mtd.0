Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BEECD3427
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 08:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHrz/ab4UCwjVGJPdFZc+fO2KA7l9neet9trZPhwud4=; b=o0YQ14im58d0Sp
	bLiMg52LoiitZPqP9FKQhVzLE/HivYRghHh/LaaZt1+Y5+ZZmUiEmqDqVzO8Sq4UQLRObmGBvb8vV
	Q7cDYc5EFk8W/oMA+cjqOl9/Pt1CE8Sg7MD5ZCqK/MPMuNzak4h5YLnzNFtavt6VVj83OzWryxkDA
	AkuSXbxj3PVOVnkNCEFwEyW7eOtzjY2xdmrq0B47glnyUPd228H2f0sXa6udT4d7VcVgH7w7UeM+W
	VFA+AuV7+dQs7oNkI1EIUsaRnKsTXdXhMZzVWdFxedkxllkyDskSVc0kAMqCaCCHwBSsD8TPJEZRZ
	6DLyL46a8ZTK0pPCmD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKu32-00000003ASe-0eDA;
	Thu, 07 May 2026 08:25:32 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKu2z-00000003ARp-30C7
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 08:25:31 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-7bdaa68cf81so4911537b3.3
        for <linux-mtd@lists.infradead.org>; Thu, 07 May 2026 01:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778142328; cv=none;
        d=google.com; s=arc-20240605;
        b=HObKRCpx/4Fe7r1iJSUT+L3ous1S06BxQpMiDFkHquET47hLEiPvW1Su1GVXv8n+Cp
         ASQLTT4mvoqzz+jE3MpsXu2y50OAO3mqwlZuWcqshoQZhKuFg8v8ZQuPi2pcb1Th957A
         Xq7QXJbfuIwK9RH0ZmIR9tgnmUcxZ+V4CkozL1VeQSniFRhrnO502TSdKlIJBT4nF1YG
         Hql4l+TFcShnUzZB/aFfsFFKaX7I9hwLJi+ILAOHgIBi7qNO2XP2YC2Grre/ibBeL6Wy
         nwJ2znSAQAfqaSTSWuwJujSo0YsNRaMZ4a30eFHNe4TOdv8WMYiJ1SM1ysZnJi6h8OD6
         EDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dmMTviTxfyPYhgC3busFUQgG+mXYenH0F+l2oB1lmHQ=;
        fh=abshw5C+1eUZDY41oMoJn/iIzwtvOEi7peW1GSCLp30=;
        b=MvbbYIxj1VsRIr1Kr8t783S7NM+Z4SFWCewzAhz2LU5Nq1UK4GKFiYax7gZYwCZDZo
         yr80c4QBn+SXzwtDOEzlP+63RlLCKXqGPCc/Bl/h1sI7BFZXlnroCMJUoDqZWwpFj0Np
         //hhYBVheSK/Sjyd2MAQTFDsUqKn6xjiK2t+4sBYHqtNqesG7dt7OZPxSMccaix331it
         gGNymEBtlAo7Kf4LNdPE52YSB2FIWZtGg7VQ9i4YmYCuAVC9zvmfVYJxb4Map/USV2lC
         crrT+zThJmxohbFHCTZOF0M6wv9kNNQFJtZsC3zgv3U6naUxRDTgobk0HQucA5GXm9ff
         BP6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778142328; x=1778747128; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmMTviTxfyPYhgC3busFUQgG+mXYenH0F+l2oB1lmHQ=;
        b=Kw1DN/Fc8UbKEMHdgfxlfo7//oZenIeqalF4j1u6jXUGCSlJv7pPLkJtVE5QVqZim6
         YBl0guECdnMUOkHQqDnjj6Qymu95J3DdE/ZWeynmr15jC+UG0+23sd3lDrpO8IOvCTud
         U1aICtUw1K8QvL/j0f3GuGBWSeuopO6teMyi8J1pMnv1XZJQrlUXSgp+2yPo8n5DNezU
         9xrsS1RGcN7DOHTdeDMjrWH8aJiC+RXArLSyZw0D+0j56AtwrLATvWYLqAMp2pDuWlVZ
         tALtfQcPDHHuedzZZpuDWxb9fwtLw1ykzJYte4r7HJ4kzICLTsGZc+GKqGyygIR/NJnC
         dNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142328; x=1778747128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dmMTviTxfyPYhgC3busFUQgG+mXYenH0F+l2oB1lmHQ=;
        b=ilgSr57QoFEwxG4o84scUG9pm0+8aOaAdE+QCvj89BvUfPAmbZgL7slujxYccqd0Cr
         4rqDIVO6LMGoiZp/ikCoGWYmBszShxg0DVdXgTAUUHbkIPvVRkk5EBUeybEVb/xx+CrL
         0Eau8mo+niLWz0K9IPa2aQmcERr93c0pGIDDhJohWXbA/KFoh9k5kyUX6U95BkARJyWH
         QtKHQGUikS+J8ox4hmEWjAH9ZChI3jQnjlzzj0czCMjjjGJG/B8ToIPSeNbmfFk2CkSq
         SNWBhFo7xtGvJGnconaBaDgiW9YP+0jfMlbjj2KmWdFKCWyfGMcsvKgW8w56dmnugYqt
         FnvA==
X-Forwarded-Encrypted: i=1; AFNElJ+lPq2y4bs33nnNekyCLK+YnUAFGSgG820AOrREtLLBNyzD+tMz/ESm3bn22PeqppGxSmM25HMMERw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/dhVv2YnRinHOokXBySXHCnLut4rJie7kpiyA1ysfKQJxKeFb
	6xHicP3jjwJkdthDgcIrur675RaOPIwrHvtR9L5fdFoSnKcYmA98Z4HvCXWV41RUIFhScv9CA7r
	a1AfCYWLLANZ9yRlM2uJlMkxofbr7zdg=
X-Gm-Gg: AeBDievnPGdW35hAV6ta0wiVoqPgpCgbl1yYOI9FlYbFJcmlTKRrLy9RWrw8bJPDuSF
	8vGruIn3/FIaNcMSecadnyStO0LUbejRlticqmn8CHrwH6dx6RsLhvw5uOT6B+9Cn9IGzNuUQ3o
	mccA70RF65tqt730b687L/tr1msGE1JAFhetqubvkh+zRSIHNiXu14UJMWxJqWYH6+wExIZG6o9
	tIaw/uKrdnvLzjaIs3pXqIcYyECxFGgyZfcQtpqdyJpzoJOTC8vQ62faG4gzVO1c2AKzBu2dXQh
	drKLESTe+VA0ePq2hZ3LRP6pMyAoKcalPu9MLFhl00xUEWQ=
X-Received: by 2002:a05:690c:6706:b0:7bd:4b0c:52cf with SMTP id
 00721157ae682-7bdf5f2541fmr76057477b3.46.1778142328576; Thu, 07 May 2026
 01:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260507032308.16485-1-hechushiguitu666@gmail.com>
 <20260507032308.16485-2-hechushiguitu666@gmail.com> <7c4bf8d4-c561-f5bf-fc7f-3e384fe1a9e6@huawei.com>
 <874282979.1642.1778140250921.JavaMail.zimbra@nod.at>
In-Reply-To: <874282979.1642.1778140250921.JavaMail.zimbra@nod.at>
From: Haoyu Lu <hechushiguitu666@gmail.com>
Date: Thu, 7 May 2026 16:25:16 +0800
X-Gm-Features: AVHnY4JxK8a8XvQNJt6ZufkBaZuQguml2ycPp_cuqYXFLMGpreDg46vskXPlkRI
Message-ID: <CAEZ4rQ-9tMZhh_LQqXvRcVN3dynQ9CpjHjs=CsTSDkKhwB_R4Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ubi: build: replace simple_strtoul with kstrtoul in bytes_str_to_int()
To: Richard Weinberger <richard@nod.at>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_012529_761424_006C7143 
X-CRM114-Status: GOOD (  18.15  )
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

SGkgUmljaGFyZCwgWmhpaGFvLAoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIEkgd2lsbCBkcm9w
IHRoaXMgcGF0Y2guCgpUaGFua3MsCkhhb3l1CgpPbiBUaHUsIE1heSA3LCAyMDI2IGF0IDM6NTDi
gK9QTSBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZToKPgo+IC0tLS0t
IFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiA+IFZvbjogImNoZW5nemhpaGFvMSIgPGNoZW5n
emhpaGFvMUBodWF3ZWkuY29tPgo+ID4gQW46ICJoYW95dS5sdSIgPGhlY2h1c2hpZ3VpdHU2NjZA
Z21haWwuY29tPiwgIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiwg
InJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sCj4gPiAiVmlnbmVzaCBSYWdoYXZlbmRyYSIgPHZp
Z25lc2hyQHRpLmNvbT4KPiA+IENDOiAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJh
ZGVhZC5vcmc+LCAibGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4K
PiA+IEdlc2VuZGV0OiBEb25uZXJzdGFnLCA3LiBNYWkgMjAyNiAwOTo0NToyNAo+ID4gQmV0cmVm
ZjogUmU6IFtQQVRDSCAyLzJdIHViaTogYnVpbGQ6IHJlcGxhY2Ugc2ltcGxlX3N0cnRvdWwgd2l0
aCBrc3RydG91bCBpbiBieXRlc19zdHJfdG9faW50KCkKPgo+ID4g5ZyoIDIwMjYvNS83IDExOjIz
LCBoYW95dS5sdSDlhpnpgZM6Cj4gPj4gRnJvbTogSGFveXUgTHUgPGhlY2h1c2hpZ3VpdHU2NjZA
Z21haWwuY29tPgo+ID4+Cj4gPj4gUmVwbGFjZSB0aGUgZGVwcmVjYXRlZCBzaW1wbGVfc3RydG91
bCgpIHdpdGgga3N0cnRvdWwoKSBpbiB0aGUKPiA+PiBieXRlc19zdHJfdG9faW50KCkgaGVscGVy
IGZ1bmN0aW9uLiBTaW5jZSBrc3RydG91bCgpIHJlamVjdHMgdHJhaWxpbmcKPiA+PiBub24tbnVt
ZXJpYyBjaGFyYWN0ZXJzIChzdWNoIGFzIHRoZSBHL00vSyBzdWZmaXhlcyksIHRoZSBudW1lcmlj
IHByZWZpeAo+ID4+IGlzIGZpcnN0IGV4dHJhY3RlZCB3aXRoIHN0cnNwbigpIGFuZCB0aGVuIHBh
cnNlZCBzZXBhcmF0ZWx5IGJlZm9yZQo+ID4+IGhhbmRsaW5nIHRoZSBzdWZmaXguCj4gPj4KPiA+
PiBUaGlzIHByb3ZpZGVzIHByb3BlciBlcnJvciBoYW5kbGluZyB0aHJvdWdoIHRoZSBrc3RydG8q
IGZhbWlseSB3aGlsZQo+ID4+IHByZXNlcnZpbmcgdGhlIGV4aXN0aW5nIHN1ZmZpeCBzZW1hbnRp
Y3MgZm9yIGJ5dGUgY291bnQgcGFyYW1ldGVycy4KPiA+Pgo+ID4+IE5vdGU6IHRoZSBvcmlnaW5h
bCBzaW1wbGVfc3RydG91bCgpIHdpdGggYmFzZT0wIGFjY2VwdGVkIGhleGFkZWNpbWFsCj4gPj4g
KDB4IHByZWZpeCkgYW5kIG9jdGFsICgwIHByZWZpeCkgZm9ybWF0cywgd2hpbGUga3N0cnRvdWwo
KSB3aXRoIGJhc2U9MTAKPiA+PiBvbmx5IHN1cHBvcnRzIGRlY2ltYWwuIFRoaXMgaXMgbm90IGEg
cHJhY3RpY2FsIGNvbmNlcm4gc2luY2UgTVREIGJ5dGUKPiA+PiBjb3VudCBwYXJhbWV0ZXJzIGFy
ZSBhbHdheXMgc3BlY2lmaWVkIGFzIGRlY2ltYWwgdmFsdWVzIGluIGJvb3QKPiA+PiBwYXJhbWV0
ZXJzLgo+ID4gVGhlIHViaSBjb3VsZCBiZSBsb2FkZWQgYnkgbW9kdWxlIGluc2VydGlvbiwgbWFu
eSB2ZW5kb3JzIHNldCBwYXJhbQo+ID4gJ3ZpZF9oZHJfb2ZmcycgdG8gc2F2ZSBzcGFjZS4gV2Ug
Y2Fubm90IG1ha2UgdGhlIGFzc3VtcHRpb24gdGhhdCBhbGwKPiA+IHVzZXJzIHVzZSB0aGUgZGVj
aW1hbCBzeXN0ZW0uCj4KPiBUaGF0J3MgYSBnb29kIHBvaW50IQo+Cj4gSW4gZ2VuZXJhbCBJJ20g
bm90IGZvbmQgb2Ygc3VjaCBjaGFuZ2VzLiBUaGV5IGNoYW5nZSBjb2RlIGZvciB0aGUgc2FrZQo+
IG9mIGNoYW5naW5nIGNvZGUgd2l0aG91dCBmaXhpbmcgYWN0dWFsIGlzc3Vlcy4KPiBJJ2xsIGhh
cHBpbHkgYWNjZXB0IHBhdGNoZXMgdGhhdCBwb2ludCBvdXQgcmVhbCBpc3N1ZXMgd2l0aCB0aGUg
Y3VycmVudAo+IHVzYWdlIG9mIHZhcmlvdXMgc3RyaW5nIGZ1bmN0aW9ucywgdGhvdWdoLgo+Cj4g
VGhhbmtzLAo+IC8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
