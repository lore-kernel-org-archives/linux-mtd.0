Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AE3C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Sep 2022 14:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMp8+k2Xk7btizogOcKjPakWv4pEqsKxInSh3tf/dUw=; b=n3Z55CYqrw3sX2
	loFH0I0k73Nnf1hnOCQ4JQxuHgg3HOiGjv77J+w8amv1204U10Q3RQs04s/BMHQvN1EsNfSZf2sjq
	7J7chtuUuovBbskR3Buowbhj9qgHs882ZEck+wlMTXSXSKtm+yl9RT1Tvabg0uKN2RBWlgkKmf2pO
	e+H+bmIn2H3TLpZJeR179SIwAON/AFjiM2CyytxfGidsd7FS4etm/OOhZoGc+/srmaPl97TQRY+3u
	JqJCEYMx1loZ5HGdi0A+9DUrz8zRas02TZ20+PRUafRwyt2Z3ikTJgoIRibeQzhXaY5CTYmySJn+L
	ULY8SzBY9QmQphSjD9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6ZD-00BIpJ-9I; Tue, 13 Sep 2022 14:07:11 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6Y8-00BHZ1-51; Tue, 13 Sep 2022 14:06:07 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1225219ee46so32402060fac.2;
        Tue, 13 Sep 2022 07:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=QVFIfgOtjiiqBqGuqPoOB28Jgr9wt0ctc+fKksUA9E4=;
        b=em3PZyr0zWCWKRuOnMhrQaNTdGUarohg78jQXedW4VM/yumlizkF+zuGsb+con7XDK
         mNOZKFWj4eqxiVTySq/5wBuhtf7/tKa01u3X8PAB459bUR5nrsPmWxiaKuAWfbxlL+sQ
         mejozIbhoJ3l46f/m1PDelANWbqY/xAeGnA3/HQfs22+4qDs8dD+PcUtL7z6IQRKFVxK
         AgM/TwCwK/cPKHXvdbch2LBB92YdQP70EM3oYU/ROLGnC/cAmNMR7qVdItGZgwqxkm4d
         fR048iLqt5VE/0QTfgwsEiR4QTb8r7OwEv30OR8HREoqsrfu21vce+48NRRMbnLM0mHX
         fXqA==
X-Gm-Message-State: ACgBeo2pfPw1A+5HW3sx46bhMSExeTfQ9H++J7N2XThdcGK0M5dpBBWR
	vlhc2Si1EITXtHkRud9Qxg==
X-Google-Smtp-Source: AA6agR6Uh59tIqrYv6buS6ERBDFSApg5dMrnLMNOGP6F5OslqNg/DHtvwnxKsAIOrvT5pI93PeWyJA==
X-Received: by 2002:a05:6870:d146:b0:127:76fd:382 with SMTP id f6-20020a056870d14600b0012776fd0382mr1815303oac.257.1663077962897;
        Tue, 13 Sep 2022 07:06:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l2-20020a056808020200b00344f28a7a4csm5155623oie.22.2022.09.13.07.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:06:02 -0700 (PDT)
Received: (nullmailer pid 3592015 invoked by uid 1000);
	Tue, 13 Sep 2022 14:06:01 -0000
Date: Tue, 13 Sep 2022 09:06:01 -0500
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Cc: linux-watchdog@vger.kernel.org, wim@linux-watchdog.org, linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, richard@nod.at, vigneshr@ti.com, miquel.raynal@bootlin.com, kever.yang@rock-chips.com, linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org, jamie@jamieiles.com, robh+dt@kernel.org, kishon@ti.com, thierry.reding@gmail.com, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, gregkh@linuxfoundation.org, linux-spi@vger.kernel.org, u.kleine-koenig@pengutronix.de, broonie@kernel.org, philipp.tomsich@vrull.eu, devicetree@vger.kernel.org, linux@roeck-us.net, linux-usb@vger.kernel.org, ulf.hansson@linaro.org, sjg@chromium.org, heiko@sntech.de, zhangqing@rock-chips.com, vkoul@kernel.org
Subject: Re: [PATCH v1 10/11] dt-bindings: soc: rockchip: grf: add
 rockchip,rk3128-grf
Message-ID: <20220913140601.GA3591983-robh@kernel.org>
References: <20220909212543.17428-1-jbx6244@gmail.com>
 <fddc23ff-0c87-4998-1bdf-4dbfa4c74046@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fddc23ff-0c87-4998-1bdf-4dbfa4c74046@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_070604_287208_FE52DFEB 
X-CRM114-Status: UNSURE (   7.42  )
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

On Sat, 10 Sep 2022 00:01:39 +0200, Johan Jonker wrote:
> Add rockchip,rk3128-grf compatible string.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
