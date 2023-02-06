Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5266C63797
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Feb 2023 08:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rGwdqvkqtCZ9vP8aNRKxB5eECIywmYwg/kKf/QJltwY=; b=NPc1p091T0+RER
	CJW0avpoYubXd+cCOjUcPSTmTo64ek1q0vG/jE0Ifd2ow23696qB1HjIRaN7zMa4ySzL/3dWSUKA7
	2SoI9AePzvzc3Wpl2/ibtdt/KR3+rWXqPvoL9IoUM/75AgBY9erCpxiRyxatfs8izJDv7i3dxnuu7
	cO5eUAw8ybvL+MOuWakqo69PRLAZdFckwwGMYdAGr3ISLjFYBkMKBF8zc/kQY/qu91Vm3TIQ+CyPA
	2OQlRPRk6kXVkZVo2SQYzq2yV8PS8Fpe3tOTz3u3oyVlzN1jrT7mfCjbyc0IkVtERzVRzq7MF8SlG
	IeS2qOK9B2srXBAeUlOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOx5A-007jmW-FG; Mon, 06 Feb 2023 08:42:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOx54-007jjB-Eo
	for linux-mtd@lists.infradead.org; Mon, 06 Feb 2023 08:42:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id bg26so8101573wmb.0
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 00:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XB56ReBTUPACcJGAKGiDdljlbrakSxaa+sKCXU5oXMU=;
        b=Vn10BSiy6jAq/2gf2LFgV2ng9XowMqLwLRsYWG/uRPcSMeVC6ZxTPq9WxeZzTDJjSU
         APfOIRcjVdz/TxJhAWC5imiAFjV/+i5l+JWsQBD1AntodJ+POsUJ/7+PYkgkJXtjuljh
         mLWwIUKq8HVESDoYmGSvyKV8oNKvdOZkhZn0tQy8NkRiNQldIwtGuJcVW6Mr+UKe2BXE
         pP/hgkVu14+t1WXIXmYg3xIseSpOmxjuPrp89MQLe1Q0z2uv1gwUdWxffmNpZbmuQZHr
         ObiaAnr4gGSvv5dmLQv9L2fZDRr72rm0W90IixFO/H4AyrKfe/NSy2ntdrjY2nQvEXtu
         6FIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XB56ReBTUPACcJGAKGiDdljlbrakSxaa+sKCXU5oXMU=;
        b=V4rYcPdUVA7N/WjlUnXgvUydXdXA6LgcmX2vJgxQG5lCPP+tm+g8M1r6qfEPa6dyoA
         Bb34q2k2WEgsIf6pTKVzanx5Iidm1TFXOWTfDWtWfOyWriSPcYr/8AYlo+xItMA07bji
         fc7vK4RKs2a70TKZ0kohocDfyZKRHTRGV9H9+009vE4W1/9y9DYv2uUJrND9PQ5TFMks
         aGBoQNJ/eMeHQrGACg8jdsKDuy1EKZpoxVRasxUmd5u9ukR8eqIB4ZElGNeFyoJCZAm/
         VKcN78QzdLMbthoGTgSsc1NQE3Wxq5o2XAP/rYrgQBKEzrUJm35CdnK3m5kkmnQ/ZUlK
         46pQ==
X-Gm-Message-State: AO0yUKVg1uknXDTIYr1RzIf0Q77WM3+Q5yYULb8j1SVSehLteaAU28UV
	26945D2aRDmTdgyltQ23hMg8hxYK53BItLNf
X-Google-Smtp-Source: AK7set/gnVYt0Sutq9CXeoTrPfgS+nkOq1IYzBux5uTgqcMKNg3gW43hYhMOIhIjOWfk5wvAJs8tkw==
X-Received: by 2002:a05:600c:3795:b0:3dc:4c4f:6dc5 with SMTP id o21-20020a05600c379500b003dc4c4f6dc5mr18561434wmr.9.1675672946989;
        Mon, 06 Feb 2023 00:42:26 -0800 (PST)
Received: from 1.. ([82.77.80.113])
        by smtp.gmail.com with ESMTPSA id h27-20020a05600c2cbb00b003db12112fcfsm11225960wmc.4.2023.02.06.00.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 00:42:26 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	lrannou@baylibre.com,
	Alexander.Stein@tq-group.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: Fix shift-out-of-bounds in spi_nor_set_erase_type
Date: Mon,  6 Feb 2023 10:42:22 +0200
Message-Id: <167567282460.10447.5187058692284159203.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203070754.50677-1-tudor.ambarus@linaro.org>
References: <20230203070754.50677-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=oJ4Zqpvnk5LS+L+rrTXXcBn8eWT4XuMF3QLF0FeS9/g=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBj4L1ssmL5NAyuWEun1zWFxniM0RMOTMeTy/sZp I92+zmSthGJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCY+C9bAAKCRBLVU9HpY0U 6T80CAC4pYeNccEjxE/otjp2bJMD8ROqAV1KRfPnbN/Kv88zfhuEUmuIcqT5+6cPWc5ekFNnxfz nBnEJsd+437/8EW0ZvHa8t22cUianEmsDrZbo+4WaNIG/NHk6uf+V+IqVRDN3Hgz2UH1M7n/kRI Wq5sXd0I+pnH97WASvDTkY8wSlelFzVHwciJv4BMppx77/seThwJf++ljEJxOgmmg2SRCpA9dU1 wr9JhPpu0Nlu1HoOx0utLRYwkSSUUM+AeK2pg8z54WwO+smVEgCpFKAdhdJ1ZkM8W2SdGlW9rzF Wm5uMeIcUCsV0w7GPGfx4LY2xMz/j68mrT9cUqSUepN33aai
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_004230_516491_DA36D6DB 
X-CRM114-Status: GOOD (  12.28  )
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

On Fri, 03 Feb 2023 09:07:54 +0200, Tudor Ambarus wrote:
> spi_nor_set_erase_type() was used either to set or to mask out an erase
> type. When we used it to mask out an erase type a shift-out-of-bounds
> was hit:
> UBSAN: shift-out-of-bounds in drivers/mtd/spi-nor/core.c:2237:24
> shift exponent 4294967295 is too large for 32-bit type 'int'
> 
> The setting of the size_{shift, mask} and of the opcode are unnecessary
> when the erase size is zero, as throughout the code just the erase size
> is considered to determine whether an erase type is supported or not.
> Setting the opcode to 0xFF was wrong too as nobody guarantees that 0xFF
> is an unused opcode. Thus when masking out an erase type, just set the
> erase size to zero. This will fix the shift-out-of-bounds.
> 
> [...]

Applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: Fix shift-out-of-bounds in spi_nor_set_erase_type
      https://git.kernel.org/mtd/c/f0f0cfdc3a02

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
