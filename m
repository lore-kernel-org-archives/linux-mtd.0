Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C6BC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Mar 2022 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rcPO5t3uLNi0FGvFNZU/gWa0tdZzmKOA22Z7usX7768=; b=ptSWDYwZbPvMbd
	BdkO+BDJM6R+nCwj82LroEHD/z3IJmEZX/lotiWQxubRa0SOHsO9kNOlRW54Ffa2m30krcmxJWgNb
	bNHblTayziaXf9gnV0IpooDqI6a/gNcYnyXtKvmxGRurJjxbuzhpCbKcNG8IjoM6hAR7/odjAaTSq
	Ahp+NQYyTXP5SQr3uug40E6PRnD+XiWmH0E0w6+2xl6DZLulaafn515wnQ0HKIVWPjhMFnlZlwrsP
	LJR4XeE560fjp5Zd3wlg/klpOl+oGlYEglS1JPHHd17WpzvFKH62+WVFyrjIVCjl3M7Yo5w4j4+E3
	UFJ0ycZWwg5N9sf5C6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUljp-00FPTL-FD; Thu, 17 Mar 2022 08:44:05 +0000
Received: from mail.olerise.pl ([46.183.184.59])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUljh-00FPPR-IO
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2022 08:43:58 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
 id E485746D87; Thu, 17 Mar 2022 09:41:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
 t=1647506549; bh=ZNYiuZLXlxCdAPtstEG/gwJieB5RBwA/cHj1SZ3Mpl0=;
 h=Date:From:To:Subject:From;
 b=J6dcfeH6kA5JG9d6kEgnX6cTvF3v4pJ4W9MgrSp/6qMikIANKoglLIR5LwdJolgrX
 kqoXb1wET+R56RYcwnV1OqLc92MWAb5j7YXk2afqJ9fbeyYVKJ+9AqZpSViPfVR7fZ
 tA6mR3FjF2g+KRd7qMQKCpYpGl7qck7U6tBjB4kO+9u5xReUCEvoEq9QTk8b0OayYp
 XkEcPw8WO2+aBayTNIaIZmRh8aSgSHX9YyAQGKdfRzcCQ2FipTiVmMrUF7WZ4ahQjs
 HyICxM4xrEDWxawgLLWhqZ0A160zxib6ek0Jj1ayAaXjqaAJY0OXDt1Xjebgr9EXgB
 lep+H6cvXuXfw==
Received: by mail.olerise.pl for <linux-mtd@lists.infradead.org>;
 Thu, 17 Mar 2022 08:40:21 GMT
Message-ID: <20220317084500-0.1.2d.rvgs.0.rhfq2wdkc9@olerise.pl>
Date: Thu, 17 Mar 2022 08:40:21 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rudzik"?= <mikolaj.rudzik@olerise.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Nap=C5=82yw_Klient=C3=B3w_ze_strony?=
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_014357_781066_A8991069 
X-CRM114-Status: UNSURE (   1.68  )
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
