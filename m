Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3646C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Oct 2022 05:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u/YTiZbiQdprZH5QlKvVcLQqDyqsLzB3eBN993bru5o=; b=PyIMpjtgunxD6T
	SsHH7eO6AyZKKhUew0rlYUAw9G4hs2LpI7TUL1nxMUiryyswRbw6/XFWGA3w9GMG7ZPV9Vr10dCTn
	q+TmY9WuRdvZ995c9S9+wzE2c9FumhynyMIu0RYfYThpQaeg71LP83VwNIcr7KNXbiV9NxQ7NyycO
	UxyTWEB2TNQBjCw6VNhrY5Mpl09W3ibIdoI9TxHt6uhUdxrrPL/6Uoq9oyai6Pmko+7wSAVanu8eQ
	/UERCE1aZL5lTz012ejK5pG0c7rAaPu8XCqwNsxMSUwLWnPoZAWtaL8b/5K3XrellcZskCjOjyHt/
	bKhBNCqh0RuYwZFPW+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiTtz-006qVx-Em; Wed, 12 Oct 2022 05:03:31 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiTtv-006qUG-QH
	for linux-mtd@lists.infradead.org; Wed, 12 Oct 2022 05:03:29 +0000
Received: by mail-pl1-x62d.google.com with SMTP id 10so15290270pli.0
        for <linux-mtd@lists.infradead.org>; Tue, 11 Oct 2022 22:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qAu2S8e+2tE0eH9tctOcNAV0p5SCda3f3su8DqnpP+A=;
        b=ZXUvOwZNVAxZ3bg1JfbWuEP6AKK6Zv3pH1MdDsfkHLf13ASm9iPcLBhuoK3fW+lXUP
         UDvXzOiJsOA6wXPk2V/xRPKOYLp0wxzk/0r/TD7vFJ+4MmuaakHqYnKMvoOWlDgFfRXj
         kxC+wACXkPQIB7qLmbTntadIIVwRAFF7gYFPyp53s14F0nAqsuTnq0PqXl1SZTNX8lxh
         SDdjhN4OpN1sgx2ZByaqNLFL9nFP4cQdoxv7N517Xq7r6Nrc9UvpS/VGewRo34TjxMAe
         /vj8qNDIpQ6yiDLlFbed9t1w49bucJn36uNbqazByXwBm51xCfszJSRXWLiNsmyEwkCJ
         HE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qAu2S8e+2tE0eH9tctOcNAV0p5SCda3f3su8DqnpP+A=;
        b=CNAJgdp/n7n0bOM9bmO9BAJ8gOea9nnSjvu42shKUmIBkxjf5vx5eMhx7ziTctaiEk
         UKW+mHB6ALSJ/RgoE4E1vqMeNA6JtHTSwcjZ72tKq1XVSdE7nnyCilBprhh09x3EIUwv
         V85WZ6kObid6pgQaaAX1YPI4wQVNtDilUYqYQGnOCzzMOt1VsO8pxqb1XaGOpAlk2yI7
         ZAMM/mN2KQizNAjHVktrmgfo9MiussGH6WBNx0SsZhAqI0+hm9nxHkXjViNJV2qfmVcd
         EHdB55z5Ifwv65H/EjYedBWUD9irXHnD1aqT3lW52WevlRloD3GV/1tfLpR83nE0+Jg5
         aZYg==
X-Gm-Message-State: ACrzQf0tmie/eptM1KOx6DXRE+DLsxp9iH7dMKq14BPOvTWl1wo1x9uY
	FJbiPoPOPqi2/dsS0MXP7Ag=
X-Google-Smtp-Source: AMsMyM4DjGT/kggEC9r4OWD7mMt3C4iScZSl7MqQ+2oftyVURCyiMkQiu5DpxkcVF5OA0hJgmy6k9Q==
X-Received: by 2002:a17:90b:1b0a:b0:20d:3d06:b6c with SMTP id nu10-20020a17090b1b0a00b0020d3d060b6cmr3000336pjb.99.1665551003473;
        Tue, 11 Oct 2022 22:03:23 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id w66-20020a623045000000b0053dea60f3c8sm4995431pfw.87.2022.10.11.22.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 22:03:22 -0700 (PDT)
Message-ID: <8ab9c403-297d-056f-027f-414a1eb35fd3@gmail.com>
Date: Wed, 12 Oct 2022 14:03:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Discover current address mode
 by CRC
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro.Kuwano@infineon.com
References: <cover.1660291281.git.Takahiro.Kuwano@infineon.com>
 <53d37eead9bdd09744af555b93381af477643a46.1660291281.git.Takahiro.Kuwano@infineon.com>
 <bf12251a-dcc9-0d64-7229-5c69cb461fdb@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <bf12251a-dcc9-0d64-7229-5c69cb461fdb@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_220327_905432_7110CC42 
X-CRM114-Status: GOOD (  17.37  )
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

On 10/5/2022 4:10 PM, Tudor.Ambarus@microchip.com wrote:
> Hi, Takahiro,
> 
> On 8/12/22 11:06, tkuw584924@gmail.com wrote:
>> +#define CRC32C_POLY    0x1edc6f41
>> +static u32 cypress_nor_calc_crc32c(u32 len, u8 *buf)
>> +{
>> +       u32 crc = 0;
>> +       int i;
>> +
>> +       while (len--) {
>> +               crc ^= *buf++ << 24;
>> +               for (i = 0; i < 8; i++)
>> +                       crc = (crc << 1) ^ ((crc & 0x80000000) ? CRC32C_POLY :
>> +                                           0);
>> +       }
>> +
>> +       return crc;
>> +}
> 
> I haven't gone through the details of the patch set, but I like the idea.
> I stumbled on your crc implementation. Can't we use #include <linux/crc32.h>
> instead?
> 
CRC32C BE is a missing piece in lib/crc32 so I added this local helper.

