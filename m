Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B69CF34D7
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 00:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:
	Message-ID:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NTSMGK6GIK1lGBAQMGf7SN+59lONX8SAzHGoT5W22/A=; b=q1zLXeV+o58JsW
	SFCVWf4XPbfw7RMXMQx3aMkAzHP5gs9L/n3KEmhnx4qbtR8kQcBo317NBewchSxsabYzaF4ACgznd
	AoaEYDFFkgzRuF/qqaIHP+SO7dbIyv+rq/tEl0DbadHlWfSfUVQbGDFcUbSJERJS/yfV/sVum0MNk
	5apnttQ1PpEZpUs6NvKDc2OM8PeyzoMjo/Uh9MyMSbLUfMwFdZTXCxssr7wUGxMFOpkqQgDRZ2CEV
	kSYy3LLzoYvE52v7Qplp44OEMhTpjsXrLd5KjUVlgSyCRvhhKdte80w8NE0kqTBUkNNhRMg1bra/L
	cVvUmLdlPxcsU1O1WivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swWBy-0000000Ajec-0Lm9;
	Fri, 04 Oct 2024 00:29:10 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swWBv-0000000AjeE-0pfT
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 00:29:08 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e07d87adc2so208251a91.3
        for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2024 17:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728001746; x=1728606546; darn=lists.infradead.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3MYC8SASoZ/ndWRkqJRsLIGEaMN4yR8qugkGycdBeU=;
        b=Gkpx7KgM8Jt2G+ZCNT+wjmlVSBFpIoTssP+u2FbgLBVZX71YplMKCXRxt/f5TZldo3
         aGzfqKQIFepSBWnl8l7866i4AFA3umN+FcScpoGxLJlaRNjo1NhDS9SO58MNdEifRiWw
         hnR+PCmm5f3q2SGW4sWFXSCBMU6p2ou5bgnN/yTU57V+ESrF/1mAACp+rWjI+gzhYqux
         Fzb5oW6m3fhAsEgdXnrfWQ/eLgouwOGfyfPcqnlEewfENnsynK1PJuLKvXoufmdlW7LK
         7+X7nZI30/2DrJakEW+0cW9UC9J/YqCr2ZXPLKcGOHk5oEXBPDgMHn/9jY/mQJAO18gN
         HRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728001746; x=1728606546;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G3MYC8SASoZ/ndWRkqJRsLIGEaMN4yR8qugkGycdBeU=;
        b=mY8GUHREgFYjMK78cdt+/9nrRhzhRkW0td3yWy0s95p/AT+RwT4Oi1SeevWSHOvmMz
         tc4azN38E+AaLeFh/IVSzg+vbfdVa3wg5rcF5gOUCmEgnLxJF+pLsrJhvUnEAHxHPY1s
         pzB0ynRh2lbsWWAUC//hOXhI0+suQILOU2Ae+Oc4aLO53VLxBwRtsiO85yTPgeEFTMxq
         lzy1bZkU/RhyN3PXs0J7BcEYnfsN1NjwYaY1dVQupdR3FqZVlua3sr/Eu187KeOuzotO
         UHDbKMZVQOTbV1wVdPp+QIVbCK/bpyEGtDtax/qkfrwz8IC4TvPmqJboqJT30YSc+yik
         DKHA==
X-Gm-Message-State: AOJu0YzZCbaBPWoe44MsEu3XBFekHv7/MogLmMmydcFH1zV1+QfSkQ3c
	Tn9SNSdKN6c8xV0gkTKZQu/uNcXMEnIhJb0nqDc0mwgE7sWzgKi1q8nmyg==
X-Google-Smtp-Source: AGHT+IHQzExoCqASNIB4kS9uKCpwP2xfW+pF3WIDuSG2bmUcxSySe5TksRULZNdshxzrOHdxqyFFhw==
X-Received: by 2002:a17:90a:b112:b0:2dd:5137:a9ca with SMTP id 98e67ed59e1d1-2e1e63ea3a8mr413944a91.8.1728001745735;
        Thu, 03 Oct 2024 17:29:05 -0700 (PDT)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e85d93b1sm147650a91.25.2024.10.03.17.29.05
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2024 17:29:05 -0700 (PDT)
From: "Doris M. Support" <herikaeronna73@gmail.com>
X-Google-Original-From: "Doris M. Support" <helpdesk@sourcemedia.com>
Message-ID: <fdb4e851c0ae1b275a84a60c3829933b7db9069ed8d3294de1eb3c80de5c60ba@mx.google.com>
To: linux-mtd@lists.infradead.org
Subject: Oct 03 2024
Date: Thu, 03 Oct 2024 20:29:04 -0400
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_172907_246073_24FA25CC 
X-CRM114-Status: UNSURE (   2.68  )
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
Reply-To: dorisjmiller80@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,
I'm giving out my late husband's Yamaha Baby Grand Piano to any passionate instrument lover, kindly let me know if you will be interested or have someone who will.

Thanks,

Doris.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
