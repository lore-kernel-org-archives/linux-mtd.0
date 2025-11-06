Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74BBCCFA05
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 15:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pdo1B7Yby0x+7s4RvdAL/3eVsYcMvsn28oIgimeYia4=; b=s421GrFlg/+W39
	nUljupmDywsw0B6NiF3XQYJ1JIavrBLeqjc1JDQmKnFdHPyaa6GggljKSnns8bts4q3pqPsHeWafc
	6Xa10GzxjLzZ0hJEgl+0caLtv8gtrMEy8IMlAD/xEL7ImoxteOurmvL52nj2czb+VtfDM5DYWht5T
	QMWBSzk2eVA8QDA2ZFGXMKFQ5w8hZq5louAntmRxsSTDeFbjCizOWJfRYITJfqlcAbDlSqM52YI34
	jLa0Wrwrm0WaFjrXMvAYTNILwWSlBGNhkLoBFQ//aKSKCjQWfKLorItKFz+gRBI7nIGjr26YLaIPK
	9489V3VzDx6ZuDqhyLpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1j2-0000000FmkY-2MbF;
	Thu, 06 Nov 2025 15:16:36 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1j0-0000000FmjR-15wJ;
	Thu, 06 Nov 2025 15:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1762442168; x=1763046968; i=markus.elfring@web.de;
	bh=kWY+3Lcq3zaDKq622WO926Hwm5Cv1NXBiACcN6gV3a0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PKxNbHrjDZBCbXiqKBvCEIK8T70QWY+NOZWaeMsqrOZSPTfJPWLueuRHU2LY0SZz
	 RBpkFHAod58zk73F0hNtHEJaEw/AbCtUUrE3PoSx1lLAk97pwrS+EtXARnUXG7/2t
	 Y9OMLvqjRuU5fdnTNTTUae0iUFmBkudN+/Pnf2aTxESazlH7eNwIvuuRAE1D5dmoc
	 7G+Q/qmcduhEPq6CNTHDI+8pam6VVRUQ3g4haXfRxMmLRQjmoVnMlAC1JNRAOqL+x
	 Vyy/0qmQ4FaYby1lvP7aRFL4vsjKo8ofUVQUUFySnlrq6qVjqVzbFOxD9x4zw2QJV
	 1zVxOxJ2ST0Ep15fag==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.214]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnX1L-1vy1tt2By1-00lyLo; Thu, 06
 Nov 2025 16:16:08 +0100
Message-ID: <dff05531-f5e3-400a-abf0-a5307c50357e@web.de>
Date: Thu, 6 Nov 2025 16:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Liyuan Pang <pangliyuan1@huawei.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 wanqian10@huawei.com, Yang Liu <young.liuyang@huawei.com>,
 Zhihao Cheng <chengzhihao1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20251105120704.511192-1-pangliyuan1@huawei.com>
Subject: Re: [PATCH] ubi: fastmap: fix ubi->fm memory leak
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251105120704.511192-1-pangliyuan1@huawei.com>
X-Provags-ID: V03:K1:TXm7XI8pCG/L1U0D/64T5DREpSM3dmvLW4mPAfJP+XykENie4Nh
 Pqad4GFqsP2KVW7b2ePhCO9XWnsmu3T5SrZLlCoFSX3BTFhx+yvoxShxbe+HoY+rzdWHa5p
 rGA855mIWQ/+1Yc9BskZDNgOwoFOA4HOIghK3tQW6dEEwOO00EtUBjlBfF2ecX5uu/tIhI4
 gGnic4DqHnQLdIsRSG+fQ==
UI-OutboundReport: notjunk:1;M01:P0:v9ardd/mp08=;iNDdgX3bJM+3yQUbEP6HpxH3i2e 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 7jPzygIz23bqELu9nd2pL5gPuU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_071634_658881_7537090E 
X-CRM114-Status: UNSURE (   7.87  )
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

4oCmCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2Zhc3RtYXAuYwo+IEBAIC0xNjQ0LDMgKzE2NDQs
MTUgQEAgaW50IHViaV91cGRhdGVfZmFzdG1hcChzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKQrigKYK
PiArdm9pZCB1YmlfZnJlZV9mYXN0bWFwKHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpCj4gK3sKPiAr
CWludCBpOwo+ICsKPiArCWlmICh1YmktPmZtKSB7Cj4gKwkJZm9yIChpID0gMDsgaSA8IHViaS0+
Zm0tPnVzZWRfYmxvY2tzOyBpKyspCj4gKwkJCWttZW1fY2FjaGVfZnJlZSh1Ymlfd2xfZW50cnlf
c2xhYiwgdWJpLT5mbS0+ZVtpXSk7CuKApgo+ICsJfQo+ICt9CuKApgoKTWF5IHRoZSBsb2NhbCB2
YXJpYWJsZSDigJxp4oCdIGJlIGRlZmluZWQgaW4gdGhlIGxvb3AgaGVhZGVyPwoKUmVnYXJkcywK
TWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
