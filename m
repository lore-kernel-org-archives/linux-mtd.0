Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D181C83F2D
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jul 2025 04:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DoIHTunHZ2Uk2fZXNKZNT3g8JIBd+gZ6VTWcxTZQvoQ=; b=P72TpiMpHZvFAlrmBjzqe1ly8y
	rKPCYhQyGWqFNkLtC5/v85Vv5k7rH8ZU8iYMHr85ojOakFndD9A/00TGqs9AziVuQMcbmMyJsb6a0
	OS2sclup32MNmzi26D3teT0Shl4B3FmBxSLPO/dVUU+w+/+DQ+1lQ7mZtcBVAeeVtSaSul/s4/7iq
	OhvlPFPQfBYVPR70o9yHG7LDuxrQ4irZvC6V1+k2R0LLpRj+Wl14v2pkVz28ssTCADnb5navpH4DT
	ynHk1EtEF14m+JQdFEOo36vfVW20B7ywIBhIBvwSHSKUhDh6t2+/u29C+MSMvvJNI77iQQtRAJpYi
	+koIFRGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubuAk-00000006kYy-3ITI;
	Wed, 16 Jul 2025 04:55:14 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubuAh-00000006kXb-3yts
	for linux-mtd@lists.infradead.org;
	Wed, 16 Jul 2025 04:55:14 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b49ffbb31bso3515921f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 15 Jul 2025 21:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752641710; x=1753246510; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KUlf376OMv1XrkJW2oCmSZAdKifpL8InJUYTeCpUwoM=;
        b=PVaJOfRbWQ+bKVSPxmCUQEVobP6aJojUk3rgPxBH2amAyh0LRdoW9QmerAekYhWw1e
         /1L/EbjhOvPZHVi2nhauboks/Do/AslQBz1T9/aE0HVsGjba05NpgLuNwLeoxlGqMjy4
         H93zjb6meVPIXOFKoHx6BMc24siYtEPXo/sy0hfAOruTM3RLkQvFZGmcNBtHbUNu9YnN
         4xYXqZ/Pl+HGVmiXLOiwZu9gVvEID7KuVqbtlLBpQODJyahOdQw9eAojl+GVpuKOaf3u
         VEUmxF+/cRPnw/plnU2iZ238jzvaycEBWDm/LkqShazbt0/5HJV9hkxGx7JmZvXX0OUa
         RK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752641710; x=1753246510;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUlf376OMv1XrkJW2oCmSZAdKifpL8InJUYTeCpUwoM=;
        b=u1BwbcVRKYzLB5zrTB4Jc4IcgxVPJZ5IM27eRzdP/kb6Tc9kRAuawY1sO4lbdpcNXO
         sjzoVEKbT9inRM2EsoC8OlN+G8yHW7ahvhiugnY+ilYdXfAIVIZblW3wyGjl7P30maUs
         xmbsUlq/gpWTJKd8owFMCom05WSwT/6ukTZMxeq7qeIGyfY/VJkgLy7ry7u8xvUV4Xoc
         xrJH/OGtRV6hZ/2STrGotc8UKlzVdf4xmu3T391PJoIEoPNdrB5ysOKH1Lw55O7RyFtv
         +dLWVQo+5673eOfY6pe5UtwR79gfKlVSiS3Hbbtz4wX9e3bgJhTz27shCJinl9IKn7c9
         Za2A==
X-Forwarded-Encrypted: i=1; AJvYcCW/omkdhgXujLPKoArkv4vjoQeJtiJpDzGwLUKIDwflJ1a8VgtiKoCr+OVeMjYmadmzBDGV1mDtvG4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXDHCsndy0H5+oS+hu0VEG1/gEcjuWRARzPJYfk+LDSAtcP+f2
	9f82LzKBPHfZ0Ui4xwjvfdf/d6TKyI21SbKKlqQTl0ukAczcvC5YtSflqj8C4xF6DI4=
