Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F50606A326
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 22:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dSNeF/F9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=f98XGcH8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8GBliVcalj8zo9G96LlpDKlyWqJ6fiS+LzNN7zBumCw=; b=dSNeF/F9K4v0rbimBG4D5ZsHnA
	0qotHeCFTQ+SjOetIQpf13YmUJ0TvpCtgXtcj4TTEfnPzgoVanOcZ+/VPpXRFznDY96qCgnAfljW1
	VCyQjF6LRp2zb6n8ef/XeNx5Q3zKAoEteNsA1CgpjQjtVOfZq9z0eUNnHUjNzHaowAyjH9neZtXPE
	M7NmD4edU+kOkMXjVU4vlr4mCmRNjzqaUzXSsG/EFpPr9/2MI29OWmcgv2xNNqTtnYwT0DBCwCReQ
	lysFR6ITusn0ACui+SP8KKJbwFmhQfpwa7uAJx7O1/9pEqLUVw9EeK5mzuNiPJ1yBNpx+870lrr7C
	0q16BwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuk5-00000005CaH-2K1y;
	Tue, 10 Nov 2026 22:55:05 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuk3-00000005CYw-1pPK
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 22:55:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so15284075e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2026 14:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794351301; x=1794956101; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLay0fAaS8K8zpYlT5J4F/CgngIHcMA7Bk+zXI74j1E=;
        b=f98XGcH8Uut3HQqHaV9/LzA+WQ+HXsZ/wTv+8/F2k7yiIXFjoIw+rDY4EoG+TH55Et
         zXiq1rqnLbUXsDuqoAsTwa+NGWhMfd71dedIRVSBSJM8QGeUxX1Qf29ACRU6hIzMMYTo
         kC3Pp68x3lwVTFOwNtb3VGTZgiBpDGVxyfY8vv9jA3qRkveEL8k0dNKXEFr8titH39Us
         42g9voKGY/5eKcEW6ufuzdzM8z/lzF896OPbwN5oIemKPY53zmBIXHXQHw5AmWqi4AtV
         2yGUJ1+ZI5oeOYB7HB5jQLlLcOBFeYWyMKR6co2DghKCN6EFOFDlXFrQ1ay4cxnrwRVJ
         aBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351301; x=1794956101;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLay0fAaS8K8zpYlT5J4F/CgngIHcMA7Bk+zXI74j1E=;
        b=OJHTKXYPVdxdLsVJfy0e6TGwC5AR21FsuJhmu5Dc4//OY0F3vMQ8brAeAQ4/skj+fN
         TFTyugZ09zLhzztwPQLf360Aqnm9jcl5V8VP9GhXbiNG7XU7W10/zjD1BsxRIyT7tS26
         7OSdEmUL7XSbpCiBupvxEN5MxCp+G3WpT+M2RjkW7yrIO4MrJ6GNPGs5sR+QV+S2fHvp
         lITKmJ56gMrnZjVyWyZBoyEAVe8Rw4vgu3MklwLYsePKfUaER3VgPUzlgTIIoECjKLbL
         bmSzWOZWACMlZfs5lSszuzeL6B5CZT/w+5Mt+Kw3rwniHKkN/FnhM1BAdhB/0AMH26C9
         lZ6g==
X-Forwarded-Encrypted: i=1; AL+hErGlMwaBzcxIjj794xRzVQgXR3e+YnrQAoc/NV1a+lxBLzdrzOXWDt+OvJ8nRmpoybrepURJTVCgkuk=@lists.infradead.org
X-Gm-Message-State: APuU4Z8HbjiGjhk7euvSHxxDvnpm7ifbfmwVZlLh0u6oq7JFRv14gjki
	RPlks94/dOVcKBrJI6c+4+OYgKM1ieRgKPxmVsQrJIFLhVnsto61WSaruu3NBqSZ/tY=
X-Gm-Gg: AYBFou0Y7tnvDNKKgi8zjQgEusejC0uTvx8Xm/PVK4HCwlB413S83U1yJx+eGJA5mty
	0Wt3F2acH4tr1PkNxBMYYEP21RqusULqwFPxp/imXCdcHeGTZTuzyxm6+n7lzlKUE0mr+bt93pg
	/8TG7S8b9XTjKuqSbIOBOF60eKQI1Ptx5C+SE86UugqoXArXycsvBJRklshnI4ZuX4rGLvgLh/R
	jafL8eQ1oxNiX2VVIaLEFGFQop7moQpX81LGKWt99VExu82dTnq0IHzBcdvNAI2Kcbdb/GivA+J
	tOyQ4xBwigqnd5FMIPihP+n9E53saMb7AbVV6g6fOc5PWcLlzOLRZa+WDBAKyF3Tg35UoWP4wRh
	w3oaj2un1qcgqzfIlzdhk1CL2ev/LTHiU++fS6h+rnaxGkLN2nsX0UWUhj4uyUMNnwEpO/xZglD
	cKNYZjki8+p4iTRTFn9Vr92lBGtTzoF3zMa8j4UtsLeLp4tQmvXoXHB2QjkUsr5F5pcHv1iy+SE
	8Hi9FT5UnqLDC0jmljFrRLAkg2F/mD4TonnE46+y+NsOzW5nZEj0wlv1Kbo+NYs2dORzM4CxX5Q
	wQhM40Oq213gvqb0V6v7pQ==
