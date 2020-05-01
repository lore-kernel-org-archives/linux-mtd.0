Return-Path: <SRS0=+Ogn=6P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0786AC35280
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 21:20:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C85BC2166E
	for <linux-mtd@archiver.kernel.org>; Fri,  1 May 2020 21:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R6ZQivIe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C85BC2166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mspYhL+4TYTcnKZKBFqwWmGEpbo5d5wCFi6wCZdNio4=; b=R6ZQivIeGmi3sr
	iFKAuStu91teNFMyXc1yXu9qd1eI7Hu63fItXwUWPbducPkBnTWosigjN1pV9s2RWOzJciVJrATiE
	1rQdI+v5BT/xybXqHJw6H/uOkBEOiBO2KbDqHKlKFd9d7CL8+ESyfn1MqnlfKYFyRQSNI9gYKDO8W
	RhGQc1RYmSYt/G8phunVgl6cLhzBK9bAnL+6wLt8NwjkWsQ9eZqBVaLFpCuozgfVh0DFEWPcPycG/
	1sDv4uVVPPjCByBOQBod8uYTmfwRIa0tV0m8/FtWpHfDGBrpNeEfulc7Qq9ggQBDqFyIH5B6ZOCzB
	EKxa/nnZ/OVywp21zqhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUd4e-0005JM-Cm; Fri, 01 May 2020 21:19:56 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUd4a-0005Iq-Vb
 for linux-mtd@lists.infradead.org; Fri, 01 May 2020 21:19:54 +0000
Received: by mail-oi1-f193.google.com with SMTP id 19so896631oiy.8
 for <linux-mtd@lists.infradead.org>; Fri, 01 May 2020 14:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:content-language
 :user-agent;
 bh=crzBmsIsSrF0UoLH+UgR+Of2XRbChFVf5iuJUQuRNxo=;
 b=C4TS/j0fIQkfyQNZYt7+M298CiAUpi0Dc246kJ5anQtNouYjgphlb2LwIxAz1HcKZv
 RFALUxW0PCdtravPUsDb2+5HwBwpqQl5/Ks3iRtaE/Lii+IwFvsk2viTbX/tc6Ew3v73
 uH/1NV9q7WfJ+nPqBYx4yZXs4l1r0CHFvXsDg32+Tz3v+uNjOopXoSkfMbryCjk1Xyho
 UYLqtbOJvENWgLMeHZMtFDewlb/VUX/MrWoRuENg4KUyexwhxCY8y0eJYoKxphQ1w2kK
 guDR6eH8jRFcdQvi9VELFhLWO9txeKalbLFaChU5kMw1GfEKvlA2VSro4IUljIGvL2DN
 egkg==
X-Gm-Message-State: AGi0PubkLOmmAmmCQERrKjgP7lsw+M69+gL0K50d7rgUB5ia+hyi3AEZ
 iFDg4yfXm7vnVOr9STJtKg==
X-Google-Smtp-Source: APiQypJyxKTCOC0q+T2e+uyYjq0smnGrUDFPHMmNnjCSHqy03XQsqFpyN9Wp7gNlZ9Mv+SorNjjJFA==
X-Received: by 2002:aca:b8c5:: with SMTP id i188mr1187592oif.2.1588367986405; 
 Fri, 01 May 2020 14:19:46 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z75sm260692oia.22.2020.05.01.14.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 14:19:45 -0700 (PDT)
Received: (nullmailer pid 15593 invoked by uid 1000);
 Fri, 01 May 2020 21:19:45 -0000
Date: Fri, 1 May 2020 16:19:45 -0500
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: document Renesas RPC-IF
 bindings
Message-ID: <20200501211945.GA15294@bogus>
References: <812e6e58-d13f-3f44-5f55-22266b690c57@cogentembedded.com>
 <116683d1-d402-4d7f-3357-1c8cde807076@cogentembedded.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <116683d1-d402-4d7f-3357-1c8cde807076@cogentembedded.com>
Content-Language: en-MW
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_141953_015663_E7EADB28 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 30 Apr 2020 23:47:25 +0300, Sergei Shtylyov wrote:
> Renesas Reduced Pin Count Interface (RPC-IF) allows a SPI flash or
> HyperFlash connected to the SoC to be accessed via the external address
> space read mode or the manual mode.
> 
> Document the device tree bindings for the Renesas RPC-IF found in the R-Car
> gen3 SoCs.
> 
> Based on the original patch by Mason Yang <masonccyang@mxic.com.tw>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 2:
> - rewrote the bindings in YAML.
> 
>  Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml |   88 ++++++++++
>  1 file changed, 88 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml:  while scanning a simple key
  in "<unicode string>", line 29, column 9
could not find expected ':'
  in "<unicode string>", line 30, column 1
Documentation/devicetree/bindings/Makefile:11: recipe for target 'Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml: ignoring, error parsing file
warning: no schema found in file: Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml: ignoring, error parsing file
warning: no schema found in file: Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1280942

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
