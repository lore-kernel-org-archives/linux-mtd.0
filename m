Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DC0C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 07:26:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59B92206DD
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 07:26:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r6bpLeye";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSBx059H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59B92206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OP2QuGQKLPrZFP2CDMPF5mtVUcWXP642N9mYT+Xhrr4=; b=r6bpLeyewBX24Y
	T+JMUnEaDSegY8Quf3Yok4+khZLF/Rb3AQMGcFDLh7bpqkO02xCSKVxysgsxKfw3qmEi13Sfa316y
	hkU/+NyVukUC6H6LLL6fq17mOjuLkIVfq0IN8Zk+Uw+AQqfhsLwEgDYEfl3dSNjOLRcW2erXgPs+j
	nS974b4hLi883uk6Of9232FNFEUDdJPXgvG4a74ch7tcp/ywTt9Ib8svqLwIJUeQtliQpggm90xuA
	cSq/+UlFiHvroJoYhAP0UcCSqTSHZQ4UsuDsuLAwsYS1ErmmVwiiqKW5rC7q8e0fzEbkCKxzGkud5
	Ae1ypOB3KyWA6dYkbMsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc24e-0006tW-D5; Fri, 22 May 2020 07:26:32 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc23i-00061J-A8
 for linux-mtd@lists.infradead.org; Fri, 22 May 2020 07:25:35 +0000
Received: by mail-wr1-x42e.google.com with SMTP id s8so9118011wrt.9
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2020 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x75i3phefTR1ORx78SyNoqoxRqG/EDeVxeevNjATQeU=;
 b=aSBx059HVjfRZfYYo4tcdNKvhRS60qhw9XTOESwG7HB/GkNu9mep0pZvm/YIhUT2tj
 WLLdW5JyDPTNRc0+tvgqXqnA+C3fJ61PNaVOMzpslIUUfbL2ckAqfqBCmEah9PkCwQGq
 EgvzT/KTrGaaybjAtO2Egrf4DjOkEOeF/NOm/TDSgd7tKCxIGt0/B1l8ZpISpUkUwNat
 BOAXjPUas3lzvtT41X/ZG/Ndy04BqemTVltecc75kPqOX2iR2E9VP3pQ3ufDWXruBhlF
 I2oADb+qEwxx7mg4qG9iw9lQoAX/QkuxDxpHoAtMvlThdtZL+oUzb/hhDsvGVjgKMQ/9
 oHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x75i3phefTR1ORx78SyNoqoxRqG/EDeVxeevNjATQeU=;
 b=pUQO0sUTK21FQiwbCxzUNv5+nwNd9zparIgpRxv4ZbDM+OipLxEvylEIU7mUDptW9r
 UI7GpNx/pKRmLe6g9kZTTVp+WZiJW1IAoI8I8rcKx5OzNKiV+skToco8zmQGvJblq89k
 tPifVOD01nZRQmjYgaQ/zWqYSYQ4/XFY6QIdKpzoufJOUAoW7EAHOV+/ACxYoBn6QTIe
 F7V19xXZ0MQxNq6wdbusrMWlfCH0SN2/lV5Yuo6C9N0UPK8Z0cs0IECBluH9/g3l3jTQ
 ImQEZ3rY8njn7oOzoZop3QmLe/wEV2RrcK2qyZnqsk4A/x4laz6dNsUe1PMVpPc+YzHa
 panQ==
X-Gm-Message-State: AOAM533R09CkPCFAmmL6OVkAFTQhfC9lafsA+YQDweazVtQLXA7r8YP/
 JXseNa32UMVgpKVRAJ3w3qI=
X-Google-Smtp-Source: ABdhPJzjAc5EN2K3mse8zYF53gQPuxy/iTC2y7LkytXy6k11JuJnEwAzwliXSlmQ81PWickoLvPEYw==
X-Received: by 2002:a5d:4c4f:: with SMTP id n15mr2349097wrt.249.1590132332654; 
 Fri, 22 May 2020 00:25:32 -0700 (PDT)
Received: from skynet.lan (159.red-83-44-12.dynamicip.rima-tde.net.
 [83.44.12.159])
 by smtp.gmail.com with ESMTPSA id f128sm9299898wme.1.2020.05.22.00.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 00:25:32 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Date: Fri, 22 May 2020 09:25:24 +0200
Message-Id: <20200522072525.3919332-5-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522072525.3919332-1-noltari@gmail.com>
References: <20200512073329.742893-1-noltari@gmail.com>
 <20200522072525.3919332-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_002534_364527_2ECC6878 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QWRkZWQgYnJjbSxicmNtbmFuZC12Mi4xIGFuZCBicmNtLGJyY21uYW5kLXYyLjIgYXMgcG9zc2li
bGUgY29tcGF0aWJsZQpzdHJpbmdzIHRvIHN1cHBvcnQgYnJjbW5hbmQgY29udHJvbGxlcnMgdjIu
MSBhbmQgdjIuMi4KClNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9s
dGFyaUBnbWFpbC5jb20+Ci0tLQogdjM6IG5vIGNoYW5nZXMuCiB2MjogYWRkIG5ldyBwYXRjaC4K
CiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQudHh0
IHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQudHh0Cmlu
ZGV4IDA1NjUxYTY1NGM2Ni4uNDQzMzVhNGY4YmZiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQudHh0CisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQKQEAgLTIwLDYg
KzIwLDggQEAgUmVxdWlyZWQgcHJvcGVydGllczoKICAgICAgICAgICAgICAgICAgICAgICJicmNt
LGJyY21uYW5kIiBhbmQgYW4gYXBwcm9wcmlhdGUgdmVyc2lvbiBjb21wYXRpYmlsaXR5CiAgICAg
ICAgICAgICAgICAgICAgICBzdHJpbmcsIGxpa2UgImJyY20sYnJjbW5hbmQtdjcuMCIKICAgICAg
ICAgICAgICAgICAgICAgIFBvc3NpYmxlIHZhbHVlczoKKyAgICAgICAgICAgICAgICAgICAgICAg
ICBicmNtLGJyY21uYW5kLXYyLjEKKyAgICAgICAgICAgICAgICAgICAgICAgICBicmNtLGJyY21u
YW5kLXYyLjIKICAgICAgICAgICAgICAgICAgICAgICAgICBicmNtLGJyY21uYW5kLXY0LjAKICAg
ICAgICAgICAgICAgICAgICAgICAgICBicmNtLGJyY21uYW5kLXY1LjAKICAgICAgICAgICAgICAg
ICAgICAgICAgICBicmNtLGJyY21uYW5kLXY2LjAKLS0gCjIuMjYuMgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
