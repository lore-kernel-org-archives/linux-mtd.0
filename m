Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8ECC5AD7B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Aug 2026 21:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=RqHs+fLLLnGrFsb7VzgzO4/3e+2es3Of/U3uwNqRvKM=; b=gTD
	BlQqOUwvKnT5BdLjnpve3uxDrT/9bxMJ3T8QFb8/lLyu6drTdXhB6ktKRohdYHiIO+IZLFcArOiDD
	YL2TiSazAo4YbG6L1DiRDmmDHDII5tGr5fVaqdEZIsW18PWsWhlD9GuG2k4g/LtD7H1WKgCvvG4qK
	G1MO4GqrXOKwa1YyW6i71eb2z4Zzrba8XS1P0ZzJ7ou3hlEQcLjwBxDbixzXsgCi9LjkxPDgW0NZO
	Ri+J+ZVcnYgbTz5waJ3iNrwaK8mZkTrqfHHYT/QWcji3ejKKCmp0Silzgkd6GK2YWLqyZ02K9NJAr
	izgW9lWycA4Q457FlLpZJxBIrGBRcow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXFD-0000000Csmj-3PHG;
	Mon, 10 Aug 2026 21:09:15 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXFB-0000000CsmM-1FQ5
	for linux-mtd@lists.infradead.org;
	Mon, 10 Aug 2026 21:09:14 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-6681e7911b0so3422557d50.0
        for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 14:09:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786396152; cv=none;
        d=google.com; s=arc-20260327;
        b=UxbkpiBYWj3B03lZOIXctJFUm2AMtXNu3AKun54Pn1Ae/Wp2/Gty6LOgJou03oRIFG
         P5LgzOru/sbOF51cYnMcnFNAw+C7WFz4utFBBMYxBEuU6mb3BBiPt0y2wi+NPTdqcb9/
         MH+JriuyEldvkeGSqIjnjH5PJfpOWLNo4uQdKoyCx/OIcI/0Mqkhrwf+D3zvRTGUY1fo
         8olKTei9HDZCEiuLlyMb6hTx3v8AD7fthwEHKY067BFje9vZawk0g2G5TeWWgFOvVVA1
         w+31U14i/gOkumnahzrlOkPmWUx+2rkhJcRZ/HbKIq7GEs8n+bRPk8ULaLpRG9TIjxlX
         MlIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=O7+fA6nQxA55r1yu4tboOYLId14NXVmuuEexLRiMJDg=;
        fh=Gd4kRfoyr9WvSS9M3j9+RFhdcaNG97fzsqYHZ6IIOZI=;
        b=bJS9DL0zTyEyY3LWRKjgRylsvhfEX9fpVU5YIMdI7ex59u1828YvcUF5IYcSp5oose
         0vzcS2wqAvtDDgHoraBNcgbvszFZY6ghZlR4BYZmmbWAjpj1b+Nh0k1J21YwrR82juJq
         Wbzqqop4dIEAOdmDcKuzwu2Tce4mtHdoyaLxmINbf6ZiRX8AaGrQyTEbbATrPxRAgo7Q
         SHXxApM4U7A9MLrmgfFp7B8CbEDv3RLfKpSv0wLtUJU/PSWFV1zH7t7ZxU6PZbWp1EMj
         GKYMtXLWzIMwm2XR88NrAqxhrrXreLvYYWYRSPrVs/0PaPENiZ/JT9kcmtZ7Hd68acJd
         EPEQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786396152; x=1787000952; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=O7+fA6nQxA55r1yu4tboOYLId14NXVmuuEexLRiMJDg=;
        b=YD/V78ai9XIXSfveuoiVqepTnE33YfDY7eaZiGEHhthZ0mEGJJVt675BDm4JD8Z5gH
         pBQrpMw5sKOHX1zbcJ4H7xayEA/TlP24B93jrc3NlBS8l+4b0msFpCy0iRSWf9t37AwI
         RKRFO6vRmqOCUmstZGdQd6KJUa/neb0suJAz7kVCslqr1ld2xaxnttXqhnE9FlUhefFt
         x1OLL+gP+3AZVCWMRXBxEF19UZBWTVOEWFhPUklGJkMUMKNV2t8YWEiB80imPZrpkb1q
         gzk+tCK9uGI3MWeF7F7A4AsMhmj+xdyjrvROiDWuto2GUWMR5L7p0+TxNEki1NTPjX2s
         bxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786396152; x=1787000952;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7+fA6nQxA55r1yu4tboOYLId14NXVmuuEexLRiMJDg=;
        b=SOhHNOfSewMjEddlc2yx9qbPA6uLO3SGNs7NFZxiEkjSpRFL6x3YqfRCpImqBJDfR1
         payUapJWg5opzyc9pe4BIz+vrGbSVV6s0lKb6pSPTwhqrLH3SHeVop1Y2JxozPbqQf2U
         ufYd8R0LlfipAkBng3m31msYB98E4kdstYZnKxkCI40XPljHZ/FRKbHmh0vODOuVKR1G
         s1EGZ5KRhJsJVk7/aWz6oiRkcr0RddRk6cirgxJ3pkDmL6/s1GL6K5YVid80Gnd4Qm3o
         uBlovcUp/7LPo7tFawlS0hfgOdMSJAS7iFmLlY3UXr+VTYS5NgLY9alRpKJJoUuIgevo
         kKgg==
