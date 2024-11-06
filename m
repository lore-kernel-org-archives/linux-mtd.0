Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69269D59F6A
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2024 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FWCeWfVv5Lk6CBzXm1ZQB2qdXbknql+mFvv86itndk=; b=GIquhjShpSIJz1
	kar6VT74hqGRAQfxQO4DICnKCN6Tnzika/gpNkPwtO+hF8zVff5U66gfUDBMUBZHJ1+pUALuD8Tgl
	NvfvJIvITyPRXcsO08cT4MSO6vjH0DtGNXTHSg18R0B8wsGGgT8gm9x8vk3JJwA5r1lyXZ9xTMQqA
	SKgDlBu0nriEMCSmqsRBJnc8nnt0GCsx4RIgP0lnm6d65TSs90E/Q6XuQM/NQ/KveN3g0aRltp1Q7
	q3sm5mG3qodWVR4SqRXUZE2i98j9/hJYTpTVxSnRhiCu4LnZeuNxGz6hf1dGakXbbQpbqtYkjkLny
	H+8u/Vyp2BR+NdEooxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lo0-00000004Wts-3Dfn;
	Wed, 06 Nov 2024 19:35:04 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lih-00000004Vv2-365F
	for linux-mtd@lists.infradead.org;
	Wed, 06 Nov 2024 19:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1730921274; x=1731526074; i=w_armin@gmx.de;
	bh=KPIsoyhsws8Agp7wgFRMdaTpDymEbvSb3Owgwg6CKMI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=h2LGBACtvj9fuTu8QJu3YKOjKAS2hewAVTTkd9mZmaplCDT2J9hvpF/GtT49QeKg
	 Bt4vp6fMC2gSsYxfdqC05RHmq+I9OJ53K6olZLIzYc8oF3BOSjocR+HWABgQPdyMI
	 uV+5SFihSVbovJy+fuaKWC1V5sgRRwRbGw/bnuWabCT6vdvpD+yVPp6iO5bVFlfAg
	 +ZGwJZy/1bUp8Uax4ZS5K5Au27cfgCjGWUGMTQRjWXfew9D2ZIiRZuO47D52Y8nv1
	 5kYvQkAvqhbzYzSeqHFJkHGzaNsPyX12fxVzRgKvBEcxbQ8A9cEedXNLJ2JDTh51e
	 zyyJZ4ZtvPpzMPCH/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9kC-1t3KhK2USC-003gaQ; Wed, 06
 Nov 2024 20:27:54 +0100
Message-ID: <da774e71-39f3-43ec-a366-c8c893132447@gmx.de>
Date: Wed, 6 Nov 2024 20:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] sysfs: introduce callback
 attribute_group::bin_size
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Logan Gunthorpe <logang@deltatee.com>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
X-Provags-ID: V03:K1:44YqvEvciDnAZyVj6z6AwMwirIfHL0Pzp3XFOKxQKNiQ7tHWySC
 RxktlrVaqsSUg5C4VvLrzKpoqlhjiHyHgejaek9khmsio9KiFm5QCv2KXv29eAcNsGR1hIr
 /Q5ILnqj229v3epEt6qEr+soHYvezbTam1hICVuVYB5Diy3yXhaNodiu0nfX7EP/suGwHuw
 I6p5H1JUB0YrJzn4YZJQA==
UI-OutboundReport: notjunk:1;M01:P0:BJYO93jXrqs=;fzmEJQpCL0PeqA4I2iYLeQ+/FRA
 MPq/2bbvr2WJqMuneUG6luVuj1km+05i2j/1x0NELfvZ4gM4s6XaNM8HLcODqZ2YvwqbRoHUl
 2LVK+ozUvLuqixPcgAE0TpsTj6BsJuZZF8Prk152h36LGoBr9+Kd/R2q2Uj14uYLPmyWZJ52T
 GNvCa+TOfxV6zDxmDel4X7SRWzgnowuH/BIW3mUXHAYAVu4fYedW6ndnVbIfGQolflbLgQgyW
 8mV+C1e27T4QNjbRbp0K+rJqERUl44Twyy7xGukU3hzMv86Q7mhlxLrkLCQS08ejnbvx9vsKG
 6r01C9bdsfdQTjc8ugjkhVZo1cVoiz+0Idhzkx2HFzevnqowukNVKHY0CWZ4djGA/wxza8ihC
 eNcKow0sVo9h8op9VF3+dQKYJlpKJzp7n2geJP8QZL0kSe6bjfmj/6AvUYeZ5S5Mj+GvK8pW+
 Hx13JZYdjPEwoso2V+ubjtHLhHFhZCY3jh0/lw4JBQ9TuoNEMuaERqMypNT2JoPC/SM1qDBVx
 oZvDgRCLkXEbhhDGTdGaeM4aGZm9w0xjx7OOl3y478J0h8vJWzK2lZcJ9OCtdTCOBJ3TKK51o
 j2XTpAkas1ObXtSswmUtpY/4NVAGbjFlT/VOYp0mdC+F4L90W0AmQwAT/dp7ljfoSSkZT4/zA
 tnfMmwR7alN2DKWZGMREmp8dtIWDzl/LkYsX5xsPiTm6gHpOZxc0s4oUuYnkXDbW9UIZGBd7l
 8FMWWaPCemeDgSDhQn2reHRR1YW+K4+d53fVkZQszw1C38L00qMcKo7qliwnTIDdOaJvrPrQg
 Ne8RWTGaSm1RVKwc8Z2xLPwg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_112936_078794_6C1BC19D 
