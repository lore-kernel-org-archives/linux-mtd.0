Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B601DC30658
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2024 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6l6GDlUupwtR7OPtjzHoaE5J+P6iGmv2914wTSweNQ=; b=vEkopaYxLgC575
	LGJ8SpG/PPqBL3IC0I+DgkQR30fpwbBoXUYxwY2T7Cqhs82/T95GP+8WGXZgHo2uAwwJ2beLaSc7A
	SNNyyr+lM3T/8zAmezeZYA/D/50KP+HtblExJAPguom3+5wpjwO2rEoQk6KjFOGKG5rqimklcYMub
	i7ZW32rTukjOyVbjWTkfLjDVEw8DPgC7RXVBUTct9/QTtgdAFgx2cFim6H2WiszllLzRgxzothdFU
	SVPYr5wCbDqGmeNJFpQLdFE5U+3R9Sxyrfy0fJk84Lb2YlnTOQ9JIFYaQEgY7xXSoLYGbYK/1tq0A
	YjEwPYlzEfP33ZRryQdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfVQ-0000000FV0F-2PTV;
	Fri, 05 Jul 2024 09:45:28 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfVN-0000000FUyV-3Dbb
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jul 2024 09:45:27 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-44639872fd4so10113961cf.0
        for <linux-mtd@lists.infradead.org>; Fri, 05 Jul 2024 02:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1720172724; x=1720777524; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Rzy58BjgHjiyyZeVrV9ikSb2EY+6r4Ekj6ulNAVaI0=;
        b=X6PfqDAyiPQJT72z1Nizh+1Ysx/QCSC7nD80YklLf+ZGnFyB+p5EcRhLtpLjwBwYNW
         R1fdZBh40WOAhfTaalfLET71ZzuHfcpBeo0MghJQhySVX+ip/SfCdlBJo1TRQYEjo2jE
         7cRAskcxGnxBv1nOzwF8KgMy18J8psFH2Cirg5vVcU5byb57jRfpiIgMt1E6pTdPp1C7
         MEZIYI3hTIEQpT/20PMqso/ac5HnYfXB/RYtbxFquxxaN9OraOguUBqyT/2IIh8kc1Jy
         et1LGUVKjc6CHcqm8Z5MPtZ3JAThmETDvtBLSxpHWp0AJ9f1XXgXJDS2KIExrBcY8oYo
         c9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720172724; x=1720777524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Rzy58BjgHjiyyZeVrV9ikSb2EY+6r4Ekj6ulNAVaI0=;
        b=SprZDKGmEJH0Ertiw6qImnrCnIjbUXer5CzOJF0xdF+GmkPBfaLGX09ypmi28lwfoe
         //FfICY549qkix3Cdsp/91lMbqVairnL8ZiLdvG+TGUOipbMTvSHPGuzuxFRf5Y2wCjq
         XhGGLljw5e9P7BlezCaIRQIThi9A4k+7cdigTTj8XYTZHj9TkUXozhd5P5udyYHpFm1K
         7om+Gnp913C3FeGk5qiJeyL+Lms2I+jNDpAeLrYb6ec3t7xAW1t9caG6S/Nt/9qJxMnx
         KnPcQAz4GpwVDi673qWXjtEvl8uHM9dk532+S2oAATN22dr9x+JBwIK85+MXq9jdy2Vb
         uarg==
X-Gm-Message-State: AOJu0YxGLOA6wyx8AAhFHQTtp4tz4uqvs+GG0BnpgE/fkQUSOaVI1/wL
	W2dekTQjKRb7DTT1hLPVPknNv/hpUbjovAh6Vz+hdvMc0/fyMqq2X6W0k6vtdkuEhWWnVqq5Kv8
	iDd+RL17+5lTkV3AFGwYV+s50FkKO/UbPoSRlPg==
X-Google-Smtp-Source: AGHT+IHhtjzcKjRebHfLxGMylDhvIlqGD+yBicOG5udYUUxblb6r/QucmKAG5K/LyEgMhbdfyqci+8obfNs68JRHne4=
X-Received: by 2002:ad4:4eef:0:b0:6b4:dd2a:aa44 with SMTP id
 6a1803df08f44-6b5ecff6700mr40563736d6.37.1720172724348; Fri, 05 Jul 2024
 02:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <da026465-a28b-44f6-8b79-cfacdd274874@stanley.mountain>
In-Reply-To: <da026465-a28b-44f6-8b79-cfacdd274874@stanley.mountain>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 5 Jul 2024 11:45:13 +0200
Message-ID: <CAG+cZ05aNJjHBhuyeeRP+g+ZfUQ82Rcx9s1j=CtUvb2UWFH_Nw@mail.gmail.com>
Subject: Re: [bug report] mtd: rawnand: lpx32xx: Request DMA channels using DT entries
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_024525_826117_09F13B83 
X-CRM114-Status: GOOD (  11.64  )
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

