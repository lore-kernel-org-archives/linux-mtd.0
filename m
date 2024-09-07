Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B58EB64CA
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Sep 2024 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5B3S77ySv4T0dVrn7yQ56x1mx65SkRJV9oYTf7XH/A=; b=0PqPT7l2BYwdAn
	87JjuM9KEpH+2uPwKvHkFMgt9niEMIBw1uytxAl4EXTg6aunD8ohZBm/toTtgNEWD39ssI6I+pQMJ
	d2q5GyIqR1j2plMPOOffcyOIM1k6mPWykLs0AipNkVIHvgZ6HBT0y5oa6PFQ6q8bbc3csk4FtzI8B
	iukdbJ3rPAyn4X5D4BTzF/ahQT3SIvXaeL6Tq5XAFgZvOVBgG8WTDVIe8rX4dVJe074/3VscdZ59W
	2lFP2Ai1sjeGBPKrt7yz0Mu4NjiBsWDvWEO0tYWpVPfe0meh6g7WqMMGiF+d0IqngYk2fmGMkx7BN
	Y3Lv4hkZqRnCpNlciKEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smxQl-0000000FEJ0-0DTC;
	Sat, 07 Sep 2024 15:32:55 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smxQg-0000000FEHi-3BUj;
	Sat, 07 Sep 2024 15:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1725723061; x=1726327861; i=markus.elfring@web.de;
	bh=wihuS6INkOIDRJLvPODF0HceZ7BB6DFVMS4BkKX4s0g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GGFUtIn/x0Yjib7Y4e1yOKaA3LawIgwXzX4+GKFSTGPYUjXGu1bEp5Pk15O2AS4D
	 hNSt0ZBKybXpdcw4wOc1oylU1eZEYWVRDBoAegl7RGmW3WZNvuAKsV1KB3RndXKlX
	 UiTOOINChJQsj7EvLQaMrUjc1Iyg44nOWH7anByQrt2UEKJhZPXTwaS5GOs9d81Ft
	 Ga9LCGrNGegL9Aow2/iieXG6w1UpTyiIMVC6vNMzt1kc4gupOROPPTggssKDBJnJz
	 FMTROAglkrijureZi1maPvQedQtpa/n++HccI1BChPGuoKZvHxfHG/fPUBpOS7Mu6
	 tmBfowHsaRnK4RshEQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mkmzl-1sKCU60TDL-00kWWt; Sat, 07
 Sep 2024 17:31:01 +0200
Message-ID: <f60b0884-a7fa-4260-b9bb-ae680ff21150@web.de>
Date: Sat, 7 Sep 2024 17:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: WangYuli <wangyuli@uniontech.com>, linux-input@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Abhinav Kumar
 <abhinavk@codeaurora.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anil Gurumurthy <anil.gurumurthy@qlogic.com>,
 Anil Ravindranath <anil_ravindranath@pmc-sierra.com>,
 Archit Taneja <architt@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dasaratharaman Chandramouli <dasaratharaman.chandramouli@intel.com>,
 David Airlie <airlied@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Dmitry Torokhov <dtor@mail.ru>,
 Don Hiatt <don.hiatt@intel.com>, Doug Ledford <dledford@redhat.com>,
 Eric Piel <eric.piel@tremplin-utc.net>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, James Bottomley <James.Bottomley@suse.de>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jiri Kosina <jkosina@suse.cz>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Kevin Hilman <khilman@baylibre.com>,
 Krishna Gudipati <kgudipat@brocade.com>, Leon Romanovsky <leon@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Masanari Iida <standby24x7@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Miloslav Trmac <mitr@volny.cz>,
 Richard Weinberger <richard@nod.at>, Rob Clark <robdclark@gmail.com>,
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Rajesh Yadav <ryadav@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>,
 Tony Lindgren <tony@atomide.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 "Vijay Kumar B." <vijaykumar@bravegnu.org>,
 Wentao Guan <guanwentao@uniontech.com>, zhanjun@uniontech.com
