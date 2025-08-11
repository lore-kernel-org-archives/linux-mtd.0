Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86016C87FDA
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 03:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMe8Q0P8xXxBLQxh3Ci5P2c8IDf6yG6VgxrR+NDd6is=; b=WF1i8/bgVMNzQH
	Nan1OvBacrChv6puBQcUygWrBVnmsfJXRvtkw2+AbP1FXEwGffzl1lF1nSScfRZ8bwD6UkSSLBipU
	DzKjqd9TqLmSNO6D8YXucQCNaYtOj9S/jIwoPGJ6hzZDvondQ4C3OzTXvXvAgikFcWHZr/4qUaafN
	AMjjRY+D62RMlQ+Ntl0UJIJIbF3yP/s5IV+dRuQjFtpTDiF65bW5KNb4aMFjvX1OqqXJ8ZZuL5ehS
	QzHzA64wm9UIE2vYnt0zLcJpcSG5ZuLVN4MKqxhMpVB5YRQMfbOnGwW/kZlA8bACQ/qtD1RH8mrFr
	x/A3Sj6DzQHZc9K09A7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulIp0-00000006OMM-1TmL;
	Mon, 11 Aug 2025 03:03:38 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulIoy-00000006OM1-1vse
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 03:03:37 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-31efc10bb03so3233295a91.0
        for <linux-mtd@lists.infradead.org>; Sun, 10 Aug 2025 20:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754881415; x=1755486215; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsATNO7vxMuxyYylZDIuowEvn5aJ6XccLf59i9aEyTY=;
        b=bDFcWKvJlYysknd2h2d6ysG60btRYwo6JdPcIPXd6k/DFP37fMYQnK6FlN51rrQ4A+
         59hg6h4tLjIty9YI4gq2IJCsShaTf53U/2qmfDBKu5VRNIYXBqIVMFWpPasRvHYzFFsR
         yMshnP8OSnHjFhLOixG9vZN5zSdas0UPYftBz32tsIrfLtK60GEVXjoIXGlDAt/MLPYT
         W6LVxRfQxwdxrRd5+mPApEmkytZltowFaheDU+p5Ceps+uVc8/ATryb9YIndiaPg3IP+
         PaW4RnMLHZ3AAu2lhN+2TQmRw2nZUQ7B26QnZRz7RGvm/E0yCJPms+psHCfQo3q5LUOx
         Nmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754881415; x=1755486215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rsATNO7vxMuxyYylZDIuowEvn5aJ6XccLf59i9aEyTY=;
        b=ahpiT4mrbDjUjqDw78OgOA/zTc1nvwfWbBG8P4IKqazcNbloGqkzSnd5qlWf3mlaOC
         4qORcd2s9eNkS+VOAYGNtZYBHw0B58KtKYDEKG0A4GBhb6IR6vMJ2pn4ZWwzT3/bNbjF
         FIC/OhoNAbuUgQ6rVkATB8Iamd4tWaiuvRXB9mn3wb3G5gLhe+VG4VQvP3a97RKpVbAe
         VgCe7iu2olAl4EcNOgLALDyED9AwfGa3eVCcuuMUo2DXVKXAhYuSYnQLtm+KYnsqitAo
         PisFM84EhGNK53aESEy7eQpYfyub2bmL5C7r9ygGmVltWdtAqBwFLpGPgdNCTQ22u10+
         DoCA==
X-Forwarded-Encrypted: i=1; AJvYcCWufRSjXGtW2YyYHI56nQD2ynlDjwCGBo1tNJFJFRXE3f247u9ueVtjip+fECF69XjHimZ8feCHJEA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwohHrAFRCnOEG4MKoKG1PBQsVFqeYrldc1opNDu43AsPvfTPX5
	zBfyc5J7emshciGzaZp31q8udDbKhXodeTZdHhoO8J7fTQxgkjaiJ4QyMx2q9t8QnDUWa4z1pov
	l6K1eAB/VTVvlt6ToHZiU4sz2gMJXDsgEpB/V
X-Gm-Gg: ASbGncsqaB82nSrJLEFATTKQsgMhcEqrx9Mgiqx4xQ6I4tB6t2AxpfYBBiQqRYZHcSH
	ezNF4NrmBYE3P15Y/hOJUrEQPEQXncRPkXjglWWjJiPutwxRdMKWu5J3rtgMl+t0O7d5B8sdc7G
	OhrT0kJaYXka7ohnHRSgTk1ktXzVFuT8pFuylzb77F22F5Qey6omg9xn+nei9AKR5F0FRQK0coy
	VICh10=
X-Google-Smtp-Source: AGHT+IHYv4HPwLaWAoIc23z+VO1nf1+EcK+dCdc0O8MvKoLhP9opU9gnjKgA4klmEdxO3ouanYg29RJ4Y0QMjiqbdEU=
X-Received: by 2002:a17:90b:5786:b0:315:9cae:bd8 with SMTP id
 98e67ed59e1d1-32183b4d95fmr13760150a91.23.1754881415361; Sun, 10 Aug 2025
 20:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250808095503.906244-1-linchengming884@gmail.com>
 <20250808095503.906244-3-linchengming884@gmail.com> <87zfca9kur.fsf@bootlin.com>
