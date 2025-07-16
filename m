Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD87C83F17
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jul 2025 00:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mJ2LWnTTjiaBlxwtJBWWB54AwIqA/vUfW0Lro2JS9Y=; b=bd6gt7xS8xgpT/3pMPnmG/46EF
	qvyu8ugWxpT2ghWRrp0gbFkYjNS4UwudF8hjyfb0qQxXduUC1BEYTElIiqpKZ/22brIW8kLUp+uIk
	3wpVfAlfBS8m9hbsgZEizUNN5tf7JfmRw/ZGq6mND+5g+KhSlGuTo79zFX8aUHD6fknyMgSd9lxq1
	brLS3LLJNv5Te3+zXKXfjC8tx1xNuDtqYItPiEomzOFAfrWzP9yWuys/2iUWR5lHIwKVC8seUmkvn
	B4vOH1ir7/UFORuYghYmh6DUFF0uLPIZZD1zoiUGh6rS/XUY2xlInK40oQDjLF07m2vuryZhsBuA8
	hGQTLZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubqSW-00000006W0N-2Zao;
	Wed, 16 Jul 2025 00:57:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubqST-00000006VzO-3REp
	for linux-mtd@lists.infradead.org;
	Wed, 16 Jul 2025 00:57:19 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a54690d369so4900287f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 15 Jul 2025 17:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752627436; x=1753232236; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KacZvyW/+D5c+CkKTBWmhK+loj5fkAU60jNANOTBA8M=;
        b=Ej4E2Shg+qUIONwbyARXZGKTB4xBKGLJrg/u/oZ1DpaMmIpDNEaVUQbLo4RTS9AjZ2
         SMIqyEddalcEah44CcrN5YsvN1uOju4a7ahkigcbOt9mhmY58yokDCX04ZxSXXd/UQMK
         O4nzbUZFOls7bBZyMDosSQBNL2jADW1qhNSxn78KTzsONkle7PEdcGXpspEOan8mHv1L
         xNgEDYw50QLn0Cp3u1/WaC0lyDTASxP1S4qYlu+3j4palIDq2PUKZ1BWufjwgjH0tZsi
         /turVN7nkTPURqYJcmNYXwq3jxV4Gahb0hYYuJjXzYUtH9iBOB4Go3SS56ch1kX5S8+F
         wLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752627436; x=1753232236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KacZvyW/+D5c+CkKTBWmhK+loj5fkAU60jNANOTBA8M=;
        b=CU3wzLkC58mPbMxg0o/+fwzalWILnWu3+DILeDjgywrwURD0zkZ7XRuIMPc46b5bMh
         tYepvcukwgQ4AWNAYLLU+mykx8pf+pla9D2KwJcdAW0x3hfhjDmfppL7hz4GlRfbDkup
         sr2otfoz8nMrXWs+tmkgkLXgYyC1ep/Ce50F/6VWzgzuLXuVZq1X6qbZtBvQ8j/AUzjd
         sqjvDmX04NEgubtVjLY0YrP5VxerjfKElLtnrNT2BVe38fEYzcXev80+Yti2rrISvO5q
         PWKKHuBHzc22u8cn+AaXnYLXmYLa2UUdEISInHCkV/7AodULHLWzZYKp7eCItmZmE46H
         qjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKujHcvWcEOirQEbesMW8vFeRMDDjuMYWnIvNW0SKNjnTH4eNxUMXO9kEBCUFOP1y0UodiHMiVU04=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz61ro2fnCsR+V+5tWhAenDVCr4DyBC3ohkyi+JYzZFzBHnDQ0P
	4iTCHcuRFyejN3pi+3FjzgfbX/gbsHKyjTWehh/GOkeKgXCWGjGu8yanoquQo8W5u10=
X-Gm-Gg: ASbGncuPvO13sWJihYWrqLzqu0VaA3B/RmTdsNE2OPWDLzJKecju+sWT1/aPXdxjLIq
	pliNoEA7rbfhzj2RwXoXjmXKlAwSKSu4rvsL1b5rK6ncdCb+tCDKJdNMcb0br9mNE9JHC0gLnzJ
	xRQPf1HwjSkfL90kHwB5rYhueYdvPM62LP2pl3CZLcd7L0EWuPxNiEP1iMymta54UxaGtJVXaeJ
	HmcxsymDB806vcR/4jAKGOGm3KraC3vG70srZzotC6bqYwbSbr3CA+6MAjSH5jJr3Ei5GcRyg3q
	ZuMUWZgA+fcmaADsIgv55iC/2O2ZRDK2mXUWvVS+Yo7WkQXWQI/B0Mt8xn68ELHFJSUsU1iRIgd
	T44LtgnI75mV8eCsZY2+Z8nknI5qW/x6g7AHOsQtV/Kw5qaMDUw==
X-Google-Smtp-Source: AGHT+IGmM0n20dxhtQ6vMPJL8jS+hYaNOO5Rpe4CXLe7RvspyCFw9ZMsMSHoEA6/McxI5CdSoNbUKg==
X-Received: by 2002:a05:6000:3ce:b0:3b6:d6d:dd2 with SMTP id ffacd0b85a97d-3b60e4cb532mr348001f8f.25.1752627436011;
        Tue, 15 Jul 2025 17:57:16 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4332cdcsm114942995ad.145.2025.07.15.17.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 17:57:15 -0700 (PDT)