X-Gm-Message-State: AOJu0YyNNIEvFsu6GOpLLyWBoUlrvb6qK9dE8xsGahqK5TT/hhaJboXX
	ognZwWUNEO8BDL3wypC6OhRZr9v8tyfGDxuibx968x2sdd5jyS3ZoTgvtDK9kYNGygMY6MQRWMq
	eoXHpfs/yHT7hOVxNdc3imr/M8F1XckE/cQ==
X-Gm-Gg: AR+sD12vXo1DKDT5FihFZF+4mUMjuRKnhSS9NF9bmTZHcQcVGXC233w0BBDuOT48LA0
	VqaBzBszfRCoP9GTLLvyfell40ZvoilUYmlMqts3Ds3cHjFdEpYk5it6KP21ry8a9lwwOBWKXDi
	6L66goDYQPw60u5u0gw8YGSGiVZp5hOuM+3DcxaZSopmO5B2fH+t4UHVlWtKrKGOgdNg0cG4//6
	Vham7b449Ndi3Sdgr5zdEDngGO9+KfBzD3Dj+pZA4iBK4Vu7zDfLB2Kq0opOIXCcPKRZaBlqgo3
	QJSlqrIMqXb7iWN74NSBpEbCgV446Yqd6IW+i0FiNIc=
X-Received: by 2002:a05:690e:4551:20b0:668:8286:1123 with SMTP id
 956f58d0204a3-6699aca4c54mr20445020d50.52.1786396152072; Mon, 10 Aug 2026
 14:09:12 -0700 (PDT)
MIME-Version: 1.0
From: Kyle Abramowitz <abramowitzk@gmail.com>
Date: Mon, 10 Aug 2026 17:09:00 -0400
X-Gm-Features: AUfX_mw9X1wWXaYDO2P6k0qfBQ-hwG4eJ3flMJXwpyqILMBI2KuX18jTl15dMqQ
Message-ID: <CAAbNe083MrxKmSB4JN8WhO+Gjomgt46k4CLi1k0D8kQ0GpTVGQ@mail.gmail.com>
Subject: UBI Static Volume CRC Corruption
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_140913_344557_CF89B480 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

I am working on a NAND driver for an MT7620A and a Winbond W29N01HV

Something unusual came up in testing. An erase block that is bad, but not
yet marked bad is causing `ubiupdatevol` to report CRC corruption on its
validation pass for static volumes. The write and erase functions do not return
any errors as they do not do any sort of readback validation. This
seems consistent
with other drivers I see in the tree (Kernel 6.12).

The issue we are running into is that we expected UBI to torture this block once
it was discovered to have unrecoverable ECC errors. But after tracing
through the
code, we found that the scrubbing step is skipped in this case and no
torture happens
so this block never gets marked as bad.

My questions are: what is the proper way to handle this? What should
happen on a freshly
discovered bad block that has not been marked yet? Is it intended that
scrubbing and torturing
is skipped on crc failures in `ubi_eba_read_leb()`?

My hope was that it would get marked bad eventually and remapped to a
new PEB so a future
write would succeed.

Thank you!

Kyle

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
