Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553B2C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 20:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fG9d6AuZ7DCvOSkjYG4IVr5GPBEOC0q8Im0FZg+DuMk=; b=w+EjvQkiongs66
	5uA/nf7M2I6E6tQx9N5SXB0R5fk4RIva8B1iI7bS/SLpdZp+P3s79//40RU7LoSMAtAj/zwhwO+GA
	Zr4RtFCTEGNO67sQYyTFrIDvbAyVI7TOsgKr11tTGauE7HN1ZI+ESN1fhnGIUguNPFe57mklsFJrX
	wuRr2W3tymNBfX6MKVEx/l0CYG4I8frpN8CShbU0akMOkb/pPF+PpiahiAmJ78JxjNksPKS7Tor0B
	i9wz3QexniEoc299dSssXgU5zsqSU8AH7hJkWhMaATvVwhbkeVU1d7RqAq03lfJUGzRAihRA0Jk57
	TrVCbNf5O3HNi3fonCQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7iI0-003S0B-0S;
	Mon, 27 Nov 2023 20:33:08 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7iHv-003Rzb-1n
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 20:33:06 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c8880fbb33so61445101fa.0
        for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 12:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701117179; x=1701721979; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNjtUZ0nhd8cS6RPbNC6joafgF/UnwDLboniFtb1u5w=;
        b=b6ITfktA4OrfJZruJf8kXVoeimETKc6FmSbJyTT1XjHpJNgotnhkwRbOhmiK4W4eHR
         2J1P0VOroY7siYYF/gTKJVaFabgcY9U4kugowwhkQrFT+M/6PpV1IBBVJNvweZAs8IRM
         apPFlCZbuQ+cIRmM8CIM2WgRNks5hNb1WHC1/qWfPnNkKzK1UKUdtlXHc5vdSJxIJR0b
         L1YdCN535tm1CzPCUJ8V9asuWZeKcHM9FSTMmAKNhnz57Fnzj94xGhFwG9HTUuxnpuZX
         UpZob9MgGMb2D8O3dgbs8Rz49KRwe2zjVVBMvlKkhKOBj676n0tjDeB2dSA0MdSH7D0c
         Ozhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701117179; x=1701721979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNjtUZ0nhd8cS6RPbNC6joafgF/UnwDLboniFtb1u5w=;
        b=sMx4bMP9zj3dLMDl5XbOgp+zs9wiJTd+zQklTRbX/CPv81QHIgxfl4xCbHZNKJuWZL
         BGbsIZGGK3JbksO9ldCsRDwd1+ABaoPYLj/TFhfNA9SCWd0ZU+iQjQXjcsYUkpdrir+J
         1sf2R/tRn04H+fajRC07gVtqarSntUuGFjFTBsHTVoO7SlwhuezKTnlfX3QOR/37fDmX
         cty5qCGqJVXJqTXVbzuS1k9Nj7vLrsIVFKTd+b3JkfQVp+XLa/VgZR0AYLbpTXJYAb78
         nn8itczzyhRTCXQ94ZlQ2pkNgTokQlorS3+XU74vVR9YD2gMKjV+U06eG78293lGOC2R
         28LQ==
X-Gm-Message-State: AOJu0Yx1R1Cl2GZSKyyqefxEH0gIy3MHNlKAzMUscCMUBy5OthFWLRG2
	wRXviUSjTHG2St7G+LhQD8+U2rdfUZDRZcG/ogo=
X-Google-Smtp-Source: AGHT+IGl0sfsaXhL6UdOe4j9cAwcv4q8XxFQkGna7sDn7f2zX5yHRWYRZAYqtBIYiOFq3uwg18M4GHiQIFIP+3yikec=
X-Received: by 2002:a2e:bccd:0:b0:2c9:a9a7:78cc with SMTP id
 z13-20020a2ebccd000000b002c9a9a778ccmr853592ljp.14.1701117179406; Mon, 27 Nov
 2023 12:32:59 -0800 (PST)
MIME-Version: 1.0
References: <CAFLxGvxiy9ofrNkfGmu4TvZgdZhdTbZBiK4pDmL8=8kjcPWO2g@mail.gmail.com>
 <ZWRTfaWFzgSfd9_Z@gardel-login>
In-Reply-To: <ZWRTfaWFzgSfd9_Z@gardel-login>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 27 Nov 2023 21:32:47 +0100
Message-ID: <CAFLxGvwJjhLEgDP73WepEbVmh9qXECaKrsarhp-hg3LMGVBn5Q@mail.gmail.com>
Subject: Re: [systemd-devel] How to properly wait for udev?
To: Lennart Poettering <lennart@poettering.net>
Cc: systemd-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org, 
	dxld@darkboxed.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_123305_259000_F20C843F 
X-CRM114-Status: UNSURE (   6.62  )
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

T24gTW9uLCBOb3YgMjcsIDIwMjMgYXQgOToyOeKAr0FNIExlbm5hcnQgUG9ldHRlcmluZwo8bGVu
bmFydEBwb2V0dGVyaW5nLm5ldD4gd3JvdGU6Cj4gSWYgdGhleSBjb25jZXB0dWFsbHkgc2hvdWxk
IGJlIGNvbnNpZGVyZWQgYmxvY2sgZGV2aWNlIGVxdWl2YWxlbnRzLCB3ZQo+IG1pZ2h0IHdhbnQg
dG8gZXh0ZW5kIHRoZSB1ZGV2IGxvZ2ljIHRvIHN1Y2ggVUJJIGRldmljZXMgdG9vLiAgUGF0Y2hl
cwo+IHdlbGNvbWUuCgpXaHkgZG9lc24ndCB1ZGV2IGZsb2NrKCkgZXZlcnkgZGV2aWNlIGl0IGlz
IHByb2Jpbmc/Ck9yIGFza2VkIGRpZmZlcmVudGx5LCB3aHkgaXMgdGhpcyBmZWF0dXJlIG9wdC1p
biBpbnN0ZWFkIG9mIG9wdC1vdXQ/CgotLSAKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