T24gVGh1LCBKdWwgNCwgMjAyNCBhdCA1OjIx4oCvUE0gRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEhlbGxvIFBpb3RyIFdvanRhc3pjenlrLAo+Cj4g
Q29tbWl0IDczMjZkM2ZiMWVlMyAoIm10ZDogcmF3bmFuZDogbHB4MzJ4eDogUmVxdWVzdCBETUEg
Y2hhbm5lbHMKPiB1c2luZyBEVCBlbnRyaWVzIikgZnJvbSBKdW4gMjcsIDIwMjQgKGxpbnV4LW5l
eHQpLCBsZWFkcyB0byB0aGUKPiBmb2xsb3dpbmcgU21hdGNoIHN0YXRpYyBjaGVja2VyIHdhcm5p
bmc6Cj4KPiAgICAgICAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L2xwYzMyeHhfbWxjLmM6NjA5IGxw
YzMyeHhfZG1hX3NldHVwKCkKPiAgICAgICAgIGVycm9yOiAnaG9zdC0+ZG1hX2NoYW4nIGRlcmVm
ZXJlbmNpbmcgcG9zc2libGUgRVJSX1BUUigpCj4KPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9scGMz
Mnh4X21sYy5jCj4gICAgIDU3MiBzdGF0aWMgaW50IGxwYzMyeHhfZG1hX3NldHVwKHN0cnVjdCBs
cGMzMnh4X25hbmRfaG9zdCAqaG9zdCkKPiAgICAgNTczIHsKPiAgICAgNTc0ICAgICAgICAgc3Ry
dWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZCgmaG9zdC0+bmFuZF9jaGlwKTsKPiAgICAg
NTc1ICAgICAgICAgZG1hX2NhcF9tYXNrX3QgbWFzazsKPiAgICAgNTc2Cj4gICAgIDU3NyAgICAg
ICAgIGhvc3QtPmRtYV9jaGFuID0gZG1hX3JlcXVlc3RfY2hhbihtdGQtPmRldi5wYXJlbnQsICJy
eC10eCIpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5e
Xl4KPgo+ICAgICA1NzggICAgICAgICBpZiAoIWhvc3QtPmRtYV9jaGFuKSB7Cj4KPiBXaHkgZG8g
d2UgaGF2ZSB0d28gZnVuY3Rpb25zIGNhbGxlZCBkbWFfcmVxdWVzdF9jaGFuL2NoYW5uZWwoKT8/
PyAgQ29uZnVzaW5nLgo+IEFueXdheSwgdGhlIF9jaGFuKCkgZnVuY3Rpb24gcmV0dXJucyBlcnJv
ciBwb2ludGVycyBhbmQgdGhlIF9jaGFubmVsKCkgZnVuY3Rpb24KPiByZXR1cm5zIE5VTEwuICBT
byB0aGlzIGNoZWNrIGlzIHdyb25nLgo+CgpIaSBEYW4sCkluaXRpYWwgcGF0Y2ggd2FzIHJlcGxh
Y2luZyBkbWFfcmVxdWVzdF9jaGFubmVsKCkgd2l0aCBkbWFfcmVxdWVzdF9jaGFuKCkgdG8KZ2V0
IGEgZG1hIGNoYW5uZWwgdXNpbmcgRFQgaGludCBpbnN0ZWFkIG9mIHBsYXRmb3JtIGRhdGEgaGlu
dC4gVGhpcwpjb3VsZCBsZWFkIHRvCmZhaWx1cmVzIG9uIG1hY2hpbmVzIHdoaWNoIGRvbid0IGhh
dmUgYSAnZG1hcycgcHJvcGVydHkgaW4gRFQgeWV0IHdoaWNoIEkgaGF2ZQphZGRlZCByZWNlbnRs
eS4gU28gdGhlIHNlY29uZCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCBhZGRlZCBiYWNrIHRoZQpkbWFf
cmVxdWVzdF9jaGFubmVsKCkgZm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuCgpQbGVhc2UgY2hl
Y2sgdGhlIGJ1Z2ZpeCBwYXRjaCBJJ3ZlIHNlbnQ6CiJtdGQ6IHJhd25hbmQ6IGxweDMyeHg6IEZp
eCBkbWFfcmVxdWVzdF9jaGFuKCkgZXJyb3IgY2hlY2tzIgoKCi0tClBpb3RyIFdvanRhc3pjenlr
ClRpbWVzeXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
