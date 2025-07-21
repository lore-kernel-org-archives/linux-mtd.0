Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8794CC83F1A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jul 2025 00:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G0SBIterMDPAZxF7YJ3NgVd2YYzjMlLd+1S3ytYO/CQ=; b=ZGA1WCmMqerF+b
	yYIGNZ0lGkJp0g/4VHt4nF5UGTTHNWLkdPbxTuKeW5TDBrmnmTAX1yy7D5P+y/zgkLYnVP8HrQnNl
	Syu4jEbms1i0KBmPVxboezDppjSWn5gczN5OXSKsLzPRsmYYaLxXlHm+JksHusf8DwbCR0MpM1mAK
	59ioXhsMWn/UMyrmONk+cvSuFrjv+U1ldUxqZygDPzA1DHutOPpvycL3U4wH7Wd/d3cdXkVmPProm
	d2Tu0ik5HtbHt4oB50mV2d/hD3/vAx1BLmm7TQys7mc+Y4g/fzjcU5cZwnesr/bobqCoTYFm4QZZp
	uKxO1NP2wgJwIDrrkoNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udedT-0000000FtIS-1yGC;
	Mon, 21 Jul 2025 00:44:07 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udedQ-0000000FtHj-1qqV
	for linux-mtd@lists.infradead.org;
	Mon, 21 Jul 2025 00:44:05 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-8815049d0a8so2062265241.2
        for <linux-mtd@lists.infradead.org>; Sun, 20 Jul 2025 17:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753058643; x=1753663443; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtTXofz3YZU8ZHZgSXsRm5LIUyeVOephgcfaxbmgBHg=;
        b=WBjTbBlHtLEN4WDGTgCLU6GUezIua6za/icDlSWAhspyrzLJV3xK/6Lfi5kjmeT63/
         S1sbZYw0XN0whhj8A7Jvv3b6oRt0elJ9WIhfw2rvqPFximleJnssMouV0rRwoTWUDYJw
         E4ts5yVnPORISI/EQH8wrcafEwJF7Rapq4OfqYuWwKy7dBWC7g3UvLTPpgk8LlQspF0K
         +PFcSGocauIvf+hKjoGZfBVCWUMoq/h59Q0vl/fix/I/7zV09ThvcKMAcsIxdWuWp9M5
         ISp063XG78cV68t07RtXwj1GtSGvQwX+/8mbM/mrBm4+AwLwrGWID9LAJbUGmaIOEQLP
         IC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753058643; x=1753663443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CtTXofz3YZU8ZHZgSXsRm5LIUyeVOephgcfaxbmgBHg=;
        b=GCT6tCDId59P3ab4nkwGCoZAejGx7GnpLkEA+A6jakjO5KsQNEDs1xn1oiLzcQhmcA
         HKy5eVlRb++BwXPTL8akr0eMu2W51WyqknjXeDHTLAdXYVMLO8QDnmgRjvKEcKaaJ5HW
         4zRmfs3SqmOUnysThLe2Uwi/iR9uEXOhfhTrfWCJB64yAIyujREkFWotCqB5IJCRiMCU
         htiVFH+ETUlh/oPIjyrMtpqbBgqw8UyoD2Mr7YS+IBac79nbNY3b430cGNIrayHHHXx4
         SGd4EWdBfyZQDU6EMCqkAjCo/qkBLdlYew4v/SHQ+lu+H0q/4mSIM3820QouCduq0d0X
         Nb0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjKMMfwn2a7xDqXM91948jNnpG61KxtbgElxxeZsxLKbYczrDFccnUNiKnehCkzsJM9U4+4e1T1aQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKHgKBqHI4iLdwRM+QtHaX7vCtCSwSwNrqIOXMgPqu1zFpTOxh
	wBrj2fve49x2StAa3r6A1LoD47XtNg+5ek+QjY1MKY+B1DyByqdTrGiUrjDpoIPXqn5jwVAcNjX
	0KI0EIt2vgrS6SqfhjLSTyLipkDQp5Bw=
X-Gm-Gg: ASbGncsvrjG/TVQnCSa/GKP/F7Q9H4j3uvA4HOsf8UTmI0khQxn92LsBrZVllr+I4Mm
	YK5yWgn/CPA+uCUG/Eku2oqlUYJr/vnZHuewV0/4TmkPkNgg3OcK/RUR8vAU/FvgDC5QmMUvrk0
	0cCt59BMjJONJZwp4Y/WssxEelOw5QNrO1cMBtpVnIR4u6wx1Ug3XbYi+CF75SBErw1GkxhElc4
	joraEo=
X-Google-Smtp-Source: AGHT+IGFRYyrS35WTP3i9Qe8TXmZslY6x6nCRq1gIJA/O9dosgodOs3uPYD7WXYU49lcEb5mCGS05wblqRqGVV/3QiI=
X-Received: by 2002:a05:6102:6316:10b0:4f9:6a91:cc95 with SMTP id
 ada2fe7eead31-4f96a91cec6mr5610145137.27.1753058643165; Sun, 20 Jul 2025
 17:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <aHa8ylTh0DGEQklt@casper.infradead.org> <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