In-Reply-To: <87zfca9kur.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 11 Aug 2025 11:01:25 +0800
X-Gm-Features: Ac12FXztBa2kKDLSenS5JsM2SIpn-RB4gfFpR_F9raTQNRdao7XKxJAG8-pMJdA
Message-ID: <CAAyq3SZbPpVX_LyoYaHYhA3ZNeb0NYWQ4KC6-+uubB1GGCqZag@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nand: macronix: Add randomizer support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_200336_502970_F263C1E1 
X-CRM114-Status: GOOD (  14.63  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjXlubQ45pyIOOaXpSDpgLHkupQg5LiL5Y2INjoxOeWvq+mBk++8mgo+Cj4gT24gMDgvMDgv
MjAyNSBhdCAxNzo1NTowMyArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVuZ21pbmc4ODRAZ21h
aWwuY29tPiB3cm90ZToKPgo+ID4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBt
eGljLmNvbS50dz4KPiA+Cj4gPiBFbmFibGUgcmFuZG9taXplciBmdW5jdGlvbiBieSBzcGVjaWZp
YyBmbG93Y2hhcnQgdG8gc2V0IHRoZSBkZWZhdWx0IHZhbHVlCj4gPiBvZiBSQU5ERU4gdG8gMS4K
PiA+Cj4gPiBSYW5kb21pemVyIGludHJvZHVjZXMgdHdvIG5ldyBEVCBwcm9wZXJ0aWVzIGZvciBj
aGlsZCBub2RlcyB0byBjb25maWd1cmUKPiA+IHRoZSByYW5kb21pemVyIGZ1bmN0aW9uYWxpdHkg
YW5kIGNvdmVyYWdlIG9wdGlvbnMuCj4gPiAgLSBteGljLGVuYWJsZS1yYW5kb21pemVyLW90cDog
U3BlY2lmeSB3aGV0aGVyIHRvIGFjdGl2YXRlIHRoZSByYW5kb21pemVyCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZmVhdHVyZS4KPiA+ICAtIG14aWMscmFuZG9wdDogRGVmaW5l
IHRoZSByYW5kb21pemVyIGFyZWEgcGVyIHBhZ2UuCj4KPiBDYW4gd2UgY3JlYXRlIGEgZ2xvYmFs
IE5BTkQgRFQgcHJvcGVydHkgZm9yIHRoYXQ/IEVuYWJsaW5nIGEgcmFuZG9taXplcgo+IGlzIHF1
aXRlIGEgZ2VuZXJpYyBzdGVwLgo+Cj4gPiBUaGUgcGVuYWx0eSBvZiByYW5kb21pemVyIGFyZSBz
dWJwYWdlIGFjY2Vzc2VzIHByb2hpYml0ZWQgYW5kIG1vcmUgdGltZQo+ID4gcGVyaW9kIGlzIG5l
ZWRlZCBpbiBwcm9ncmFtIG9wZXJhdGlvbiBhbmQgZW50ZXJpbmcgZGVlcCBwb3dlci1kb3duIG1v
ZGUuCj4gPiBpLmUuLCB0UFJPRyAzMjB1cyB0byAzNjB1cyAocmFuZG9taXplciBlbmFibGVkKS4K
Pgo+IERvIHlvdSB3YW50IHRvIHNoYXJlIHdoYXQgaXMgdGhlIGFkZGVkIHZhbHVlIGluIHRlcm1z
IG9mIGxpZmV0aW1lIHRvCj4gZW5hYmxlIHRoZSByYW5kb21pemVyLCBnaXZlbiB0aGUgZHJhd2Jh
Y2tzIHdoaWNoIGFyZSBzaWduaWZpY2FudD8KClRoZSByYW5kb21pemVyIG1haW5seSB0YXJnZXRz
IGV4dHJlbWVseSB1bmJhbGFuY2VkIGRhdGEgcGF0dGVybnMsCndoaWNoIG1pZ2h0IHBvdGVudGlh
bGx5IGxlYWQgdG8gZGF0YSBlcnJvcnMuCgpQbGVhc2UgcmVmZXIgdG8gdGhlIGF0dGFjaGVkIGRv
Y3VtZW50OgpodHRwczovL3d3dy5teGljLmNvbS50dy9MaXN0cy9BcHBsaWNhdGlvbk5vdGUvQXR0
YWNobWVudHMvMjE1MS9BTjEwNTFWMS1UaGUlMjBJbnRyb2R1Y3Rpb24lMjBvZiUyMFJhbmRvbWl6
ZXIlMjBGZWF0dXJlJTIwb24lMjBNWDMweEZ4RzI4QURfTVgzNXhGeEcyNEFELnBkZgoKRmlndXJl
IDEgc2hvd3MgdGhhdCBjb250aW51b3VzbHkgcHJvZ3JhbW1pbmcgdG9vCm1hbnkgMHMgY2FuIHJl
c3VsdCBpbiBkYXRhIGVycm9ycy4KCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKVGhhbmtzLApDaGVu
ZyBNaW5nIExpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
