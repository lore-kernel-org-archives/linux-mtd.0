Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEE6D3C92C
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Oct 2024 20:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FSXKfkky8bf302EETDDDx+I45fCI2c0ToYrjNu4aZGQ=; b=H702Xvt+MTrAZW
	Bg2FI4sMpaV2z9iWgvXnXVGlufT2sbu6BUs7AmMBLnVDZ4XYHtQCgjvuGWb+Gz80YKo5BLn3xyx7k
	rJ+nm0ddUHvvLClibILtile53yhtdbKOuL3+BRpHSY01xNkm4eJA4csAnYKJ6Fr6JVn6AYiWTbSsu
	uGvX3tHOW0hp0M6Cg7ht9bP52YYDLFpwOFawrAwanYk7pVlQOdoVgdNwGm+B83BtqELW+irh0NqrV
	VQi7mXbhtoBMJmQQBJn5JKrPR1kTumQALib83uZnl0IpY01rjnE5jN1m1kLIfJKNewF9aaOeNPdgX
	FHuruoXpLdh9LwJcLl5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2G2g-00000003sz3-3rCK;
	Sat, 19 Oct 2024 20:27:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2G2e-00000003sye-2gLV
	for linux-mtd@lists.infradead.org;
	Sat, 19 Oct 2024 20:27:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43161c0068bso17588705e9.1
        for <linux-mtd@lists.infradead.org>; Sat, 19 Oct 2024 13:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729369633; x=1729974433; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/nD95+paDqPhoKnttXW4GGB9gi2jM5a9pY8Vq229MVI=;
        b=EhxnuLjLw4ZrHNFA6Kr4DlB1CA5309CCPZhWZMp3qbBkHpJ5abMalViJZr3C2CuGKB
         wihwV/ns8sHSI96M1mp+YRlRQEWscv/RncXdhTQLJyqHvVXra2JfJo8t3+v9RmuwjDQo
         RbYe94S1RSmJXZXbuXvyMPEJIkZUtVBealORtZfMiVK6YqR8wsULcGGJnci+t/rvGn3w
         kNVRKIop5fdpOcOvUqSs8dEl+nIGPo0i/7fmwkxekOYyuzdzKDR5goWUzdxNn1/pn1w3
         Hm0BuWMxRVN1J5NqkNee7bUI6fdiAFmScvnqJYi/mYDOehGuWLWwvi828hvDw9Ww0mWE
         nU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729369633; x=1729974433;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nD95+paDqPhoKnttXW4GGB9gi2jM5a9pY8Vq229MVI=;
        b=YwD+lOpCEKU0QIF0tPX0+lxZB3zpj2EtkrqbFQGToBoceeMVVAMfIexGLdM6JUtBfP
         gNior2pQuykFT2mVYD0zZemLQ7GUZwANmpIobrSwyBCvKEkL3k65S36Jmss++jVjRvu4
         tp3wnK1THJJWzhj22soRnGbkmZPYTrWemA+7wZ1ypDZRwIkxRo29LSD79rg3ZKM+WV/k
         g5nOqzcqmq27Y124eM8proSJrRjN5aVGoCvbIFpXF8RAFT8RrqQFeEZIArUbfuww4FTZ
         1GYsNQfHSbDoLOI71hqJrg2+F8BGquHzLONiPCVEMw/8o/tftsp1GixPx9CHqLjAnMuP
         FUlQ==
X-Gm-Message-State: AOJu0YxwMWB8UOcOMdNcCjOZikajbQTfcCHJipeRoDLHfKlv6DwnvDh8
	4O6t5lLcHJcRYQrcM+qGjynC3WWU44T+zd6kntVqFjYix6T1mvXi1OTIS5fE
X-Google-Smtp-Source: AGHT+IFqWdIVbCM0yk8+9sAkm44Z3tf7BcWnp68nXIygEX4xf6LyXZR+Wf21jJu1onW5Yy0/OZijgQ==
X-Received: by 2002:a05:600c:c89:b0:431:5c1c:250b with SMTP id 5b1f17b1804b1-43161633321mr54075625e9.1.1729369633428;
        Sat, 19 Oct 2024 13:27:13 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-f8f1-d6d3-1513-aa34.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:f8f1:d6d3:1513:aa34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c2ca6sm3522335e9.35.2024.10.19.13.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 13:27:12 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sat, 19 Oct 2024 22:27:03 +0200
Subject: [PATCH] mtd: ubi: fix unreleased fwnode_handle in
 find_volume_fwnode()
MIME-Version: 1.0
Message-Id: <20241019-mtd-uvi-fwnode_handle_put-v1-1-f5ef0d0cf9c8@gmail.com>
X-B4-Tracking: v=1; b=H4sIABYWFGcC/x2MWwqDMBAAryL73YVkUVJ7lVKCumtdaKMkvkC8u
 8HPgZk5IElUSfAqDoiyatIxZLCPArqhCV9B5cxAhkprbI3/mXFZFfstjCw+O/wTPy0zupbIMDn
 3bCvI/RSl1/1+vz/neQEuVfhPawAAAA==
To: Richard Weinberger <richard@nod.at>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Daniel Golle <daniel@makrotopia.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729369632; l=1049;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=LBnesBq89KSC51zuhzUSl3t74J8Uundxu5xjmBRJm4I=;
 b=5XWXmVX0aTuUbbi65O7kwMZS1Hs2SdW8I2KvToKPxcjdMPBlAcKzFt1jjCUA9V9csr3UFhKo0
 kGlZUUDxvyGDH6CUMfTRSHLNrLzH+Ri6g6tTR3abywZKzYAe1bpkRk7
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_132716_716613_8484C9DB 
X-CRM114-Status: GOOD (  10.10  )
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

The 'fw_vols' fwnode_handle initialized via
device_get_named_child_node() requires explicit calls to
fwnode_handle_put() when the variable is no longer required.

Add the missing calls to fwnode_handle_put() before the function
returns.

Fixes: 51932f9fc487 ("mtd: ubi: populate ubi volume fwnode")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mtd/ubi/vmt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 5a3558bbb903..e5cf3bdca3b0 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -143,8 +143,10 @@ static struct fwnode_handle *find_volume_fwnode(struct ubi_volume *vol)
 		    vol->vol_id != volid)
 			continue;
 
+		fwnode_handle_put(fw_vols);
 		return fw_vol;
 	}
+	fwnode_handle_put(fw_vols);
 
 	return NULL;
 }

---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241019-mtd-uvi-fwnode_handle_put-7b220d2778b5

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