Cc: LKML <linux-kernel@vger.kernel.org>
References: <63D0F870EE8E87A0+20240906054008.390188-1-wangyuli@uniontech.com>
Subject: Re: [PATCH] treewide: Correct the typo 'retun'
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <63D0F870EE8E87A0+20240906054008.390188-1-wangyuli@uniontech.com>
X-Provags-ID: V03:K1:0V/kSbOfOSES5ZSUPdgCZTIcGmmRZMm0Domxm/Q8KX7EnOO1CAN
 00nVkeHP/BEhc1uiKtEI0+LLwINCEV1nSlgo1pINWJyZ22WHQIdvHMPhXX9Dibh9lp2E6i0
 v1vwafHYbTjBcj52zpJPNskLr5AxrCpCr2mgG1bc7EuYHcZ6DtYMYuIgT/B6+Q7EQLT5mR/
 k9m3SXUYG/qEkZWV6kXvg==
UI-OutboundReport: notjunk:1;M01:P0:eJQeW9UGGk0=;BIskQXK25THsuKgfSEMHNrqzAWD
 Y//x4rspd7L6DZ58YgNNTXjYwoWbQTnTYp1kc1vMll0u7cPyuTLy3xEP/ReuRFGA77lqQAibK
 /6uOnBeNuRrYH6ZgTxfXm3636B2h8/1HnqFUp73R/R1+Ao69JPmTyHFLi2sr4ElRqoF2AjIKu
 a1GCqrIr85L4vXpL0fSmKckM347JgzuW4ti8xbzaxVA7BtM6zATY3AkH+V/K0cwEf4Iu6Nc7Z
 Z+/81Xl/ApcMmB3mtmIzo0h4W8KrDqvOpWvQ2Dkm+/35DGoZb/Gg7tTi2nNrUxnh7UWb44rIc
 dltxjmgSXtVPHyFjzB2A9I1ucJA5Ouly8qh9iPQKkax/VcYVN2IRH7UUfFfp9hR2V6oMsYlrF
 6UHnxTjH4RpjyLjc7g63Dvh423vvN5KPDOeQf/w8wE/v5jJVBkm64wwCUL01y86qFtZoC/70c
 k8AkUqYGI08xMCJPT5v/QG7r1nYmjvvDTuIOP6aGw/0/LCNwFw3pp8uJk8FHiSiISgyl1C05C
 IK48cI9L+YLFJurUPze13oKlNambZVI0leiIyEdP0IstQTq4bAZkQBXv+U+SOV/IjOYe4kw/D
 q3fprWkvsM+xfSlOdzc/9vwKNZwkRQuaapTrX+xDzD1iRouYTIq7CW37H8CmkPpbUXMLmtvlz
 lTi2cYFS9sXE4yvAPx4OEnqrFEZOCiuLHwEPYGUlooyixxKr7l5kNU3Fttn6NlWU9zNxVdZDJ
 CTYRNkCsFkoz33K1beAdoI45/v6GjCAD1+D1Ov+hll037p+F42neH8RIJPbxRlzudy6O6UO2z
 MGr//iuh+hhfAAdwERNY/svA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_083251_306076_CBEF402A 
X-CRM114-Status: UNSURE (   4.90  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

4oCmCj4gc2hvdWxkIGJlIGluc3RlYWQgb2YgJ3JldHVybicuCgogICAgICAgICAgICDigJxyZXR1
cm7igJ0gaW5zdGVhZD8KCgpDYW4gYSBjb3JyZXNwb25kaW5nIGltcGVyYXRpdmUgd29yZGluZyBi
ZSBwcmVmZXJyZWQgZm9yIGEgYmV0dGVyIGNoYW5nZSBkZXNjcmlwdGlvbj8KaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3Ry
ZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3Q/aD12Ni4xMS1y
YzYjbjk0CgpSZWdhcmRzLApNYXJrdXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
