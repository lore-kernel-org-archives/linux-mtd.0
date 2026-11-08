Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ACE606A331
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N7noIOlo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ToqZvm67
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=x97txw07xCAavVS+JuoZqhDtOvSvZ/Bq7tb9RV9Nlww=; b=N7noIOlo3Iuzx9WHPIStVtDnto
	7UzhS8MmYoF58m0TBFvk6kRUEkYe8C4e6VUHyF112HyprAFzfRNSJ5vD0b2xgS1sJ7dJwANVPM3RT
	y0HLDN2F5WvQXHs9RrIjirxc3OXKPI8T10YUJLRRGlLonWBM9V0gzIqftTM527f1Df+NwnNuxY7dD
	sbEkTJVh40UCj1MAV5nw/mU2+BJVZIQVYcvFxyR8IdRZLkwzP7/IduVok892czGHlGBGwbd4g6HNr
	v9b7wuGcn3+WpDK5OC2KSe0Rw2ILcBX2zX9AlH8aMsJc+FutwBimEMKq41pgOwNO922aQ5Ii+FAl4
	B0HGL9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAMm-0000000Gi7e-2Oic;
	Sun, 08 Nov 2026 21:23:56 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAMk-0000000Gi6b-35SI
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:23:55 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-843ea301d60so140002a34.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173034; x=1794777834; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0dO5iSkJD5cA7k3NwfI5mURiH/0OkxrsK506UFd+u1o=;
        b=ToqZvm67tbj7FmAG3etyLai6fsZZPnQrKzPl+LFpUGmwfKRxALPOcWPQoGY+qeJNDB
         IPy2jjSeCxuCNdPOE3Cx62G61ssHmb1B1sHDri8P86ama4yVneqTb5Q3Td0K4HWp70ii
         SRWNAqrE/ZeYVVTYdr5NKfLOrzXUtih8ug4Z0/H4Mgs+05lAydQQvbNbAozz8Ajwm3Pg
         8ptwOLAJMaNptHv602aPJDLN/IO04IBTtuVmgxSCU+tpPSx/A9KnqKC/YvfLUz5pssmV
         b3Ut+Dw1BCjWecSY3k7IA680qU/SLbjKYlhttZwc7GRPKZ/7oSMSE/9Vcl5pCudfTtjy
         DtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173034; x=1794777834;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0dO5iSkJD5cA7k3NwfI5mURiH/0OkxrsK506UFd+u1o=;
        b=P1cYJF4DJPrgcN+PJZbe8R44sNBLrONZUTRRSV8QyxptkophXe9IkkY7LnDfOGAdK3
         RXm5ZTW5VaEhZx7/xzA1w9DFI+5bTkNuukL3riyf52O/dAGnywM1AkQiXvkh72+Ii9bG
         7ZjbjR4ZTgqGvdaLT3Lccvv1Ut5y7wwxFU0vIGXz23lf5HfNIQOoc4Jnop0QlPXra461
         tqLmmRjUT0SdySqV8b9DETpcPMUe1v0ImkXrqmmbJYY/S9YEBqi5ue4znZpfutlUc6oK
         dMvMKtZb6s+aEBeGTqFyzOmPnwxlGKYajb5ZcoZJRYxZrf72/jLlcbkh96mitzmw8TvS
         F8AQ==
X-Gm-Message-State: APuU4Z/LiQOHrZ1RO+qljSBpW7Nb9thvbHxx+oaQtI5DIyPGsYOYcwwi
	Ys3/u0xnrLFUOBmfPcA9ZMCwpHnLQXcvBSH+7hLpl9yDP2GNxdYTuRq5
X-Gm-Gg: AYBFou3kmqoOpym0ivhRR7Fn20maCjnC88Va70/hoMsfUjowVUnD0bfSVPwiIgdMWer
	HGxyoWUXW/0xp5jiPfqKZv4jHSM+xYNGsWEZYEXE13ROvSEMh0+YXHTAV9jv6xHgN0+Mw+e76eV
	2N80lebT4A7jlqlwtOAkrLRgrB1eefbCEwgM2LUWc4yh5HakLTzOI/iMltYph+GUOi6YP5cwRLK
	bdU4jlJcxUAZKc53Y9Ifg/uEn4gLNfJID3WNHDsH5oo8kkhcAmifQu/Ljtnh/WPtbxlryd98/xj
	aMOT0kIfYGePNjEilBQqXPPlTHUT9O9x8b9uIverzmlcR5eLtXHH3tuEE4e6Y6pSdyyaVL0PEUX
	D+kUqG9AW1yKx4W6OLcPei9CAj3vxJdoyeh+VR4VaIN798QD7Z4D1tBsUQG4sZKWt+Uwe7SzO8R
	AzmDVEyHLxLR/En/wcW6hs/VbrthzZxig+xoiU/NLBnmymbKoa6Jp+CD9oKw326v8f2woseQsmu
	WXOMYfGKBA6AJhyfUgyuBEjnQmi/nFV526O4VKEFQO8eZk7LQgazc+tGqJvXECEbX6FFdUTr45M
	3XbAhnoW7qEWI2jD2l9ImEU6PAcJN3ajr2rZpZVVICe2ojUA3B9xXFCQMOefxpN7vr9HjNTafQv
	DiTAJviMwn0bXgo8+EIJ1Dsk2DhSLRh63LsBB0z+hUAoMBvdIrmzQhviLtygPYe5/4ju3rpicCq
	SK/753zZWijBMTCkCdnPWT53qyW5kJMg1nXJJyFLneeJMFlvCu1UQ=
X-Received: by 2002:a05:6820:1395:b0:6c7:af50:b2f2 with SMTP id 006d021491bc7-7170f2ebe0emr1088943eaf.45.1794173033669;
        Sun, 08 Nov 2026 13:23:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1908138eaf.12.2026.11.08.13.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:23:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/2] mtd: rawnand: serialize OTP and BBT recovery
 operations
Date: Sun, 08 Nov 2026 14:23:21 -0700
Message-Id: <20261108-submit-rawnand-operation-locking-v1-v1-0-565010fc5f8b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQ6CMBBEf4X07AZKDDb+ivGwbRdYlYW0FUkI/
 26rxzeZebOrSIEpqmu1q0ArR54lgz5Vyo0oAwH7zKpt2k7rxkB824kTBPwIiod5oYApj+A1uyf
 LAKsGjY01PV1M588qm5ZAPW+/l9v9z1nzIJeKujQsRgIbUNxYoin5uuhroS2p4/gCxoLZoKcAA
 AA=
X-Change-ID: 20261108-submit-rawnand-operation-locking-v1-1a0b8fe786d4
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Kyle Roeschley <kyle.roeschley@ni.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_132354_787436_D3370831 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the existing chip/controller serialization for the Macronix OTP
transaction and for marker writes after a BBT erase or write failure.
Both paths issue NAND commands outside the ordinary MTD read/write
wrappers, so they must acquire the same locks and wait for suspended
chips themselves.

The first patch makes the existing helpers available within the raw
NAND core and uses them for Macronix OTP. The second uses them for BBT
recovery.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (2):
      mtd: rawnand: macronix: serialize OTP access with NAND operations
      mtd: rawnand: serialize bad-block marker writes during BBT recovery

 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_bbt.c      | 2 ++
 drivers/mtd/nand/raw/nand_macronix.c | 2 ++
 4 files changed, 8 insertions(+), 2 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-rawnand-operation-locking-v1-1a0b8fe786d4

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
