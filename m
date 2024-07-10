Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEA8C3DA42
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 17:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6osoJnDuEQQlAB/KSFh76oNBCRTsmLkbmdpwdI9qAo8=; b=1mrM19tRCvrR/L
	NANPfGmuym1qqmMcX6hDkYWVJ9lBMBZO5vhgX2+IIiW7EwP3heI796UrHReaF5acPJ/FVyOedtnH9
	BSh7Y8cvcisTt0z5mI/DSmZZo9ZMTxHBZTAtC1L3vPwMzRki3B6drbX+n5z3f/2Km07ZJoZp5F3DV
	eBE4ltW4hi+yDWnMZkg19OehzCvofUZls0VtV4WE4MSZLRbJlu4MxGaSKTkxx/Syq57wkhMPBaVAM
	39IfdtMfq2vPSezzHgnEjmlh2ElXOzbxGZzt/SDyeuk65vXB5DMvtcVJNd5QtBmhdeaI2psqLJKNL
	uA+cIfGOTt22rMYVoxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRb7s-0000000BIeW-0Ahy;
	Wed, 10 Jul 2024 17:29:08 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRb7o-0000000BIdL-39hI
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 17:29:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-356c4e926a3so4262728f8f.1
        for <linux-mtd@lists.infradead.org>; Wed, 10 Jul 2024 10:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720632541; x=1721237341; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8AmXmDZ9UKk1+/Op1aszku3ECYfba0yWQH9jueXqCs=;
        b=IbvBCo9+4/RawxtJ3XTgtH0JABdz/C0Mu8Z+aevtEKrsoBUy0gAi/nE98sEcuIeM2I
         XreKJMXhzcFxFQnmpbJ5eJWDlUk4Oi3ki+acILCh8sFuEBVk6gbMM2NtA0IcaBbr+aut
         Y4nKEfDC7MtCriVLiYOPBTO9dInRz17gbpvrKeWuDUK64mEp+ceecnYUqikmNKnMtukc
         jIFKCxBT0VhU7zoApdKgDxQioqj0ipfZI6GGcYZnmqLCQsuhwZszqkw7ikV1nxep6lnj
         vGZQgcmRSsGpvIruz2gHUU/9b+7q+1EeI6sFp8AsHB0Hb1VOED0xc+ITpkQBlMOrtRHV
         afBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720632541; x=1721237341;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W8AmXmDZ9UKk1+/Op1aszku3ECYfba0yWQH9jueXqCs=;
        b=dEcuspEh/ixtvbH0S7d80X0hpZZeydFTL14A1EqUCgQRajnIcjOLx1XZtpGUk9iapv
         KsxYNT9kiLzU3W6w9+etGli0fDsHxRWWFVBbmPKXhTKGkvBMKMin/Ov6piqHFaxtXKeu
         5t6kEdRIuM4q/P2/r8PzqC+xmd/v+EbYbduPTDbF+kVYSVJIA0rgDEFTcpkabSJD/Ek1
         WUdIAowlOqiSiLEFlGHmw0racOquvBmXuA18boS8AytuIZG6sxtIGknFVOsGL5SR4vfe
         aZ4Z59UbKvKbITAqcbwxw7KUfVEWliPaFBhexF5a2g5GTJMozxQSgf4E2O4KbzVVPtg9
         5KMA==
X-Forwarded-Encrypted: i=1; AJvYcCUupwW3iupYwmH5cPug+2Yooy/+sDBhjy5FW46Zn+c1t6hXAomsDBjWs1SMR+VxbuvdBssanzG5k86vPV7qOldQLCeJE30pFkPazhSR1g==
X-Gm-Message-State: AOJu0YzQ9cSSUzKmwQj/nBbmSEHQ/AkZWuYyHSkFE4fvPnVb9CIA4nVk
	CDnicMFxlnDOy7YuCcZUJyk+dkdLZnEI7o0YLs8x869jefDQcadi/E2Llg==
X-Google-Smtp-Source: AGHT+IGEugKesaHDyp/MX6Mr5mcQL14OSWfE3NQfaJnQuXUz5fJJ8TcZCYBCzzQXu06kgIHaHM+Gaw==
X-Received: by 2002:a5d:47c3:0:b0:362:52d8:6788 with SMTP id ffacd0b85a97d-367cea46642mr6130362f8f.2.1720632541052;
        Wed, 10 Jul 2024 10:29:01 -0700 (PDT)