Message-ID: <2806a1f3-3861-49df-afd4-f7ac0beae43c@suse.com>
Date: Wed, 16 Jul 2025 10:27:05 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Compressed files & the page cache
To: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>,
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
In-Reply-To: <aHa8ylTh0DGEQklt@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_175717_866334_D47E550E 
X-CRM114-Status: GOOD (  27.03  )
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

CgrlnKggMjAyNS83LzE2IDA2OjEwLCBNYXR0aGV3IFdpbGNveCDlhpnpgZM6Cj4gSSd2ZSBzdGFy
dGVkIGxvb2tpbmcgYXQgaG93IHRoZSBwYWdlIGNhY2hlIGNhbiBoZWxwIGZpbGVzeXN0ZW1zIGhh
bmRsZQo+IGNvbXByZXNzZWQgZGF0YSBiZXR0ZXIuICBGZWVkYmFjayB3b3VsZCBiZSBhcHByZWNp
YXRlZCEgIEknbGwgcHJvYmFibHkKPiBzYXkgYSBmZXcgdGhpbmdzIHdoaWNoIGFyZSBvYnZpb3Vz
IHRvIGFueW9uZSB3aG8ga25vd3MgaG93IGNvbXByZXNzZWQKPiBmaWxlcyB3b3JrLCBidXQgSSdt
IHRyeWluZyB0byBiZSBleHBsaWNpdCBhYm91dCBteSBhc3N1bXB0aW9ucy4KPiAKPiBGaXJzdCwg
SSBiZWxpZXZlIHRoYXQgYWxsIGZpbGVzeXN0ZW1zIHdvcmsgYnkgY29tcHJlc3NpbmcgZml4ZWQt
c2l6ZQo+IHBsYWludGV4dCBpbnRvIHZhcmlhYmxlLXNpemVkIGNvbXByZXNzZWQgYmxvY2tzLiAg
VGhpcyB3b3VsZCBiZSBhIGdvb2QKPiBwb2ludCB0byBzdG9wIHJlYWRpbmcgYW5kIHRlbGwgbWUg
YWJvdXQgY291bnRlcmV4YW1wbGVzLgoKSSBkb24ndCB0aGluayBpdCdzIHRoZSBjYXNlIGZvciBi
dHJmcywgdW5sZXNzIHlvdXIgImZpeGVkLXNpemUiIG1lYW5zIApibG9jayBzaXplLCBhbmQgaW4g
dGhhdCBjYXNlLCBhIHNpbmdsZSBibG9jayB3b24ndCBiZSBjb21wcmVzc2VkIGF0IGFsbC4uLgoK
SW4gYnRyZnMsIHdlIHN1cHBvcnQgY29tcHJlc3NpbmcgdGhlIHBsYWludGV4dCBmcm9tIDIgYmxv
Y2tzIHRvIDEyOEtpQiAKKHRoZSAxMjhLaUIgbGltaXQgaXMgYW4gYXJ0aWZpY2lhbCBvbmUpLgoK
PiAKPiAgRnJvbSB3aGF0IEkndmUgYmVlbiByZWFkaW5nIGluIGFsbCB5b3VyIGZpbGVzeXN0ZW1z
IGlzIHRoYXQgeW91IHdhbnQgdG8KPiBhbGxvY2F0ZSBleHRyYSBwYWdlcyBpbiB0aGUgcGFnZSBj
YWNoZSBpbiBvcmRlciB0byBzdG9yZSB0aGUgZXhjZXNzIGRhdGEKPiByZXRyaWV2ZWQgYWxvbmcg
d2l0aCB0aGUgcGFnZSB0aGF0IHlvdSdyZSBhY3R1YWxseSB0cnlpbmcgdG8gcmVhZC4gIFRoYXQn
cwo+IGJlY2F1c2UgY29tcHJlc3NpbmcgaW4gbGFyZ2VyIGNodW5rcyBsZWFkcyB0byBiZXR0ZXIg
Y29tcHJlc3Npb24uCgpXZSBkb24ndC4gV2UganVzdCBncmFiIGRpcnR5IHBhZ2VzIHVwIHRvIDEy
OEtpQiwgYW5kIHdlIGNhbiBoYW5kbGUgCnNtYWxsZXIgcmFuZ2VzLCBhcyBzbWFsbCBhcyB0d28g
YmxvY2tzLgoKPiAKPiBUaGVyZSdzIHNvbWUgZGlzY3JlcGFuY3kgYmV0d2VlbiBmaWxlc3lzdGVt
cyB3aGV0aGVyIHlvdSBuZWVkIHNjcmF0Y2gKPiBzcGFjZSBmb3IgZGVjb21wcmVzc2lvbi4gIFNv
bWUgZmlsZXN5c3RlbXMgcmVhZCB0aGUgY29tcHJlc3NlZCBkYXRhIGludG8KPiB0aGUgcGFnZWNh
Y2hlIGFuZCBkZWNvbXByZXNzIGluLXBsYWNlLCB3aGlsZSBvdGhlciBmaWxlc3lzdGVtcyByZWFk
IHRoZQo+IGNvbXByZXNzZWQgZGF0YSBpbnRvIHNjcmF0Y2ggcGFnZXMgYW5kIGRlY29tcHJlc3Mg
aW50byB0aGUgcGFnZSBjYWNoZS4KCkJ0cmZzIGdvZXMgdGhlIHNjcmF0Y2ggcGFnZXMgd2F5LiBE
ZWNvbXByZXNzaW9uIGluLXBsYWNlIGxvb2tzIGEgbGl0dGxlIAp0cmlja3kgdG8gbWUuIEUuZy4g
d2hhdCBpZiB0aGVyZSBpcyBvbmx5IG9uZSBjb21wcmVzc2VkIHBhZ2UsIGFuZCBpdCAKZGVjb21w
cmVzc2VkIHRvIDQgcGFnZXMuCgpXb24ndCB0aGUgcGxhaW50ZXh0IG92ZXItd3JpdGUgdGhlIGNv
bXByZXNzZWQgZGF0YSBoYWxmd2F5PwoKPiAKPiBUaGVyZSBhbHNvIHNlZW1zIHRvIGJlIHNvbWUg
ZGlzY3JlcGFuY3kgYmV0d2VlbiBmaWxlc3lzdGVtcyB3aGV0aGVyIHRoZQo+IGRlY29tcHJlc3Np
b24gaW52b2x2ZXMgdm1hcCgpIG9mIGFsbCB0aGUgbWVtb3J5IGFsbG9jYXRlZCBvciB3aGV0aGVy
IHRoZQo+IGRlY29tcHJlc3Npb24gcm91dGluZXMgY2FuIGhhbmRsZSBkb2luZyBrbWFwX2xvY2Fs
KCkgb24gaW5kaXZpZHVhbCBwYWdlcy4KCkJ0cmZzIGlzIHRoZSBsYXRlciBjYXNlLgoKQWxsIHRo
ZSBkZWNvbXByZXNzaW9uL2NvbXByZXNzaW9uIHJvdXRpbmVzIGFsbCBzdXBwb3J0IHN3YXBwaW5n
IAppbnB1dC9vdXRwdXQgYnVmZmVyIHdoZW4gb25lIG9mIHRoZW0gaXMgZnVsbC4KU28ga21hcF9s
b2NhbCgpIGlzIGNvbXBsZXRlbHkgZmVhc2libGUuCgpUaGFua3MsClF1Cgo+IAo+IFNvLCBteSBw
cm9wb3NhbCBpcyB0aGF0IGZpbGVzeXN0ZW1zIHRlbGwgdGhlIHBhZ2UgY2FjaGUgdGhhdCB0aGVp
ciBtaW5pbXVtCj4gZm9saW8gc2l6ZSBpcyB0aGUgY29tcHJlc3Npb24gYmxvY2sgc2l6ZS4gIFRo
YXQgc2VlbXMgdG8gYmUgYXJvdW5kIDY0aywKPiBzbyBub3QgYW4gdW5yZWFzb25hYmxlIG1pbmlt
dW0gYWxsb2NhdGlvbiBzaXplLiAgVGhhdCByZW1vdmVzIGFsbCB0aGUKPiBleHRyYSBjb2RlIGlu
IGZpbGVzeXN0ZW1zIHRvIGFsbG9jYXRlIGV4dHJhIG1lbW9yeSBpbiB0aGUgcGFnZSBjYWNoZS4K
PiBJdCBtZWFucyB3ZSBkb24ndCBhdHRlbXB0IHRvIHRyYWNrIGRpcnRpbmVzcyBhdCBhIHN1Yi1m
b2xpbyBncmFudWxhcml0eQo+ICh0aGVyZSdzIG5vIHBvaW50LCB3ZSBoYXZlIHRvIHdyaXRlIGJh
Y2sgdGhlIGVudGlyZSBjb21wcmVzc2VkIGJvY2sKPiBhdCBvbmNlKS4gIFdlIGFsc28gZ2V0IGEg
c2luZ2xlIHZpcnR1YWxseSBjb250aWd1b3VzIGJsb2NrIC4uLiBpZiB5b3UncmUKPiB3aWxsaW5n
IHRvIGRpdGNoIEhJR0hNRU0gc3VwcG9ydC4gIE9yIHRoZXJlJ3MgYSBwcm9wb3NhbCB0byBpbnRy
b2R1Y2UgYQo+IHZtYXBfZmlsZSgpIHdoaWNoIHdvdWxkIGdpdmUgdXMgYSB2aXJ0dWFsbHkgY29u
dGlndW91cyBjaHVuayBvZiBtZW1vcnkKPiAoYW5kIGNvdWxkIGJlIHRyaXZpYWxseSB0dXJuZWQg
aW50byBhIG5vb3AgZm9yIHRoZSBjYXNlIG9mIHRyeWluZyB0bwo+IHZtYXAgYSBzaW5nbGUgbGFy
Z2UgZm9saW8pLgo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
