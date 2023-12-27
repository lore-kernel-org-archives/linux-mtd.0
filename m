Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E850C47073
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Dec 2023 14:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWhGHVOgBczB2z7vixE2yX7KgaPgbDhx0xthwaHDTqQ=; b=zR5ht7W/69HkSj
	OZud0EoexxJXvXKvI/DWWvBLqNW99YpPvaJdUvw0bBg5IaZ3sThDlLjO/fdPHA7ig0h8/PFCuhLcT
	I5DsXFw/WMuJRkF7jSuByQ8UiS+2HzE9U0mXozGNTVSdNFRyQOlpTXhrW0/leWAj53p1yQ0GNlMtS
	JkWsUeZrHGlrKoX/yh4zpfb0cpsW06YHdWXHniig26PLFLxXkfP2821F7P2iBTPcUbNi808M+hhdv
	xss7+5BYxTyFvQOwzozGc4gpSfp5DuGItJ7Vpfei/cuh6SW5hhuWE4N33Czu1aYZSHf00kCwYIbfz
	TyM6icid6Pc6B5J3dnhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIVBt-00Er6X-3D;
	Wed, 27 Dec 2023 14:47:26 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIVBq-00Er5c-1T
	for linux-mtd@lists.infradead.org;
	Wed, 27 Dec 2023 14:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1703688438; x=1704293238; i=markus.elfring@web.de;
	bh=ENo4hclmxFGh3SyuMn74xYfR6nPiZ/yVfNyShc6CWic=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:
	 In-Reply-To;
	b=jb6FhMk8ncrUT/GPmfbCWFPh1XKG5v12rU5Yc3PvGZ4PRdtEYCbvFdKmgzlC3wTO
	 GyxDflLMqLov0mle4NbmnDuOvKJB/M2LIxi+LxJFtZPoGCM67T+0TqoJFQDT/kzbL
	 /P6N2vMjAwTXbZN0jD1506ss6uZFmP6TDF80FdAy3zaDdUKF/zedEH3KmmuiqV9yU
	 b74B1JyHqelRQXLyk7WKXXHv98roR3Y5hRUF/ftrzysPsNmJWLrOElYdstfEs2adI
	 aIAmLdogIKobhpVLtDRyyygEEPrezLFVbl/JyhLbwjhOyx5vy4MnWG9Hge+OH5LFu
	 lIPYAtUUcatoIcRQ2w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MActo-1rP3gz3l6G-00BSnE; Wed, 27
 Dec 2023 15:47:17 +0100
Message-ID: <4045abdd-fb88-4c1f-a947-cdb3d4e59aa6@web.de>
Date: Wed, 27 Dec 2023 15:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/3] mtd: ssfdc: Fix indentation in ssfdcr_add_mtd()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
References: <74183091-4c8d-4c92-b3f9-cebaacb41efd@web.de>
In-Reply-To: <74183091-4c8d-4c92-b3f9-cebaacb41efd@web.de>
X-Provags-ID: V03:K1:OYIJmlZiVv3gMIO0Joo/qfFTlG1BRQ6vZQXJAYujZsR+yqMSQlg
 YUQ1u0jm8hFI7QwcNmMqIOGC1Yw+g5VgIXV0uFEhbxC11wtnsBvPNZj1dHfxUPdwAjJeLk2
 YhOciknrWm6X7bCdFPLimteTNxlUTv/xalPSJTKhbzBq4Dg0GZAbecvv6x3Hk+9JbMU7IiH
 0/VIEyuZ7Woycz3SOt/jw==
UI-OutboundReport: notjunk:1;M01:P0:nTbrXtVW0Ek=;9SXT7VBtC7psLaI3e5DfbupJ4Xk
 RCauIZbHor2BgN+90TjGkfgolk1x3MF/bVcJwL1qziklyA+m21E4Aj2YM+YaMS1kYI1blUyhF
 Yaww5laVRJaJiSCHqahF6uhzpPGFZ+qg5BmPeVVJendUtGfZSr7F+vTVEdSEk3RoVqGP/dsqN
 t8Caq9vVu703baEUjFXaRTIyjNRP4djyJeaU4dxTPyA+D8YGkRrWdiJ5TNZ/sN6U6hInNMj/g
 psV+E5g5WUa02vmiNFBEaxL0s/nf45y/hKeQQq5FcNfA7gpZWRnwzqMbZG6x62yYw6/9cSAPg
 0jIknk9zEyKSk+lcQ/Nz5JvUV035PSv27TPwTcw365zJpARJ3puJpANcyggg//tA4dnZQmV93
 /OdwZ9M+8tB46fKGkR8P9XW59L2uYtWolYmQ5gFstKtYns2qBwJvGOEmw88Ug18rUbWgOvE8F
 O18q0kKwF+xSN0FdIgWcApb8Uv8BzW9RHDJQEdUVzDWAkofn2o+b3l0hkrVFnhzxzZ1WFUdxy
 z4HpN4/076xAjoRUjBuNGgUYyMAHudg6aysb8a98egU03qZLqNUZ2s4O3emW3qylLZvmPol7H
 bQBO7bdaEI0Mli+Fz88C6D1OQgOSk/UaBLmft160Ljeo9wnzA01Bz3tH2IwzsQhcN2AHs1zSB
 rOpyjMV2gXVpKvPF+j4KgRDAxyGISDZlu9q5ZJiqrcoD2IhV6K196SBK3I2WX/eQ83PQfjnQr
 VHCXQvrkl2rOOawe6AXcBbQMWy9Q4iRHIMaPSykrTfHBRoV3G20Y6IA3lfTpy61odxpopJd/4
 u7ba2JmoBlOudkDe1x1h8X8emp8XrAUF9gpIJdKqzB/dv/oCl/pSTy2mcgj6qbcGUcgZxfqgW
 1DKBHlgjCH7neJQvKjIXKBxOYQWWLEdMvRIap6uVnz1Hjrh/34T0vTGfrmRgQbJvp0vLjEwby
 vP0xtAIRKkTKmxR2pv7zSqF6ywQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_064722_798146_D41A2DC2 
X-CRM114-Status: UNSURE (   7.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Dec 2023 15:17:58 +0100

Replace eight space characters by one tab.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/ssfdc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 3ee8535d4515..e6de25087647 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -351,7 +351,7 @@ static void ssfdcr_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 out_err:
 	kfree(ssfdc->logic_block_map);
 out_free_ssfdc:
-        kfree(ssfdc);
+	kfree(ssfdc);
 }

 static void ssfdcr_remove_dev(struct mtd_blktrans_dev *dev)
--
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