X-Received: by 2002:a05:600c:3c87:b0:4b8:fdd8:f2c9 with SMTP id 5b1f17b1804b1-4ba093c1c0bmr7546615e9.35.1794351300895;
        Tue, 10 Nov 2026 14:55:00 -0800 (PST)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e582sm1412409b3a.39.2026.11.10.14.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 14:54:59 -0800 (PST)
Message-ID: <c5c47eed-c927-4ee5-9841-7631674bf6a8@suse.com>
Date: Wed, 11 Nov 2026 09:24:52 +1030
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/34] btrfs: check BTRFS_FS_STATE_RO instead of
 SB_RDONLY at runtime
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org,
 ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev,
 linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-xfs@vger.kernel.org
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-23-2f44f64f0b66@kernel.org>
 <c88e4e9c-6b86-4fbb-94bf-909522badf83@suse.com>
 <20261110-kursniveau-zeltlager-quintessenz-36b26debabe3@brauner>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <20261110-kursniveau-zeltlager-quintessenz-36b26debabe3@brauner>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_145503_506426_5C071664 
X-CRM114-Status: GOOD (  13.16  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgrlnKggMjAyNi8xMS8xMSAwODoyNCwgQ2hyaXN0aWFuIEJyYXVuZXIg5YaZ6YGTOgo+IE9uIFN1
biwgTm92IDAxLCAyMDI2IGF0IDAxOjI2OjIyUE0gKzEwMzAsIFF1IFdlbnJ1byB3cm90ZToKPj4g
SSBsb3ZlIHRoZSBpZGVhLiBUaGlzIHJlbWluZHMgbWUgZXhhY3RseSB3aHkgZm9yIGJ0cmZzX2Zv
cmNlX3NodXRkb3duKCksCj4+IHdlIGhhdmUgdG8gbWFudWFsbHkgc2V0IHRoZSBmcyBlcnJvciB3
aXRob3V0IG1hcmtpbmcgdGhlIGZzIFJPLCB0byBhdm9pZAo+PiBleGFjdGx5IHRoZSBzYW1lIHBy
b2JsZW0uCj4+Cj4+IFdpdGggdGhhdCBzYWlkLCBjYW4geW91IGFsc28gYSBzZXRfYml0KCkgY2Fs
bCBpbiBidHJmc19mb3JjZV9zaHV0ZG93bigpCj4+IHRvIGFsc28gc2V0IHRoYXQgZmxhZyBpbnN0
ZWFkIG9mIHRoZSBleHN0aW5nIHNldHRpbmcgZnNfaW5mby0+ZnNfZXJyb3I/Cj4gCj4gSSB0aGlu
ayBzby4gSSdkIHNldCBCVFJGU19GU19TVEFURV9STyBpbiBhZGRpdGlvbiB0byBmc19lcnJvciB0
aG91Z2guCj4gc3RhcnRfdHJhbnNhY3Rpb24oKSwgam9pbl90cmFuc2FjdGlvbigpIGFuZCBidHJm
c19yZW1vdW50X3J3KCkga2V5IG9mZgo+IEJUUkZTX0ZTX0VSUk9SKCkuCj4gCj4gTm90ZSB0aGF0
IHRoaXMgY2hhbmdlcyBzb21lIGVycm9yIGNvZGVzIGFmdGVyIGEgc2h1dGRvd24uCj4gYnRyZnNf
cGVybWlzc2lvbigpIHJldHVybnMgRVJPRlMgZm9yIE1BWV9XUklURSBvbmNlIGJ0cmZzX2ZzX3Jk
b25seSgpIGlzCj4gdHJ1ZSBzbyBvcGVuaW5nIGEgZmlsZSBmb3Igd3JpdGluZyBmYWlscyB3aXRo
IEVST0ZTIGluc3RlYWQgb2YgdGhlIEVJTwo+IGZyb20gYnRyZnNfZmlsZV9vcGVuKCkuCgpUaGF0
IHNob3VsZCBiZSBmaW5lLiBBIGxvdCBvZiBvdGhlciBjYWxsIHNpdGVzIGFsc28gcmV0dXJuIEVS
T0ZTIGluc3RlYWQgCm9mIEVJTyBvbiBhIGZzIHdpdGggYWJvcnRlZCB0cmFuc2FjdGlvbi4KCkFu
ZCBJIHRoaW5rIGZvciBmcyBzaHV0IGRvd24sIEVST0ZTIG9yIEVJTyBpcyByZWFsbHkgdGhlIGxh
c3QgdGltZSBlbmQgCnVzZXJzIHNob3VsZCBjYXJlLgoKVGhhbmtzLApRdQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