X-Gm-Gg: ASbGncv1R1GfKsql/7b36LS2zTSqBStnwMDx77nzZFWz/ywxiY5zPl1W7HjU4QWsF8l
	7PMULHl+6lX8QQe110KcJniK/F+DwCjeLoGVjInW7WFARHf6VyY3W35mCPAjHAYNoqkEMwYDzdl
	BDwemmCrU/mVlVbM7nnjsW7GcJGeSDtG+iEuYK7IaZOngfmEEbN02tr/AniYWp7JKritrwldJ6a
	W2wXGLKCNh03k1KGGAAVc31PoOeLEa8EqhJAYw6VSwrEvh2GLsHWHqCi1qb9FQKAVbRtBEK7mAt
	UPQcPO+k5lHGTsnEwY6O3XaMEHfudX/hh8M3RhMvE7IYxWVWEPCkk2uuXzzNYEqbpc+DXepQ1Xn
	vj3paO2PfADZFY6fpw8AV/eTIly+RJXy3JUt7x9AlTor/BFoh2Q==
X-Google-Smtp-Source: AGHT+IGQoacjNokIlv9kK4wCibwhRBT2cyuhZxnrQDEDj6ZSWUyIJyb34LpzcuPXzslTfEZGpbv7Yw==
X-Received: by 2002:a5d:5f50:0:b0:3a4:d53d:be20 with SMTP id ffacd0b85a97d-3b60dd54803mr1041332f8f.18.1752641709469;
        Tue, 15 Jul 2025 21:55:09 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ec6b4cda5sm11051963b3a.108.2025.07.15.21.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 21:55:08 -0700 (PDT)
Message-ID: <b43fe06d-204b-4f47-a7ff-0c405365bc48@suse.com>
Date: Wed, 16 Jul 2025 14:24:58 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Compressed files & the page cache
To: Gao Xiang <hsiangkao@linux.alibaba.com>,
 Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 linux-btrfs@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-erofs@lists.ozlabs.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Howells <dhowells@redhat.com>, netfs@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <2806a1f3-3861-49df-afd4-f7ac0beae43c@suse.com>
 <eeee0704-9e76-4152-bb8e-b5a0e096ec18@linux.alibaba.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <eeee0704-9e76-4152-bb8e-b5a0e096ec18@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_215511_984668_055F6A19 
