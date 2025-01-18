Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7B3C02187
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Jan 2025 04:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:To:From:Date:
	MIME-Version:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vce/HMdwWBjAIUtlUoBi9gLP8+yscES9Nal0pHMMRbY=; b=vYblqqZZT/ditj
	YvcEQQ/IR2j7mGLYIyni6vD1JY+29Hyy9QjYfCpIOLoT01MVRzVGjWvR1KDNPn5ZX7dOy3fR2ZXtK
	PB3LzY3EQ3n0p0g/OWwcQoWEvDJcT1pShOfXRvciad5Hn9Wttr4D3DvE9xhzElJ/BIHFPiLGrf5Qt
	EWN8TBftQVySJ1wpPvgKpLtL8ABJfj5QhtF3LgGX62OUjZNMohcVyq+zNJx4jmphEAnTO8nt0jqAh
	+BS7VZLM2uPAJampwUJ4Gk0xunclQRnxlwDx0uADXCPowg77VWO/rPS0cc+BUY/d/3ryiZOeqkIhY
	zxwdF5xZ1pZ99zacfpHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ0p0-00000001r9q-3hdD;
	Sat, 18 Jan 2025 04:52:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ0oz-00000001r9k-3U5Y
	for linux-mtd@bombadil.infradead.org;
	Sat, 18 Jan 2025 04:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Reply-To:Subject:To:From:
	Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Cc:Content-ID
	:Content-Description:In-Reply-To:References;
	bh=/llvRvmVYw+GHB0dsJXw6GKPNzxbahoooJ1Fer5gZuY=; b=AVGkii0uBm4/bHpMLtxRNTL8kS
	0+GMUM35r4n1bPTUx1T+Pc6qbHX2yt68VvZ/pIteTMewFsHvz/mJyyWyBsaKIrTg657oGIXA82tx9
	SXhjHQipPd+Arr8KQ2oJyPBkUX6prn6qFgdzQ0q4QVlepa6mBUEG6R1hh3qB/gMaLrbLcmxLVXyOD
	ziTluOABat41E23iqpX8+DQK+PwFzykACmmsrWSxTI7/sur5ldJa7N79YMILxURpsv5tFn0RsoCaO
	+QhR2Fj54PBtOrmc59OtE5j5unZnk8ChfI09RCc7EAL9nHNaQABK2Ysg7FCdP11ZGvvkaS0JFt1Lh
	f6UF1UQQ==;
Received: from mail.flcgil.strategy.it ([109.168.127.228])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ0ov-0000000BZgX-27VD
	for linux-mtd@lists.infradead.org;
	Sat, 18 Jan 2025 04:52:32 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.flcgil.strategy.it (Postfix) with ESMTP id C631918212DD;
	Sat, 18 Jan 2025 05:30:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flcgil.it; s=dkim;
	t=1737174650; bh=c+e/5EKM1MNjt+4drdghFiBSmwVTdNtPQN2nqX+zggs=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:
	 Subject:Reply-To:Message-ID;
	b=etjmKvopH+5G7gINSQT+Hu4wQnuWpT71uYuwbIspC5eTVn4RkZIPfoS9DmTgPYRx8
	 iDLSXHY4Z/UbqkCXmGGjAjjWla4IerT8+Uz6df55dFgfBGaZUi4ZKicKYv8b3rxQL/
	 YqDFY/7nVBPDa152fDNxP7Zpxh5lOUOyvPq4YDeI=
X-Virus-Scanned: Debian amavisd-new at flcgil.it
Received: from mail.flcgil.strategy.it ([127.0.0.1])
	by localhost (flcmail.flcgil.it [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id byDx4fhItCyN; Sat, 18 Jan 2025 05:30:49 +0100 (CET)
Received: from webmail.flcgil.strategy.it (unknown [10.1.10.232])
	by mail.flcgil.strategy.it (Postfix) with ESMTP id AD68818212D1;
	Sat, 18 Jan 2025 05:30:46 +0100 (CET)
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 05:30:46 +0100
From: =?UTF-8?Q?=E3=83=91=E3=83=88=E3=83=AA=E3=83=83=E3=82=AF=EF=BC=86?= =?UTF-8?Q?=E3=83=95=E3=83=A9=E3=83=B3=E3=82=B7=E3=82=B9=E3=83=BB=E3=82=B3?= =?UTF-8?Q?=E3=83=8E=E3=83=AA=E3=83=BC?= <info@flcgil.it>
To: undisclosed-recipients:;
Subject: =?UTF-8?Q?=E4=BA=BA=E9=81=93=E7=9A=84=E6=94=AF=E6=8F=B4?=
Mail-Reply-To: <patrickconnolly@elon2ev.com>
Message-ID: <600dbe85eb1985148e24f436130d54f4@webmail.flcgil.it>
X-Sender: info@webmail.flcgil.it
User-Agent: FLCGIL Webmail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_045230_197236_88618608 
X-CRM114-Status: UNSURE (   0.40  )
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
Reply-To: patrickconnolly@elon2ev.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgotLSAK44GT44KT44Gr44Gh44Gv44CB56eB44Gu5ZCN5YmN44Gv44OR44OI44Oq44OD44Kv44O7
44Kz44OO44Oq44O844Gn44CB5aa744Gv44OV44Op44Oz44K344K544O744Kz44OO44Oq44O844Gn
44GZ44CC56eB44Gf44Gh5aSr5amm44GL44KJ44CB44GC44Gq44Gf44GM56eB44Gf44Gh44Gu5a+E
5LuY44Gu5Y+X5Y+W5Lq644Gr6YG444Gw44KM44Gf44GT44Go44KS44GK55+l44KJ44Gb44Gn44GN
44KL44GT44Go44KS5ayJ44GX44GP5oCd44GE44G+44GZ44CCCgroqbPntLDjgavjgaTjgYTjgabj
ga/jgIHjgZPjga7jg6Hjg4Pjgrvjg7zjgrjjgavov5Tkv6HjgZfjgabjgY/jgaDjgZXjgYTjgIIK
CuOCiOOCjeOBl+OBj+OBiumhmOOBhOOBhOOBn+OBl+OBvuOBmeOAggrjg5Hjg4jjg6rjg4Pjgq/v
vIbjg5Xjg6njg7Pjgrfjgrnjg7vjgrPjg47jg6rjg7wKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
