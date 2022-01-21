Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FCFC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jan 2022 21:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+IWUdXjOGZjKU9sin3EsL74x1mXE5IlLZDaSilkMjA=; b=N++KDVXJ+U5cHM
	1uwVCmHn3SG2IDbcyWoUL7Ew7eFWZ9SB0M/koAGp2emzLsdkUNUyiXHrR3BvmTI7x7kCGryb5wTAL
	+kQuzLyYyYxRsmsM2q6Ewyn2wJwTVGVenr6zF3TDzIPBzT5BsXl5yMiIg+4YYaWY0aeqiRIb8N/Y5
	1bOH6lD0AbyXLQZ+c8UP4eVOqi9wExz2oHlDV60N6hYUeUKshEsBEQrSJ4BFnvn2cHWxgSmPiu2wx
	eZPDOSDoRu3GpQcoJo0SN4G0vCelGrWiaIABSU/AL6PFae0BjfJyoj8Un+OZxKF1GeX6f9K2vkC4L
	P8aC5v/rGZT8nCskqfbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB1K0-00G7Kx-Fa; Fri, 21 Jan 2022 21:19:48 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB1Jv-00G7Jv-Iw
 for linux-mtd@lists.infradead.org; Fri, 21 Jan 2022 21:19:44 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 l64-20020a9d1b46000000b005983a0a8aaaso13377359otl.3
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jan 2022 13:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rwc9GxUTej2WnJMc0e3ALPik20sHOJTxdJgSjedRgYM=;
 b=e0EYcNjNLkMnsuTGRr66Fvi3ocFbbstRXySzvDfVv9UTs7ZLvM3QBu0NaoUNJHlY9M
 oCwf88qFtYTfv/O6qC+bs6gVC09LMpxfciwOZWQ9Mv3ut84884qPg7eJtIJhQLyRGKZl
 rrTdtmzMwFql6pXM8ua7lVgbhm7Y1U6ephK3D4MogWk87EJag2QBn7Qat2vpMaGqkze4
 Zg0c8uVzcXWC6szb9yF3o7pPtAppq0zU48HIskoKbU0KSs20RckMZ2pyrYvJ4yWyHwub
 /J4j4uoDHu+jJS/STNY2U1r8NbTGMoN+6MlKqb4lhKfVTPJNB/j5qepJmZ8XDD4908Q7
 jBmA==
X-Gm-Message-State: AOAM532qgvslPqQNINdtAsR7oWTS0zDyc7IBbWwEbt0WkNikDa/FbCPe
 DMWt29zVqkX5Ej9ODr7IbA==
X-Google-Smtp-Source: ABdhPJzbNnH7DDBGJ2KNG4hBF2gFhO9Qk8NiQerrT9EGNcWyi7kzEHZbIoK+YEXVUQe0ZMgoi4p0gg==
X-Received: by 2002:a9d:57ca:: with SMTP id q10mr4195836oti.180.1642799982173; 
 Fri, 21 Jan 2022 13:19:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g2sm1614084oic.40.2022.01.21.13.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:19:41 -0800 (PST)
Received: (nullmailer pid 1602431 invoked by uid 1000);
 Fri, 21 Jan 2022 21:19:40 -0000
Date: Fri, 21 Jan 2022 15:19:40 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: robh+dt@kernel.org, miquel.raynal@bootlin.com, vigneshr@ti.com,
 richard@nod.at, chenshumin86@sina.com,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org
Subject: Re: [PATCH 1/3] dt-binding: mtd: nand: Document the wp-gpios property
Message-ID: <YesjbOzh+B00dKIh@robh.at.kernel.org>
References: <20220105135734.271313-1-christophe.kerello@foss.st.com>
 <20220105135734.271313-2-christophe.kerello@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220105135734.271313-2-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_131943_643986_F7B354DE 
X-CRM114-Status: GOOD (  10.19  )
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

On Wed, 05 Jan 2022 14:57:32 +0100, Christophe Kerello wrote:
> A few drivers use this property to describe the GPIO pin used to protect
> the NAND during program/erase operations.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