I have created following patch that adds CRC32C BE into lib/crc32.
Do you agree to submit this? 
We also need to add test case to crc32test.c.


diff --git a/include/linux/crc32.h b/include/linux/crc32.h
index 9e8a032c1788..adbfd886ccf8 100644
--- a/include/linux/crc32.h
+++ b/include/linux/crc32.h
@@ -37,6 +37,7 @@ static inline u32 crc32_le_combine(u32 crc1, u32 crc2, size_t len2)
 }
 
 u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len);
+u32 __pure __crc32c_be(u32 crc, unsigned char const *p, size_t len);
 
 /**
  * __crc32c_le_combine - Combine two crc32c check values into one. For two
diff --git a/include/linux/crc32poly.h b/include/linux/crc32poly.h
index 62c4b7790a28..ed5d81f61d4e 100644
--- a/include/linux/crc32poly.h
+++ b/include/linux/crc32poly.h
@@ -16,5 +16,6 @@
  * x^8+x^6+x^0
  */
 #define CRC32C_POLY_LE 0x82F63B78
+#define CRC32C_POLY_BE 0x1EDC6F41
 
 #endif /* _LINUX_CRC32_POLY_H */
diff --git a/lib/crc32.c b/lib/crc32.c
index 5649847d0a8d..15dc6f99ff46 100644
--- a/lib/crc32.c
+++ b/lib/crc32.c
@@ -335,10 +335,19 @@ u32 __pure __weak crc32_be(u32 crc, unsigned char const *p, size_t len)
 {
 	return crc32_be_generic(crc, p, len, NULL, CRC32_POLY_BE);
 }
+u32 __pure __weak __crc32c_be(u32 crc, unsigned char const *p, size_t len)
+{
+	return crc32_be_generic(crc, p, len, NULL, CRC32C_POLY_BE);
+}
 #else
 u32 __pure __weak crc32_be(u32 crc, unsigned char const *p, size_t len)
 {
 	return crc32_be_generic(crc, p, len, crc32table_be, CRC32_POLY_BE);
 }
+u32 __pure __weak __crc32c_be(u32 crc, unsigned char const *p, size_t len)
+{
+	return crc32_be_generic(crc, p, len, crc32ctable_be, CRC32C_POLY_BE);
+}
 #endif
 EXPORT_SYMBOL(crc32_be);
+EXPORT_SYMBOL(__crc32c_be);
diff --git a/lib/gen_crc32table.c b/lib/gen_crc32table.c
index f755b997b967..fcb90c496e48 100644
--- a/lib/gen_crc32table.c
+++ b/lib/gen_crc32table.c
@@ -26,6 +26,7 @@
 static uint32_t crc32table_le[LE_TABLE_ROWS][256];
 static uint32_t crc32table_be[BE_TABLE_ROWS][256];
 static uint32_t crc32ctable_le[LE_TABLE_ROWS][256];
+static uint32_t crc32ctable_be[BE_TABLE_ROWS][256];
 
 /**
  * crc32init_le() - allocate and initialize LE table data
@@ -67,29 +68,40 @@ static void crc32cinit_le(void)
 }
 
 /**
- * crc32init_be() - allocate and initialize BE table data
+ * crc32init_be_generic() - allocate and initialize BE table data
  */
-static void crc32init_be(void)
+static void crc32init_be_generic(const uint32_t polynomial,
+				 uint32_t (*tab)[256])
 {
 	unsigned i, j;
 	uint32_t crc = 0x80000000;
 
-	crc32table_be[0][0] = 0;
+	tab[0][0] = 0;
 
 	for (i = 1; i < BE_TABLE_SIZE; i <<= 1) {
-		crc = (crc << 1) ^ ((crc & 0x80000000) ? CRC32_POLY_BE : 0);
+		crc = (crc << 1) ^ ((crc & 0x80000000) ? polynomial : 0);
 		for (j = 0; j < i; j++)
-			crc32table_be[0][i + j] = crc ^ crc32table_be[0][j];
+			tab[0][i + j] = crc ^ tab[0][j];
 	}
 	for (i = 0; i < BE_TABLE_SIZE; i++) {
-		crc = crc32table_be[0][i];
+		crc = tab[0][i];
 		for (j = 1; j < BE_TABLE_ROWS; j++) {
-			crc = crc32table_be[0][(crc >> 24) & 0xff] ^ (crc << 8);
-			crc32table_be[j][i] = crc;
+			crc = tab[0][(crc >> 24) & 0xff] ^ (crc << 8);
+			tab[j][i] = crc;
 		}
 	}
 }
 
+static void crc32init_be(void)
+{
+	crc32init_be_generic(CRC32_POLY_BE, crc32table_be);
+}
+
+static void crc32cinit_be(void)
+{
+	crc32init_be_generic(CRC32C_POLY_BE, crc32ctable_be);
+}
+
 static void output_table(uint32_t (*table)[256], int rows, int len, char *trans)
 {
 	int i, j;
@@ -137,6 +149,15 @@ int main(int argc, char** argv)
 			     LE_TABLE_SIZE, "tole");
 		printf("};\n");
 	}
+	if (CRC_BE_BITS > 1) {
+		crc32cinit_be();
+		printf("static const u32 ____cacheline_aligned "
+		       "crc32ctable_be[%d][%d] = {",
+		       BE_TABLE_ROWS, BE_TABLE_SIZE);
+		output_table(crc32ctable_be, BE_TABLE_ROWS,
+			     BE_TABLE_SIZE, "tobe");
+		printf("};\n");
+	}
 
 	return 0;
 }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
