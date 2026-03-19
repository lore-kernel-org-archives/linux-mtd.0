Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD4D108E1DE
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2026 17:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=15AE/6YSA+G2TxFX4jy1bj5ZBOMbD+98F49AH7gWPjg=; b=wk+
	5TkY0IBmd0Bo4IqcWIIXlZAGcb/tfh0NsJ55q56enqmXEhDnrSU00m2iZeNwpUZG8RyhTqKoaOwKd
	68GEJ4QiISrw8mpHjjHfJvDZGxFRvLsp1k+W4CSoiCBC+j0OGj8DdRuFvQnrfgaiy9glzitbFEBn/
	d+uENuFA6IEBPSxedTcmW99e68dRBjMhMUXMJ+mIKgScln97RFVxl88cNJ9k/49ijU2UE4c5St7sB
	OgblVDFhhBJchrElA2rK1I67YUP5sF/xWRPgkuCA/dopQGMVYDNkmszVtp6KwShAccqiXycJZhc4y
	VmBKS6sgjAV/m78B8GM4vWoCGFE3Lng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HKQ-0000000BDV1-0PjX;
	Thu, 19 Mar 2026 17:38:38 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HKN-0000000BDUC-3vQy
	for linux-mtd@lists.infradead.org;
	Thu, 19 Mar 2026 17:38:36 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8cd90401034so121094885a.0
        for <linux-mtd@lists.infradead.org>; Thu, 19 Mar 2026 10:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773941913; x=1774546713; darn=lists.infradead.org;
        h=subject:to:from:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJRoV58KNFRYUDwSxg+VBqy2IuPEYqM9EsxeaaznOsk=;
        b=YVm1vCsWDgS6n74gZPs7Qmhxmix1ybHvX90FZSlxq4bRc88Wp4NOogyLDcGwyWBHgv
         Vo3w2xfBK/sDjFtZRfAvB6iGJw6lMpkeYaNiIdvAbx1WtnAeot4ZB5qJWsOMIiscJJ0S
         H4C4r/vIwAFACBM5Z1JJqMQW27uM3uXibwJ1F78kEeEaN/XQyHbHbDSyxDEQLlk6dRjD
         d/et7KiALpP80/PU9wSnCR8+L/x74HuTkQRBiEGhW12xUI/Ufnu+uQCh5S9dlN6kUbLg
         C7yMsD6GqHF0py4fE/NN20DVzMwlgSQdNwkFFagq8rd92w3qyz5FxI9iFfqTbCd0iLNh
         dE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773941913; x=1774546713;
        h=subject:to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lJRoV58KNFRYUDwSxg+VBqy2IuPEYqM9EsxeaaznOsk=;
        b=Clq4lZrrvjMqDci3cSHpu580EswUcKuZlz6BDxZsBjQ4xGFEfCcNpNkdWzNoXM/2Os
         qFGOGJgO6n5DdZxOIahVWU7v+FiPU4h5GSs4YAkw0BSCijP+V7zy32r1GRQfim2XAoR9
         nD4iuRop7nqSYxIjE4xV93ysHVGth8a+AMSje1msetklLayX0OdUS5dTXvIVAssMjyo6
         5UiKMF8omVg0LmxXbt8ccaZ8G/RdlNBcI4WZ0XnkzBwc02M9ofm/2xK5UXaTS2kDB93r
         PbkYHcTVpwLwpniZchrfoqFnJua/OyRInVWkvjQfmdm99X7gaVeFfM6VBafRpuNtFwCG
         uRSw==
X-Gm-Message-State: AOJu0YxXi7Y55s75UEu8cABY7vpPZqZXN787GiPpcBg/6RCppscNF54e
	8yaxivRwkju1QzY2Et9paNfeHw76ifFdKaS2ox02SDiJSPNR+PZQy513oMrB4fxwFb8=
X-Gm-Gg: ATEYQzw+xpnr50L6zr3PcDMR5YuiOyZ+BBFSYGCSl6sLs4U4IYpURTyubax43+go9D1
	PhAjhTJnOz5S0gkPo0ZAjUTkxGZ3L68Bsv/Iwii3KU9/1VcrQlnV8yJxDeCkBEu22HT0DP/YFzu
	gHq8g9oGhWoOjw9503KtejOeSmIdhA/FCDaP7VQ5SN8lx6ZywJAxG8c+25PrHmVYxmuj4VyKp0P
	E6NpC74APxHEX4ObzMAVwTWvag7oeOecN2E2r3rMctPenlrgpMCghdAZtcOcOi5jSPoe+3XH7tg
	vouuZNnYOvQUrmOxYZhtOOMqpz2DTBTNAjO6sMS73Txv+T+sVaJWTNLMmvdebeGD7ALZj6b2QXn
	t52OM5OoZGpm4bJ81K3txyGeL1AXv8kSExHbFdXJwOAtNldOpuX2SbRaCZCBATl0yDJkttwley/
	L5qYSj+AZLR4NJYKNPt73G087va4Ho4rUOwS160lAnykmBJ4+EOcNrPTo77+ENwTu0yY7/4PjgV
	xGFUqFDMXJGu7ySpGKBL73bN2RQNaR/AHpCz9vMF4bmcy0=
X-Received: by 2002:a05:620a:4009:b0:8cd:c011:d7e3 with SMTP id af79cd13be357-8cfc7f85d6emr12365685a.65.1773941912575;
        Thu, 19 Mar 2026 10:38:32 -0700 (PDT)
Received: from localhost (ec2-18-188-34-132.us-east-2.compute.amazonaws.com. [18.188.34.132])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-8cfacdeb785sm507226385a.16.2026.03.19.10.38.31
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 10:38:31 -0700 (PDT)
Message-ID: <69bc3497.050a0220.106615.0122@mx.google.com>
Date: Thu, 19 Mar 2026 10:38:31 -0700 (PDT)
From: johnadeboye74@gmail.com
X-Google-Original-From: PayPal,LLC
To: linux-mtd@lists.infradead.org
Subject: Invoice Notification from PayPal,LLC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_103835_971005_4E2A43FB 
X-CRM114-Status: UNSURE (   4.82  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5059108042093955937=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5059108042093955937==
Content-Type: text/plain

Subject: Upcoming Subscription Renewal – PayPal,LLC

Dear Member,

Your PayPal,LLC subscription is scheduled for automatic renewal. The payment of 315.5 will be processed shortly.

Subscription Details:

Subscription ID: 5086-QZ-8290

Member ID: 54879-9187

Renewal Amount: 315.5

If you wish to cancel or make changes to your subscription, please contact us before the renewal date.

Customer Support:
📞 +1-(805)-609-6469

Note:

This is an automated notification; no reply is needed.

PayPal,LLC will never ask for sensitive information via email.

Thank you for your continued membership.

Best regards,
The PayPal,LLC Team
425 West Silver Eagle 1 Sacramento Ca 95834 United States
+1-(805)-609-6469


--===============5059108042093955937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5059108042093955937==--
