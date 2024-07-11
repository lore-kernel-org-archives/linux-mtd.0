Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3BFC3DA45
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jul 2024 23:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z6bfJlv8/AabPemAoZAhI9YDafZkH8yZlNfcNee1gT8=; b=rx2lvQ1/86sNbO
	grMvTHx1qhmUfCm6XYYzT57FWXxpSml5dXt4vNjS26fl20qPNCvjm/O0GkRTu2WvjtkkG1PQ5BW9w
	jKR/igfUnJlD7j74DWhUlAvzzgkwo7bgo167P/9yYi5K9RZC0NWSfGrue2JDpL26oU3XouRls284E
	bcoC16er2szG0NNYPLF2sZgLWi1jEPSiK76wDYfa1LF0S6tUZ+YD/u/gSoX5FaYm0JNxlWrLrndwy
	b2qsCXjZSmgtmDIIx8cd88PkVVkwvrDQYuzSGx7y2iZbpJfxvcwluxJgmKAXAc5y2nYWgQuIDqpD3
	V6fWuT3S1IJY36sjRdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS3SO-0000000Fqge-0GjP;
	Thu, 11 Jul 2024 23:44:12 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS3SL-0000000Fqfp-1pcP
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jul 2024 23:44:10 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-595856e2332so1813019a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2024 16:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720741447; x=1721346247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/UTDOPl9I3vMY3m8thY7f41quo4HANERf0zsiZjsCw0=;
        b=ei196oVrNFryorihIIQlzm2Z1IVTIIkBCZLgZYEC1B/1LfuHgIm4C9+4q936fLlgEb
         irdFwgh+EtaNyRAu3CnHcaYmhaAK/j2Et8KTK+3vYQeS6WNJ4Urqjg4S3jaU1drtZtS4
         AgT8wlcCLPS+07Li/HB9K4cCiO8AcCSgXQVyggucff7sRMFSmNUI9bzQjK4M08YqvV50
         0dK4ZwhlG8vGWsfVKe3sMv7xcl/TsnAlECMGUE/ZTFtMU+wFPLPLWolitlKMq7sTsrTC
         9i9SW5AEi+Us5ndGDlDOgT8zhzCIdR1CTFpbuGiTytnp08hc3bqicG0VVF5+h9+OWX0A
         iKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720741447; x=1721346247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UTDOPl9I3vMY3m8thY7f41quo4HANERf0zsiZjsCw0=;
        b=LDPz6HZJwDd6KVhGGnXlnkEE3dQOYoF8KFBNjTlmkDFnOuVSvGMtrfugEnl+XXAIK8
         m7A9TzKut3dN+Ws5hTctFXByi48pu8BsSaUObe571NWQw/B0x45kU2Nk8jRpfUU0rF1X
         u0L+ZWCxR5B7cK2SzwBhGUq66KoRnxVep4z3BBfJVMeXecI/etMO0k+ALlCHKUPkG3Dx
         8vH6kSF999152PygTPLkxfFiiYA8lEHP58LDGS+VWISPPPnQmSSOWJXVTva1zwPFD+gZ
         zbofpGAGVwp9JCiq9iR/hB4fMLFMm6V2dXYUTOhHwiKB5ZYgDTntHlm7oeHHu8EIrmrI
         be1A==
X-Forwarded-Encrypted: i=1; AJvYcCWwg7yOkDmCHqocC91tN7OrlP2qQPrN10/4VqQHYujjQhXwzAPB8tEJxnJrOtn/0Lo3GlCe5xiTqDDQqpno5M9rqKRFmi4lonhBqP2pGA==
X-Gm-Message-State: AOJu0YyWFeRDjbYFly+4RMKCNDu/HOoqSxZbatbKRyHi0ihNjxEoGAmV
	sT36l1b6+Z46tIRwvyNrtjopSqDeFSAaZiI/eJx9vmYxnP6WOmnf
X-Google-Smtp-Source: AGHT+IEJeM0LyVy2Bw99T+GuOi4v/uMCQDzpgBCjcbqcQI0pTZdD1glvHsJQ8cdC917J3/VfRpJQ5Q==
X-Received: by 2002:a50:9f0d:0:b0:586:f49:1762 with SMTP id 4fb4d7f45d1cf-594bc7c819cmr5494970a12.26.1720741447227;
        Thu, 11 Jul 2024 16:44:07 -0700 (PDT)
Received: from localhost (dh207-43-148.xnet.hr. [88.207.43.148])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bb96042fsm3950389a12.5.2024.07.11.16.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 16:44:06 -0700 (PDT)
From: Mirsad Todorovac <mtodorovac69@gmail.com>
To: Mirsad Todorovac <mtodorovac69@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2 1/1] mtd: slram: insert break after errors in parsing the map
Date: Fri, 12 Jul 2024 01:43:20 +0200
Message-Id: <20240711234319.637824-1-mtodorovac69@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_164409_499667_C17A9FE7 
X-CRM114-Status: GOOD (  11.23  )
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