X-CRM114-Status: GOOD (  23.54  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyNS83LzE2IDEwOjQ2LCBHYW8gWGlhbmcg5YaZ6YGTOgo+IC4uLgo+IAo+Pgo+Pj4K
Pj4+IFRoZXJlJ3Mgc29tZSBkaXNjcmVwYW5jeSBiZXR3ZWVuIGZpbGVzeXN0ZW1zIHdoZXRoZXIg
eW91IG5lZWQgc2NyYXRjaAo+Pj4gc3BhY2UgZm9yIGRlY29tcHJlc3Npb24uwqAgU29tZSBmaWxl
c3lzdGVtcyByZWFkIHRoZSBjb21wcmVzc2VkIGRhdGEgaW50bwo+Pj4gdGhlIHBhZ2VjYWNoZSBh
bmQgZGVjb21wcmVzcyBpbi1wbGFjZSwgd2hpbGUgb3RoZXIgZmlsZXN5c3RlbXMgcmVhZCB0aGUK
Pj4+IGNvbXByZXNzZWQgZGF0YSBpbnRvIHNjcmF0Y2ggcGFnZXMgYW5kIGRlY29tcHJlc3MgaW50
byB0aGUgcGFnZSBjYWNoZS4KPj4KPj4gQnRyZnMgZ29lcyB0aGUgc2NyYXRjaCBwYWdlcyB3YXku
IERlY29tcHJlc3Npb24gaW4tcGxhY2UgbG9va3MgYSAKPj4gbGl0dGxlIHRyaWNreSB0byBtZS4g
RS5nLiB3aGF0IGlmIHRoZXJlIGlzIG9ubHkgb25lIGNvbXByZXNzZWQgcGFnZSwgCj4+IGFuZCBp
dCBkZWNvbXByZXNzZWQgdG8gNCBwYWdlcy4KPiAKPiBEZWNvbXByZXNzaW9uIGluLXBsYWNlIG1h
aW5seSBvcHRpbWl6ZXMgZnVsbCBkZWNvbXByZXNzaW9uIChzbyB0aGF0IENQVQo+IGNhY2hlIGxp
bmUgd29uJ3QgYmUgcG9sbHV0ZWQgYnkgdGVtcG9yYXJ5IGJ1ZmZlcnMgZWl0aGVyKSwgaW4gZmFj
dCwKPiBFUk9GUyBzdXBwb3J0cyB0aGUgaHliaXJkIHdheS4KPiAKPj4KPj4gV29uJ3QgdGhlIHBs
YWludGV4dCBvdmVyLXdyaXRlIHRoZSBjb21wcmVzc2VkIGRhdGEgaGFsZndheT8KPiAKPiBQZXJz
b25hbGx5IEknbSB2ZXJ5IGZhbWlsaWFyIHdpdGggTFo0LCBMWk1BLCBhbmQgREVGTEFURQo+IGFs
Z29yaXRobSBpbnRlcm5hbHMsIGFuZCBJIGFsc28gaGF2ZSBleHBlcmllbmNlIHRvIGJ1aWxkIExa
TUEsCj4gREVGTEFURSBjb21wcmVzc29ycy4KPiAKPiBJdCdzIHRvdGFsbHkgd29ya2FibGUgZm9y
IExaNCwgaW4gc2hvcnQgaXQgd2lsbCByZWFkIHRoZSBjb21wcmVzc2VkCj4gZGF0YSBhdCB0aGUg
ZW5kIG9mIHRoZSBkZWNvbXByZXNzZWQgYnVmZmVycywgYW5kIHRoZSBwcm9wZXIgbWFyZ2luCj4g
Y2FuIG1ha2UgdGhpcyBhbG1vc3QgYWx3YXlzIHN1Y2NlZWQuCgpJIGd1ZXNzIHRoYXQncyB3aHkg
YnRyZnMgY2FuIG5vdCBnbyB0aGF0IHdheS4KCkR1ZSB0byBkYXRhIENPVywgd2UncmUgdG90YWxs
eSBwb3NzaWJsZSB0byBoaXQgYSBjYXNlIHRoYXQgd2Ugb25seSB3YW50IAp0byByZWFkIG91dCBv
bmUgc2luZ2xlIHBsYWludGV4dCBibG9jayBmcm9tIGEgY29tcHJlc3NlZCBkYXRhIGV4dGVudCAK
KHRoZSBjb21wcmVzc2VkIHNpemUgY2FuIGV2ZW4gYmUgbGFyZ2VyIHRoYW4gb25lIGJsb2NrKS4K
CkluIHRoYXQgY2FzZSBzdWNoIGluLXBsYWNlIGRlY29tcHJlc3Npb24gd2lsbCBkZWZpbml0ZWx5
IG5vdCB3b3JrLgoKWy4uLl0KCj4+IEFsbCB0aGUgZGVjb21wcmVzc2lvbi9jb21wcmVzc2lvbiBy
b3V0aW5lcyBhbGwgc3VwcG9ydCBzd2FwcGluZyBpbnB1dC8gCj4+IG91dHB1dCBidWZmZXIgd2hl
biBvbmUgb2YgdGhlbSBpcyBmdWxsLgo+PiBTbyBrbWFwX2xvY2FsKCkgaXMgY29tcGxldGVseSBm
ZWFzaWJsZS4KPiAKPiBJIHRoaW5rIG9uZSBvZiB0aGUgYnRyZnMgc3VwcG9ydGVkIGFsZ29yaXRo
bSBMWk8gaXMgbm90LAoKSXQgaXMsIHRoZSB0cmlja3kgcGFydCBpcyBidHJmcyBpcyBpbXBsZW1l
bnRpbmcgaXRzIG93biBUTFYgc3RydWN0dXJlIApmb3IgTFpPIGNvbXByZXNzaW9uLgoKQW5kIGJ0
cmZzIGRvZXMgZXh0cmEgcGFkZGluZyB0byBlbnN1cmUgbm8gVExWIChjb21wcmVzc2VkIGRhdGEg
KyBoZWFkZXIpIApzdHJ1Y3R1cmUgd2lsbCBjcm9zcyBibG9jayBib3VuZGFyeS4KClNvIGJ0cmZz
IExaTyBjb21wcmVzc2lvbiBpcyBzdGlsbCBhYmxlIHRvIHN3YXAgb3V0IGlucHV0L291dHB1dCBo
YWxmd2F5LCAKbW9zdGx5IGR1ZSB0byB0aGUgYnRyZnMnIHNwZWNpZmljIGRlc2lnbi4KClRoYW5r
cywKUXUKCj4gYmVjYXVzZSB0aGUKPiBmYXN0ZXN0IExaNzctZmFtaWx5IGFsZ29yaXRobXMgbGlr
ZSBMWjQsIExaTyBqdXN0IG9wZXJhdGVzIG9uIHZpcnR1YWwKPiBjb25zZWN1dGl2ZSBidWZmZXJz
IGFuZCB0cmVhdCB0aGUgZGVjb21wcmVzc2VkIGJ1ZmZlciBhcyBMWjc3IHNsaWRpbmcKPiB3aW5k
b3cuCj4gCj4gU28gdGhhdCBlaXRoZXIgeW91IG5lZWQgdG8gYWxsb2NhdGUgYW5vdGhlciB0ZW1w
b3JhcnkgY29uc2VjdXRpdmUKPiBidWZmZXIgKEkgYmVsaWV2ZSB0aGF0IGlzIHdoYXQgYnRyZnMg
ZG9lcykgb3IgdXNlIHZtYXAoKSBhcHByb2FjaCwKPiBFUk9GUyBpcyBpbnRlcmVzdGVkIGluIHRo
ZSB2bWFwKCkgb25lLgo+IAo+IFRoYW5rcywKPiBHYW8gWGlhbmcKPiAKPj4KPj4gVGhhbmtzLAo+
PiBRdQo+Pgo+Pj4KPj4+IFNvLCBteSBwcm9wb3NhbCBpcyB0aGF0IGZpbGVzeXN0ZW1zIHRlbGwg
dGhlIHBhZ2UgY2FjaGUgdGhhdCB0aGVpciAKPj4+IG1pbmltdW0KPj4+IGZvbGlvIHNpemUgaXMg
dGhlIGNvbXByZXNzaW9uIGJsb2NrIHNpemUuwqAgVGhhdCBzZWVtcyB0byBiZSBhcm91bmQgNjRr
LAo+Pj4gc28gbm90IGFuIHVucmVhc29uYWJsZSBtaW5pbXVtIGFsbG9jYXRpb24gc2l6ZS7CoCBU
aGF0IHJlbW92ZXMgYWxsIHRoZQo+Pj4gZXh0cmEgY29kZSBpbiBmaWxlc3lzdGVtcyB0byBhbGxv
Y2F0ZSBleHRyYSBtZW1vcnkgaW4gdGhlIHBhZ2UgY2FjaGUuCj4+PiBJdCBtZWFucyB3ZSBkb24n
dCBhdHRlbXB0IHRvIHRyYWNrIGRpcnRpbmVzcyBhdCBhIHN1Yi1mb2xpbyBncmFudWxhcml0eQo+
Pj4gKHRoZXJlJ3Mgbm8gcG9pbnQsIHdlIGhhdmUgdG8gd3JpdGUgYmFjayB0aGUgZW50aXJlIGNv
bXByZXNzZWQgYm9jawo+Pj4gYXQgb25jZSkuwqAgV2UgYWxzbyBnZXQgYSBzaW5nbGUgdmlydHVh
bGx5IGNvbnRpZ3VvdXMgYmxvY2sgLi4uIGlmIHlvdSdyZQo+Pj4gd2lsbGluZyB0byBkaXRjaCBI
SUdITUVNIHN1cHBvcnQuwqAgT3IgdGhlcmUncyBhIHByb3Bvc2FsIHRvIGludHJvZHVjZSBhCj4+
PiB2bWFwX2ZpbGUoKSB3aGljaCB3b3VsZCBnaXZlIHVzIGEgdmlydHVhbGx5IGNvbnRpZ3VvdXMg
Y2h1bmsgb2YgbWVtb3J5Cj4+PiAoYW5kIGNvdWxkIGJlIHRyaXZpYWxseSB0dXJuZWQgaW50byBh
IG5vb3AgZm9yIHRoZSBjYXNlIG9mIHRyeWluZyB0bwo+Pj4gdm1hcCBhIHNpbmdsZSBsYXJnZSBm
b2xpbykuCj4+Pgo+Pj4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
