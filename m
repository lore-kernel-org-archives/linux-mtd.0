Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6Mdd-0004xq-5B
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 15:56:17 +0000
Received: by mail-wg0-f49.google.com with SMTP id a1so1737318wgh.16
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2014 07:55:52 -0800 (PST)
Date: Thu, 23 Jan 2014 15:55:45 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Ludovic Barre <ludovic.barre@st.com>
Subject: Re: [PATCH RESEND v4 01/37] mtd: st_spi_fsm: Allocate resources and
 register with MTD framework
Message-ID: <20140123155545.GH8586@lee--X1>
References: <1390473085-24626-1-git-send-email-lee.jones@linaro.org>
 <1390473085-24626-2-git-send-email-lee.jones@linaro.org>
 <52E12434.7030000@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52E12434.7030000@st.com>
Cc: olivier.clergeaud@st.com, Angus.Clark@st.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 DCG_UPD_stlinux_kernel@list.st.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >+	fsm->region = devm_request_mem_region(&pdev->dev, res->start,
> >+					      resource_size(res), pdev->name);
> >+	if (!fsm->region) {
> >+		dev_err(&pdev->dev,
> >+			"Failed to reserve memory region [0x%08x-0x%08x]\n",
> >+			res->start, res->end);
> >+		return -EBUSY;
> >+	}
> >+
> >+	fsm->base = devm_ioremap_nocache(&pdev->dev,
> >+					 res->start, resource_size(res));
> >+	if (!fsm->base) {
> >+		dev_err(&pdev->dev, "Failed to ioremap [0x%08x]\n", res->start);
> >+		return -EINVAL;
> >+	}
> >+
> you can replace  "devm_request_mem_region" & "devm_ioremap_nocache"
> by "devm_ioremap_resource"

Yes, that looks entirely reasonable, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