X-CRM114-Status: GOOD (  22.29  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMDMuMTEuMjQgdW0gMTg6MDMgc2NocmllYiBUaG9tYXMgV2Vpw59zY2h1aDoKCj4gU2V2ZXJh
bCBkcml2ZXJzIG5lZWQgdG8gZHluYW1pY2FsbHkgY2FsY3VsYXRlIHRoZSBzaXplIG9mIGFuIGJp
bmFyeQo+IGF0dHJpYnV0ZS4gQ3VycmVudGx5IHRoaXMgaXMgZG9uZSBieSBhc3NpZ25pbmcgYXR0
ci0+c2l6ZSBmcm9tIHRoZQo+IGlzX2Jpbl92aXNpYmxlKCkgY2FsbGJhY2suCgpIaSwKCmkgcmVh
bGx5IGxpa2UgeW91ciBpZGVhIG9mIGludHJvZHVjaW5nIHRoaXMgbmV3IGNhbGxiYWNrLCBpdCB3
aWxsIGJlIHZlcnkKdXNlZnVsIGZvciB0aGUgd21pLWJtb2YgZHJpdmVyIDopLgoKVGhhbmtzLApB
cm1pbiBXb2xmCgo+Cj4gVGhpcyBoYXMgZHJhd2JhY2tzOgo+ICogSXQgaXMgbm90IGRvY3VtZW50
ZWQuCj4gKiBBIHNpbmdsZSBhdHRyaWJ1dGUgY2FuIGJlIGluc3RhbnRpYXRlZCBtdWx0aXBsZSB0
aW1lcywgb3ZlcndyaXRpbmcgdGhlCj4gICAgc2hhcmVkIHNpemUgZmllbGQuCj4gKiBJdCBwcmV2
ZW50cyB0aGUgc3RydWN0dXJlIHRvIGJlIG1vdmVkIHRvIHJlYWQtb25seSBtZW1vcnkuCj4KPiBJ
bnRyb2R1Y2UgYSBuZXcgZGVkaWNhdGVkIGNhbGxiYWNrIHRvIGNhbGN1bGF0ZSB0aGUgc2l6ZSBv
ZiB0aGUKPiBhdHRyaWJ1dGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8
bGludXhAd2Vpc3NzY2h1aC5uZXQ+Cj4gLS0tCj4gICBmcy9zeXNmcy9ncm91cC5jICAgICAgfCAy
ICsrCj4gICBpbmNsdWRlL2xpbnV4L3N5c2ZzLmggfCA4ICsrKysrKysrCj4gICAyIGZpbGVzIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9mcy9zeXNmcy9ncm91cC5j
IGIvZnMvc3lzZnMvZ3JvdXAuYwo+IGluZGV4IDQ1YjJlOTI5NDFkYTFmNDlkY2M3MWFmMzc4MTMx
N2M2MTQ4MGM5NTYuLjhiMDFhN2VkYTVmYjMyMzllMTM4MzcyNDE3ZDAxOTY3YzdhM2YxMjIgMTAw
NjQ0Cj4gLS0tIGEvZnMvc3lzZnMvZ3JvdXAuYwo+ICsrKyBiL2ZzL3N5c2ZzL2dyb3VwLmMKPiBA
QCAtOTgsNiArOTgsOCBAQCBzdGF0aWMgaW50IGNyZWF0ZV9maWxlcyhzdHJ1Y3Qga2VybmZzX25v
ZGUgKnBhcmVudCwgc3RydWN0IGtvYmplY3QgKmtvYmosCj4gICAJCQkJaWYgKCFtb2RlKQo+ICAg
CQkJCQljb250aW51ZTsKPiAgIAkJCX0KPiArCQkJaWYgKGdycC0+YmluX3NpemUpCj4gKwkJCQlz
aXplID0gZ3JwLT5iaW5fc2l6ZShrb2JqLCAqYmluX2F0dHIsIGkpOwo+Cj4gICAJCQlXQVJOKG1v
ZGUgJiB+KFNZU0ZTX1BSRUFMTE9DIHwgMDY2NCksCj4gICAJCQkgICAgICJBdHRyaWJ1dGUgJXM6
IEludmFsaWQgcGVybWlzc2lvbnMgMCVvXG4iLAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L3N5c2ZzLmggYi9pbmNsdWRlL2xpbnV4L3N5c2ZzLmgKPiBpbmRleCBjNGU2NGRjMTEyMDYzZjdj
Yjg5YmY2NjA1OWQwMzM4NzE2MDg5ZTg3Li40NzQ2Y2NjYjk1ODk4YjI0ZGY2ZjUzZGU5NDIxZWE3
NjQ5YjU1NjhmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvc3lzZnMuaAo+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvc3lzZnMuaAo+IEBAIC04Nyw2ICs4NywxMSBAQCBkbyB7CQkJCQkJCVwKPiAg
ICAqCQlTWVNGU19HUk9VUF9WSVNJQkxFKCkgd2hlbiBhc3NpZ25pbmcgdGhpcyBjYWxsYmFjayB0
bwo+ICAgICoJCXNwZWNpZnkgc2VwYXJhdGUgX2dyb3VwX3Zpc2libGUoKSBhbmQgX2F0dHJfdmlz
aWJsZSgpCj4gICAgKgkJaGFuZGxlcnMuCj4gKyAqIEBiaW5fc2l6ZToKPiArICoJCU9wdGlvbmFs
OiBGdW5jdGlvbiB0byByZXR1cm4gdGhlIHNpemUgb2YgYSBiaW5hcnkgYXR0cmlidXRlCj4gKyAq
CQlvZiB0aGUgZ3JvdXAuIFdpbGwgYmUgY2FsbGVkIHJlcGVhdGVkbHkgZm9yIGVhY2ggYmluYXJ5
Cj4gKyAqCQlhdHRyaWJ1dGUgaW4gdGhlIGdyb3VwLiBPdmVyd3JpdGVzIHRoZSBzaXplIGZpZWxk
IGVtYmVkZGVkCj4gKyAqCQlpbnNpZGUgdGhlIGF0dHJpYnV0ZSBpdHNlbGYuCj4gICAgKiBAYXR0
cnM6CVBvaW50ZXIgdG8gTlVMTCB0ZXJtaW5hdGVkIGxpc3Qgb2YgYXR0cmlidXRlcy4KPiAgICAq
IEBiaW5fYXR0cnM6CVBvaW50ZXIgdG8gTlVMTCB0ZXJtaW5hdGVkIGxpc3Qgb2YgYmluYXJ5IGF0
dHJpYnV0ZXMuCj4gICAgKgkJRWl0aGVyIGF0dHJzIG9yIGJpbl9hdHRycyBvciBib3RoIG11c3Qg
YmUgcHJvdmlkZWQuCj4gQEAgLTk3LDYgKzEwMiw5IEBAIHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAg
ewo+ICAgCQkJCQkgICAgICBzdHJ1Y3QgYXR0cmlidXRlICosIGludCk7Cj4gICAJdW1vZGVfdAkJ
CSgqaXNfYmluX3Zpc2libGUpKHN0cnVjdCBrb2JqZWN0ICosCj4gICAJCQkJCQkgIHN0cnVjdCBi
aW5fYXR0cmlidXRlICosIGludCk7Cj4gKwlzaXplX3QJCQkoKmJpbl9zaXplKShzdHJ1Y3Qga29i
amVjdCAqLAo+ICsJCQkJCSAgICBjb25zdCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSAqLAo+ICsJCQkJ
CSAgICBpbnQpOwo+ICAgCXN0cnVjdCBhdHRyaWJ1dGUJKiphdHRyczsKPiAgIAlzdHJ1Y3QgYmlu
X2F0dHJpYnV0ZQkqKmJpbl9hdHRyczsKPiAgIH07Cj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