Received: from [192.168.178.20] (dh207-43-148.xnet.hr. [88.207.43.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab753sm5767858f8f.107.2024.07.10.10.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 10:29:00 -0700 (PDT)
Message-ID: <e3cdee98-e2a0-4991-ae6c-4d8ee687a284@gmail.com>
Date: Wed, 10 Jul 2024 19:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
From: Mirsad Todorovac <mtodorovac69@gmail.com>
Subject: =?UTF-8?Q?=5BPROBLEM_linux-next=5D_=2E/include/linux/kern=5Flevels?=
 =?UTF-8?B?Lmg6NToyNTogZXJyb3I6IOKAmCVz4oCZIGRpcmVjdGl2ZSBhcmd1bWVudCBpcyBu?=
 =?UTF-8?Q?ull_=5B-Werror=3Dformat-overflow=3D=5D?=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_102904_818021_FC41EC5F 
X-CRM114-Status: GOOD (  12.40  )
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

SGkgYWxsLAoKT24gdGhlIGxpbnV4LW5leHQgdmFuaWxsYSBuZXh0LTIwMjQwNzA5IHRyZWUsIEkg
aGF2ZSBhdHRlbXB0ZWQgdGhlIHNlZWQgS0NPTkZJR19TRUVEPTB4RUU3QUI1MkYKd2hpY2ggd2Fz
IGtub3duIGZyb20gYmVmb3JlIHRvIHRyaWdnZXIgdmFyaW91cyBlcnJvcnMgaW4gY29tcGlsZSBh
bmQgYnVpbGQgcHJvY2Vzcy4KClRob3VnaCB0aGlzIG1pZ2h0IHNlZW0gYXMgY29udHJpYnV0aW5n
IHRvIGNoYW5uZWwgbm9pc2UsIExpbnV4IHJlZnVzZXMgdG8gYnVpbGQgdGhpcyBjb25maWcsCnRy
ZWF0aW5nIHdhcm5pbmdzIGFzIGVycm9ycywgdXNpbmcgdGhpcyBidWlsZCBsaW5lOgoKJCB0aW1l
IG5pY2UgbWFrZSBXPTEgLWsgLWogMzYgfCYgdGVlIC4uL2Vyci1uZXh0LTIwMjMwNzA5LTAxYS5s
b2c7IGRhdGUKCkFzIEkga25vdyB0aGF0IHRoZSBDaGllZiBQZW5ndWluIGRvZXNuJ3QgbGlrZSB3
YXJuaW5ncywgYnV0IEkgYW0gYWxzbyBhd2FyZSB0aGF0IHRoZXJlIGFyZSBwbGVudHkKbGVmdCwg
dGhlcmUgc2VlbXMgdG8gYmUgbW9yZSB0ZWRpb3VzIHdvcmsgYWhlYWQgdG8gbWFrZSB0aGUgY29t
cGlsZXJzIGhhcHB5LgoKVGhlIGNvbXBpbGVyIG91dHB1dCBpczoKCi4vaW5jbHVkZS9saW51eC9r
ZXJuX2xldmVscy5oOjU6MjU6IGVycm9yOiDigJglc+KAmSBkaXJlY3RpdmUgYXJndW1lbnQgaXMg
bnVsbCBbLVdlcnJvcj1mb3JtYXQtb3ZlcmZsb3c9XQogICAgNSB8ICNkZWZpbmUgS0VSTl9TT0gg
ICAgICAgICJcMDAxIiAgICAgICAgICAvKiBBU0NJSSBTdGFydCBPZiBIZWFkZXIgKi8KICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KLi9pbmNsdWRlL2xpbnV4L3ByaW50ay5o
OjQ2MjoyNTogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhwcmludGtfaW5kZXhfd3Jh
cOKAmQogIDQ2MiB8ICAgICAgICAgICAgICAgICBfcF9mdW5jKF9mbXQsICMjX19WQV9BUkdTX18p
OyAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICBefn5+CmRyaXZlcnMvbXRkL2RldmljZXMvc2xyYW0uYzo1MjoyNTogbm90ZTogaW4gZXhw
YW5zaW9uIG9mIG1hY3JvIOKAmHByaW50a+KAmQogICA1MiB8ICNkZWZpbmUgVChmbXQsIGFyZ3Mu
Li4pIHByaW50ayhLRVJOX0RFQlVHIGZtdCwgIyMgYXJncykKICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn4KLi9pbmNsdWRlL2xpbnV4L2tlcm5fbGV2ZWxzLmg6MTU6MjU6IG5v
dGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhLRVJOX1NPSOKAmQogICAxNSB8ICNkZWZpbmUg
S0VSTl9ERUJVRyAgICAgIEtFUk5fU09IICI3IiAgICAvKiBkZWJ1Zy1sZXZlbCBtZXNzYWdlcyAq
LwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+CmRyaXZlcnMvbXRkL2Rl
dmljZXMvc2xyYW0uYzo1MjozMjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEtFUk5f
REVCVUfigJkKICAgNTIgfCAjZGVmaW5lIFQoZm10LCBhcmdzLi4uKSBwcmludGsoS0VSTl9ERUJV
RyBmbXQsICMjIGFyZ3MpCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn4KZHJpdmVycy9tdGQvZGV2aWNlcy9zbHJhbS5jOjMwNDoxNzogbm90ZTogaW4gZXhw
YW5zaW9uIG9mIG1hY3JvIOKAmFTigJkKICAzMDQgfCAgICAgICAgICAgICAgICAgVCgic2xyYW06
IGRldmxlbmd0aCA9ICVzXG4iLCBkZXZsZW5ndGgpOwogICAgICB8ICAgICAgICAgICAgICAgICBe
CmNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCmNjMTogYWxsIHdhcm5p
bmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCm1ha2VbNV06ICoqKiBbc2NyaXB0cy9NYWtlZmls
ZS5idWlsZDoyNDQ6IGRyaXZlcnMvbXRkL2RldmljZXMvc2xyYW0ub10gRXJyb3IgMQptYWtlWzVd
OiBUYXJnZXQgJ2RyaXZlcnMvbXRkL2RldmljZXMvJyBub3QgcmVtYWRlIGJlY2F1c2Ugb2YgZXJy
b3JzLgpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwoKVGhlIHByb2Js
ZW0gc2VlbXMgdG8gb3JpZ2luYXRlIGZyb20gcHJlLWdpdCBlcmEgPCAyMDA1LTA0LTE2IF4xZGEx
NzdlNGMzZjQgKCJMaW51eC0yLjYuMTItcmMyIikuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCmRyaXZlcnMvbXRkL2RldmljZXMvc2xyYW0uYwotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgIDI3NwlzdGF0aWMgaW50IF9faW5pdCBpbml0
X3NscmFtKHZvaWQpCiAgIDI3OAl7CiAgIDI3OQkJY2hhciAqZGV2bmFtZTsKICAgMjgwCQogICAy
ODEJI2lmbmRlZiBNT0RVTEUKICAgMjgyCQljaGFyICpkZXZzdGFydDsKICAgMjgzCQljaGFyICpk
ZXZsZW5ndGg7CiAgIDI4NAkKICAgMjg1CQlpZiAoIW1hcCkgewogICAyODYJCQlFKCJzbHJhbTog
bm90IGVub3VnaCBwYXJhbWV0ZXJzLlxuIik7CiAgIDI4NwkJCXJldHVybigtRUlOVkFMKTsKICAg
Mjg4CQl9CiAgIDI4OQkJd2hpbGUgKG1hcCkgewogICAyOTAJCQlkZXZuYW1lID0gZGV2c3RhcnQg
PSBkZXZsZW5ndGggPSBOVUxMOwogICAyOTEJCiAgIDI5MgkJCWlmICghKGRldm5hbWUgPSBzdHJz
ZXAoJm1hcCwgIiwiKSkpIHsKICAgMjkzCQkJCUUoInNscmFtOiBObyBkZXZpY2VuYW1lIHNwZWNp
ZmllZC5cbiIpOwogICAyOTQJCQkJYnJlYWs7CiAgIDI5NQkJCX0KICAgMjk2CQkJVCgic2xyYW06
IGRldm5hbWUgPSAlc1xuIiwgZGV2bmFtZSk7CiAgIDI5NwkJCWlmICgoIW1hcCkgfHwgKCEoZGV2
c3RhcnQgPSBzdHJzZXAoJm1hcCwgIiwiKSkpKSB7CiAgIDI5OAkJCQlFKCJzbHJhbTogTm8gZGV2
aWNlc3RhcnQgc3BlY2lmaWVkLlxuIik7CiAgIDI5OQkJCX0KICAgMzAwCQkJVCgic2xyYW06IGRl
dnN0YXJ0ID0gJXNcbiIsIGRldnN0YXJ0KTsKIOKGkiAzMDEJCQlpZiAoKCFtYXApIHx8ICghKGRl
dmxlbmd0aCA9IHN0cnNlcCgmbWFwLCAiLCIpKSkpIHsKICAgMzAyCQkJCUUoInNscmFtOiBObyBk
ZXZpY2VsZW5ndGggLyAtZW5kIHNwZWNpZmllZC5cbiIpOwogICAzMDMJCQl9CiDihpIgMzA0CQkJ
VCgic2xyYW06IGRldmxlbmd0aCA9ICVzXG4iLCBkZXZsZW5ndGgpOwogICAzMDUJCQlpZiAocGFy
c2VfY21kbGluZShkZXZuYW1lLCBkZXZzdGFydCwgZGV2bGVuZ3RoKSAhPSAwKSB7CiAgIDMwNgkJ
CQlyZXR1cm4oLUVJTlZBTCk7CiAgIDMwNwkJCX0KICAgMzA4CQl9CiAgIDMwOQkjZWxzZQogICAz
MTAJCWludCBjb3VudDsKICAgMzExCQlpbnQgaTsKICAgMzEyCQogICAzMTMJCWZvciAoY291bnQg
PSAwOyBjb3VudCA8IFNMUkFNX01BWF9ERVZJQ0VTX1BBUkFNUyAmJiBtYXBbY291bnRdOwogICAz
MTQJCQkJY291bnQrKykgewogICAzMTUJCX0KICAgMzE2CQogICAzMTcJCWlmICgoY291bnQgJSAz
ICE9IDApIHx8IChjb3VudCA9PSAwKSkgewogICAzMTgJCQlFKCJzbHJhbTogbm90IGVub3VnaCBw
YXJhbWV0ZXJzLlxuIik7CiAgIDMxOQkJCXJldHVybigtRUlOVkFMKTsKICAgMzIwCQl9CiAgIDMy
MQkJZm9yIChpID0gMDsgaSA8IChjb3VudCAvIDMpOyBpKyspIHsKICAgMzIyCQkJZGV2bmFtZSA9
IG1hcFtpICogM107CiAgIDMyMwkKICAgMzI0CQkJaWYgKHBhcnNlX2NtZGxpbmUoZGV2bmFtZSwg
bWFwW2kgKiAzICsgMV0sIG1hcFtpICogMyArIDJdKSE9MCkgewogICAzMjUJCQkJcmV0dXJuKC1F
SU5WQUwpOwogICAzMjYJCQl9CiAgIDMyNwkKICAgMzI4CQl9CiAgIDMyOQkjZW5kaWYgLyogIU1P
RFVMRSAqLwogICAzMzAJCiAgIDMzMQkJcmV0dXJuKDApOwogICAzMzIJfQotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpOT1RFLCBpbiBsaW5lIDMwMSwgaW4gY2FzZSBv
ZiBsYXp5IGV2YWx1YXRpb24sIGlmIChtYXAgPT0gTlVMTCwgdGhlbiAoIShkZXZsZW5ndGggPSBz
dHJzZXAoJm1hcCwgIiwiKSkpCndpbGwgbm90IGJlIGV2YWx1YXRlZCwgYW5kIGRldmxlbmd0aCB3
aWxsIG5vdCBiZSBhc3NpZ25lZC4KCkFzIGEgZGlmZiBzcGVha3MgbW9yZSB0aGFuIGEgdGhvdXNh
bmQgd29yZHMsIGhlcmUgaXMgdGhlIHByb3Bvc2VkIGZpeDoKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0+PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3NscmFtLmMgYi9kcml2ZXJz
L210ZC9kZXZpY2VzL3NscmFtLmMKaW5kZXggMjgxMzFhMTI3ZDA2Li44Mjk3YjM2NmEwNjYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvc2xyYW0uYworKysgYi9kcml2ZXJzL210ZC9k
ZXZpY2VzL3NscmFtLmMKQEAgLTI5NiwxMCArMjk2LDEyIEBAIHN0YXRpYyBpbnQgX19pbml0IGlu
aXRfc2xyYW0odm9pZCkKICAgICAgICAgICAgICAgIFQoInNscmFtOiBkZXZuYW1lID0gJXNcbiIs
IGRldm5hbWUpOwogICAgICAgICAgICAgICAgaWYgKCghbWFwKSB8fCAoIShkZXZzdGFydCA9IHN0
cnNlcCgmbWFwLCAiLCIpKSkpIHsKICAgICAgICAgICAgICAgICAgICAgICAgRSgic2xyYW06IE5v
IGRldmljZXN0YXJ0IHNwZWNpZmllZC5cbiIpOworICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIFQoInNscmFtOiBkZXZzdGFydCA9
ICVzXG4iLCBkZXZzdGFydCk7CiAgICAgICAgICAgICAgICBpZiAoKCFtYXApIHx8ICghKGRldmxl
bmd0aCA9IHN0cnNlcCgmbWFwLCAiLCIpKSkpIHsKICAgICAgICAgICAgICAgICAgICAgICAgRSgi
c2xyYW06IE5vIGRldmljZWxlbmd0aCAvIC1lbmQgc3BlY2lmaWVkLlxuIik7CisgICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgVCgi
c2xyYW06IGRldmxlbmd0aCA9ICVzXG4iLCBkZXZsZW5ndGgpOwogICAgICAgICAgICAgICAgaWYg
KHBhcnNlX2NtZGxpbmUoZGV2bmFtZSwgZGV2c3RhcnQsIGRldmxlbmd0aCkgIT0gMCkgewotLQoK
SG9wZSB0aGlzIGhlbHBzLgoKQmVzdCByZWdhcmRzLApNaXJzYWQgVG9kb3JvdmFjCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