R0NDIDEyLjMuMCBjb21waWxlciBvbiBsaW51eC1uZXh0IG5leHQtMjAyNDA3MDkgdHJlZSBmb3Vu
ZCB0aGUgZXhlY3V0aW9uCnBhdGggaW4gd2hpY2gsIGR1ZSB0byBsYXp5IGV2YWx1YXRpb24sIGRl
dmxlbmd0aCBpc24ndCBpbml0aWFsaXNlZCB3aXRoIHRoZQpwYXJzZWQgc3RyaW5nOgoKICAgMjg5
CQl3aGlsZSAobWFwKSB7CiAgIDI5MAkJCWRldm5hbWUgPSBkZXZzdGFydCA9IGRldmxlbmd0aCA9
IE5VTEw7CiAgIDI5MQogICAyOTIJCQlpZiAoIShkZXZuYW1lID0gc3Ryc2VwKCZtYXAsICIsIikp
KSB7CiAgIDI5MwkJCQlFKCJzbHJhbTogTm8gZGV2aWNlbmFtZSBzcGVjaWZpZWQuXG4iKTsKICAg
Mjk0CQkJCWJyZWFrOwogICAyOTUJCQl9CiAgIDI5NgkJCVQoInNscmFtOiBkZXZuYW1lID0gJXNc
biIsIGRldm5hbWUpOwogICAyOTcJCQlpZiAoKCFtYXApIHx8ICghKGRldnN0YXJ0ID0gc3Ryc2Vw
KCZtYXAsICIsIikpKSkgewogICAyOTgJCQkJRSgic2xyYW06IE5vIGRldmljZXN0YXJ0IHNwZWNp
ZmllZC5cbiIpOwogICAyOTkJCQl9CiAgIDMwMAkJCVQoInNscmFtOiBkZXZzdGFydCA9ICVzXG4i
LCBkZXZzdGFydCk7CiDihpIgMzAxCQkJaWYgKCghbWFwKSB8fCAoIShkZXZsZW5ndGggPSBzdHJz
ZXAoJm1hcCwgIiwiKSkpKSB7CiAgIDMwMgkJCQlFKCJzbHJhbTogTm8gZGV2aWNlbGVuZ3RoIC8g
LWVuZCBzcGVjaWZpZWQuXG4iKTsKICAgMzAzCQkJfQog4oaSIDMwNAkJCVQoInNscmFtOiBkZXZs
ZW5ndGggPSAlc1xuIiwgZGV2bGVuZ3RoKTsKICAgMzA1CQkJaWYgKHBhcnNlX2NtZGxpbmUoZGV2
bmFtZSwgZGV2c3RhcnQsIGRldmxlbmd0aCkgIT0gMCkgewogICAzMDYJCQkJcmV0dXJuKC1FSU5W
QUwpOwogICAzMDcJCQl9CgpQYXJzaW5nIHNob3VsZCBiZSBmaW5pc2hlZCBhZnRlciBtYXAgPT0g
TlVMTCwgc28gYSBicmVhayBpcyBiZXN0IGluc2VydGVkIGFmdGVyCmVhY2ggRSgic2xyYW06IC4u
LiBcbiIpIGVycm9yIG1lc3NhZ2UuCgpGaXhlczogMWRhMTc3ZTRjM2Y0ICgiTGludXgtMi42LjEy
LXJjMiIpCkNjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgpDYzog
UmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KQ2M6IFZpZ25lc2ggUmFnaGF2ZW5k
cmEgPHZpZ25lc2hyQHRpLmNvbT4KQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnClNp
Z25lZC1vZmYtYnk6IE1pcnNhZCBUb2Rvcm92YWMgPG10b2Rvcm92YWM2OUBnbWFpbC5jb20+Ci0t
LQp2MToKIGluaXRpYWwgcGF0Y2ggcHJvcG9zYWwuCgp2MjoKIHJlLXNlbnQgdXNpbmcgZ2l0IHNl
bmQtZW1haWwgKyBvYXV0aDIgKGZpeGluZyBULUJpcmQgVEFCIHByb2JsZW0pLgoKIGRyaXZlcnMv
bXRkL2RldmljZXMvc2xyYW0uYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3NscmFtLmMgYi9kcml2ZXJzL210
ZC9kZXZpY2VzL3NscmFtLmMKaW5kZXggMjgxMzFhMTI3ZDA2Li44Mjk3YjM2NmEwNjYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvc2xyYW0uYworKysgYi9kcml2ZXJzL210ZC9kZXZp
Y2VzL3NscmFtLmMKQEAgLTI5NiwxMCArMjk2LDEyIEBAIHN0YXRpYyBpbnQgX19pbml0IGluaXRf
c2xyYW0odm9pZCkKIAkJVCgic2xyYW06IGRldm5hbWUgPSAlc1xuIiwgZGV2bmFtZSk7CiAJCWlm
ICgoIW1hcCkgfHwgKCEoZGV2c3RhcnQgPSBzdHJzZXAoJm1hcCwgIiwiKSkpKSB7CiAJCQlFKCJz
bHJhbTogTm8gZGV2aWNlc3RhcnQgc3BlY2lmaWVkLlxuIik7CisJCQlicmVhazsKIAkJfQogCQlU
KCJzbHJhbTogZGV2c3RhcnQgPSAlc1xuIiwgZGV2c3RhcnQpOwogCQlpZiAoKCFtYXApIHx8ICgh
KGRldmxlbmd0aCA9IHN0cnNlcCgmbWFwLCAiLCIpKSkpIHsKIAkJCUUoInNscmFtOiBObyBkZXZp
Y2VsZW5ndGggLyAtZW5kIHNwZWNpZmllZC5cbiIpOworCQkJYnJlYWs7CiAJCX0KIAkJVCgic2xy
YW06IGRldmxlbmd0aCA9ICVzXG4iLCBkZXZsZW5ndGgpOwogCQlpZiAocGFyc2VfY21kbGluZShk
ZXZuYW1lLCBkZXZzdGFydCwgZGV2bGVuZ3RoKSAhPSAwKSB7Ci0tIAoyLjM0LjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