In-Reply-To: <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 21 Jul 2025 08:43:51 +0800
X-Gm-Features: Ac12FXzyFbI4GjwypQZFYPLAZaBnNxcXr0fPPaJY0y3WB9_zSNUgD719YOscIeg
Message-ID: <CAGsJ_4wOeBwm2=1CbtZk+gHXe0wVyAYZuV-RZcV-wXe4Rj+h7g@mail.gmail.com>
Subject: Re: Compressed files & the page cache
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: Matthew Wilcox <willy@infradead.org>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
	David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, 
	Nicolas Pitre <nico@fluxnic.net>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	linux-erofs@lists.ozlabs.org, Jaegeuk Kim <jaegeuk@kernel.org>, 
	linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, 
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
	David Howells <dhowells@redhat.com>, netfs@lists.linux.dev, 
	Paulo Alcantara <pc@manguebit.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev, 
	Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, 
	Phillip Lougher <phillip@squashfs.org.uk>, Hailong Liu <hailong.liu@oppo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_174404_483136_E097D13A 
X-CRM114-Status: GOOD (  14.00  )
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

T24gV2VkLCBKdWwgMTYsIDIwMjUgYXQgNzozMuKAr0FNIEdhbyBYaWFuZyA8aHNpYW5na2FvQGxp
bnV4LmFsaWJhYmEuY29tPiB3cm90ZToKWy4uLl0KPgo+IEkgZG9uJ3Qgc2VlIHRoaXMgd2lsbCB3
b3JrIGZvciBFUk9GUyBiZWNhdXNlIEVST0ZTIGFsd2F5cyBzdXBwb3J0cwo+IHZhcmlhYmxlIHVu
Y29tcHJlc3NlZCBleHRlbnQgbGVuZ3RocyBhbmQgdGhhdCB3aWxsIGJyZWFrIHR5cGljYWwKPiBF
Uk9GUyB1c2UgY2FzZXMgYW5kIG9uLWRpc2sgZm9ybWF0cy4KPgo+IE90aGVyIHRoaW5nIGlzIHRo
YXQgbGFyZ2Ugb3JkZXIgZm9saW9zIChwaHlzaWNhbCBjb25zZWN1dGl2ZSkgd2lsbAo+IGNhdXNl
ZCAiaW5jcmVhc2UgdGhlIGxhdGVuY3kgb24gVVggdGFzayB3aXRoIGZpbGVtYXBfZmF1bHQoKSIK
PiBiZWNhdXNlIG9mIGhpZ2gtb3JkZXIgZGlyZWN0IHJlY2xhaW1zLCBzZWU6Cj4gaHR0cHM6Ly9h
bmRyb2lkLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2Mva2VybmVsL2NvbW1vbi8rLzM2OTIzMzMK
PiBzbyBFUk9GUyB3aWxsIG5vdCBzZXQgbWluLW9yZGVyIGFuZCBhbHdheXMgc3VwcG9ydCBvcmRl
ci0wIGZvbGlvcy4KClJlZ2FyZGluZyBIYWlsb25nJ3MgQW5kcm9pZCBob29rLCBpdCdzIGVzc2Vu
dGlhbGx5IGEgY29tcGxhaW50IGFib3V0CnRoZSBHRlAgbWFzayB1c2VkIHRvIGFsbG9jYXRlIGxh
cmdlIGZvbGlvcyBmb3IgZmlsZXMuIEknbSB3b25kZXJpbmcKd2h5IHRoZSBwYWdlIGNhY2hlIGhh
c24ndCBhZG9wdGVkIHRoZSBzYW1lIGFwcHJvYWNoIHRoYXQncyB1c2VkIGZvcgphbm9uIGxhcmdl
IGZvbGlvczoKCiAgICBnZnAgPSB2bWFfdGhwX2dmcF9tYXNrKHZtYSk7CgpBbm90aGVyIGNvbmNl
cm4gbWlnaHQgYmUgdGhhdCB0aGUgYWxsb2NhdGlvbiBvcmRlciBpcyB0b28gbGFyZ2UsCndoaWNo
IGNvdWxkIGxlYWQgdG8gbWVtb3J5IGZyYWdtZW50YXRpb24gYW5kIHdhc3RlLiBJZGVhbGx5LCB3
ZSdkCmhhdmUgInNtYWxsIiBsYXJnZSBmb2xpb3PigJRzYXksIHdpdGggb3JkZXIgPD0gNOKAlHRv
IHN0cmlrZSBhIGJldHRlcgpiYWxhbmNlLgoKPgo+IEkgdGhpbmsgRVJPRlMgd2lsbCBub3QgdXNl
IHRoaXMgbmV3IGFwcHJvYWNoLCB2bWFwKCkgaW50ZXJmYWNlIGlzCj4gYWx3YXlzIHRoZSBjYXNl
IGZvciB1cy4KPgo+IFRoYW5rcywKPiBHYW8gWGlhbmcKPgo+ID4KPgoKVGhhbmtzCkJhcnJ5Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
