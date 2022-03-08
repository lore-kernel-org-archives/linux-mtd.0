Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9F9C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Mar 2022 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rcPO5t3uLNi0FGvFNZU/gWa0tdZzmKOA22Z7usX7768=; b=ESw2mXByOUk4Sn
	sLW1955kh1B7HjK3u2js98Nl3FA445p703zDJxvXFQfiY07MBVE/KCp8St6JNkwmETSK3YyFf3HzP
	0mqW+O/WUwgvvZpTOjXPUA3SKDzbri5xyZDRwEMxYBAxUcvO60xjeUJU9USd3U/n+FoNbjxqYFcpx
	zg5RSPsI+jzPnuLMkvYE8x6fNGyjlN6xHJBHTCIk7hLRp+KLD+bvalAXk7czCoOfP/rjim9hjGojN
	GzaWnKw4EoyE2jOOEy2fmNqX1wdcgUUw/smF1TjP9ge4QvQvUArQZJWJdqdm8IiQX9MVL5VL5vsTU
	gQy7NdgH/16zzA90socg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRVWb-003Kj8-DB; Tue, 08 Mar 2022 08:48:57 +0000
Received: from mail.olerise.pl ([46.183.184.59])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRVWT-003KgF-Mq
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2022 08:48:51 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
 id 81C3443A9C; Tue,  8 Mar 2022 09:46:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
 t=1646729214; bh=ZNYiuZLXlxCdAPtstEG/gwJieB5RBwA/cHj1SZ3Mpl0=;
 h=Date:From:To:Subject:From;
 b=MJdrZwN6k8qSJYjxB0ZctY0ycbquKujYEICWXrXdbQY1Im/WUZifpHxFZlT8A/0a+
 ZLTvjZ49BK1zvmisJMRzrqo/Un/NGf2E43p5Iz7bVdJk3E/ecpVjR+cMmAfZ33S2XN
 s4okvXC18kkBlzHEHs9QNXrdXtnnq+28HAfzp2mV690oHpWBtilUjzrhR4fGx52QeO
 no474UoSI9Z/GnfyCsq2JpuL8zSZ8d7GICXiPxSx+/hxLRN36LBR0evSh4U7Lxx1k0
 RTaQtctBxATtaVLJxgEeIWu0NIFHYA36qCHaJnq/9ahcXWZzBWVI6j80+QIcrGgYPZ
 ziYhgeE0rEvow==
Received: by mail.olerise.pl for <linux-mtd@lists.infradead.org>;
 Tue,  8 Mar 2022 08:45:41 GMT
Message-ID: <20220308084500-0.1.26.msig.0.i2of9hnhdw@olerise.pl>
Date: Tue,  8 Mar 2022 08:45:41 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rudzik"?= <mikolaj.rudzik@olerise.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Nap=C5=82yw_Klient=C3=B3w_ze_strony?=
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_004849_913796_B3F08D85 
X-CRM114-Status: UNSURE (   2.51  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWHFgmJ5bSBwb2luZm9ybW93YcSHIFBhxYRzdHdhIG8gbW/FvGxp
d2/Fm2NpIHBvenlza2FuaWEgbm93eWNoIHpsZWNlxYQgemUgc3Ryb255IHd3dy4KCldpZHppbXkg
emFpbnRlcmVzb3dhbmllIHBvdGVuY2phbG55Y2ggS2xpZW50w7N3IFBhxYRzdHdhIGZpcm3EhSwg
ZGxhdGVnbyBjaMSZdG5pZSBwb21vxbxlbXkgUGHFhHN0d3UgZG90cnplxIcgeiBvZmVydMSFIGRv
IHdpxJlrc3plZ28gZ3JvbmEgb2RiaW9yY8OzdyBwb3ByemV6IGVmZWt0eXduZSBtZXRvZHkgcG96
eWNqb25vd2FuaWEgc3Ryb255IHcgR29vZ2xlLgoKQ3p5IG3Ds2fFgmJ5bSBsaWN6ecSHIG5hIGtv
bnRha3Qgendyb3RueT8KCgpQb3pkcmF3aWFtCk1pa2/FgmFqIFJ1ZHppawoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
