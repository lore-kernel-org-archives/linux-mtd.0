Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC6FCCF9E9
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 09:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tmi54XzW0cmW1EEjyS2pBCIBe20yAIhgpyegKOylQYg=; b=Kf7lpPzqr3cpIx
	8XJbFtJOyUXdAMSIqjSEFFYdf9mUItgP3dL3qryGnoC+ZQcrazE5sJc9ZPkHDu13IE/5CtVKigmg2
	IgPZXJoOm5ohDja9mm4PIca49rHvrcmj0KhoiPMHhG2Va33kcp9CLx7tlaBmgn4KQXW9tD2ecdFWU
	gOqUd78YcR/pByY8IhQpIF6K/zpb5AqroJ3SpjRedGTk+TfwTSavoRfhsHiyYwR3VGPi3WhfOk4wU
	/7Sljsz3y1USXqyzmmweXKq6l0UgdCrDu6Kh4Ct+6cFM5gliV7pBfkHdUQmjCqk6ahAO1U7D4nCoa
	Fszi9+iIsIzac8EXkm/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stlAi-00000007xzk-3M11;
	Thu, 26 Sep 2024 09:52:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stl6z-00000007wuD-3EcL
	for linux-mtd@bombadil.infradead.org;
	Thu, 26 Sep 2024 09:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=tRdsbJY25B3a8k8qKa0EJwZ/dzDVfGUya9eB7dbMVXw=; b=hoUfunrPLBSINJdKfUAkhxhBjm
	BaS9JJaZx55nRpbt87G7XhAPA2b449ftbuxX5npT6k+v8BoFTvWPqINjiolVOryqxYGPIiyYAVCCx
	LhR0JgoIF+6du37dcSTR6LsKR2NsAflZEZsteXF/7Vxn6qpO19/BhuVPnArnHi6sYqA2LPdCS9QuI
	sP8PdnIuDtmGVPT7RVq6bweIzZAU/hjqlNYLhrqJgJy6+nxm5psBUt3RcgMtXWW/20cYkWNUBY/HN
	YLXH777Mi8cIHwm6+nPAniWeX+GvC5E0PWwxP7HFKO32V7V007VQv9csimfctnYwGmlWg/MkZ4csC
	DV53EN6Q==;
Received: from mout.web.de ([217.72.192.78])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stl6w-00000002BH8-2fIM
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 09:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727344092; x=1727948892; i=markus.elfring@web.de;
	bh=tRdsbJY25B3a8k8qKa0EJwZ/dzDVfGUya9eB7dbMVXw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=N6d60AtIxf5OOL90zBizubDWpWb1K139rFzXGBpfdJli3ptI1rr1UEyyeEt3Zaw1
	 Q/zFcLLo41FXKeV5ukwU0dhofmpfbGYRrdap2WBV0uF7MrDXr2woqEoFPWDx3GZX9
	 TxfEcJiSvw9C6ABhOfALW0yflync2XhToyTTjX9H++ByRkaPmvsquvxwLV3oiNZ4o
	 v+Xh8myUSG//IbB36VZLovnk2AQu1hIIN4JtdysUBrk7sxeZRFWSU38iC/dabZVkx
	 8XjG/QcQwhOjL7guEU++b8VSK+nepVXRitOAXIoNir6HhXS8t/oOwPQQxTdyyOM2S
	 Lytc540h9X/3r/v5gw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.84.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MBS6v-1smHvY45oV-00A03x; Thu, 26
 Sep 2024 11:48:12 +0200
Message-ID: <ff787fb9-a9fc-4798-8460-3ec310e6cd9f@web.de>
Date: Thu, 26 Sep 2024 11:48:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH 0/2] ubifs: Adjustments for ubifs_purge_xattrs()
X-Provags-ID: V03:K1:SKo6e36D5dAX15LA2EoqmfyeK9m+ZMvHq5SxSQFIUZB7ZQcVHeU
 g5urHpUmbs0Kty7DAM+jw15DdBF2XGfaq1ofz62o9w1dDb8wyC6AuQH/isf0K12cV1iNmtv
 6kJo5sZXTcEwfcJTTZM+eerRUIBf9tS7cE5Fzfn4ETTWnvfQ75z7mq2ZvPkbKvFNHYhJ7Pj
 Hzry6Hm5kjzdmrxd03ASg==
UI-OutboundReport: notjunk:1;M01:P0:rN3/utJeV6I=;UpEzucDmePMbuFiBcP/MHq8KdvP
 aQf20N+Gfm02sm0eFEiecQHkpYbxpVUSKDoZAB9G6vMftVFgkyIiTSvYBnj5qLA2XHY6T9yix
 HImGe7FwPsGFIEJjs+Jtt2nfZ9FjPU0fwKrMnj3vmLyAhD/OwmvC1kCW3XEq3eQyI2fedGYG7
 GiBHHh/o3UK7fMPCSq6aztvhp2AJpYuVKBT4ijCOaYYs6oRsQ9L+Iq6pP30ipT+XJ70mGAfC3
 aopOI1VB6XsmPvyhM+jr+Vza+IXwozlNE1EAqoIickaPxyp+QAtpWt3hCr8kLDZTBTwgt/vZb
 2sggn9ui/q22a1/7jWMQRffzUnGOlfUgoSqL7mrNsO9LCLT6LsalIXoO+6NnuL7UjGdmASTdK
 o2kzfP+JC1jnmRs6TP+v9g7SrBBnRBFIUpPnGf5+EIDi0em5YQbsPxXMxhvQ6LtxEIdhUJW+a
 LIiM6NWEBs2ZaqtF4bF07V9HolJAUj/E8VI9+N/GdHvSTkJbzNFj6rVuiI+3Y2r8q3wjd/WvH
 Gp2MyiyFxxxsWCjbF4JzL1lUjnzPg7VMFqsrDL85qYPX0p+2M4XQJdOxQ5gCq02sn4V35WMJf
 552dFcWno25oq2EGhaaMXrK4E2Dr2uHLKz7xiXrKcHp+NqVgHhg/SJUMcXCjpSmq7hlhb0lW3
 Pr+32xLN5/RV+ti1zZiAvJA08I29samtLQ1smBmCs+kTuD37rSg4vncBOq5D14SmWnHgDNlN4
 j6Nys7KF6F2ljHQ0MwWH5TnuaVVhi03vV3D0GhAaAFtjeekjDC2Lj6oGRYmB+bUDlFYHB+tvi
 jFdE0xSaS06/rB+E+aD8knvw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_104834_909534_E18F8674 
X-CRM114-Status: UNSURE (   4.40  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Sep 2024 11:38:22 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Call iput(xino) only once
  Reduce kfree() calls

 fs/ubifs/xattr.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

--
2.46.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
