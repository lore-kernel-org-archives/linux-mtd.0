Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A22C07E8E
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2024 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YkQq9lLr1filEBKIkDEN1PKVsQlQw4dDJHbI7W7MSqM=; b=Xeq/1ApQRBMK5O
	d2g5t2MB/5Y5np5wKXip73Q5e1kccZ0LGeq8Q0XqEGlRSdmBsf5TuS/Vv0wunAdgp1vreKyXv4hjA
	Ih7PDO0ShttLpFsGTtqvhwm2ksW/hr4WJqF/eXUkifvUADqFHVorQUO1uXQ5npimYDMiDohzDdwiL
	Fltq1OhQNXE8Ui/fvsEqmSoJCN0PVXa2GRsiYCT7Yi7ZbDVO8vV1ypSFlg2G6xJFU/ToF6rtB2WEg
	Eou90AbVHThzAE4Crv6F0PfGGd+KnKQJh7FLqQHdLh1AqKkRiZx3MFq+oZH27zg2MuuN3dhDaCJrj
	kaxL5+0ZmNYSW984wPTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzXpW-00000003G1m-0q4s;
	Wed, 24 Apr 2024 08:18:14 +0000
Received: from mail.tradeharmony.pl ([5.196.29.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzXpQ-00000003Fyg-0Rdb
	for linux-mtd@lists.infradead.org;
	Wed, 24 Apr 2024 08:18:10 +0000
Received: by mail.tradeharmony.pl (Postfix, from userid 1002)
	id 3318325295; Wed, 24 Apr 2024 10:15:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tradeharmony.pl;
	s=mail; t=1713946582;
	bh=niuXEqqR8RnV+jmqddfR0pqtgAFtRJIUEsYODsA2d0w=;
	h=Date:From:To:Subject:From;
	b=Pd7kwJS0+yal3K8HTFMFsUS/odzlwlQ0xvwQh/8sgDa1QVfW12QeBdfcBYnzSzrX4
	 7QmTnJCk4pKXKhPELj5KL0Tn9n8zKyg61Lt/oYQ6rs9vQmSxaps/BW2acxuhOEU7Xi
	 My6Nevd+vYx/dUnwCz/jkqtHRYCBYaNdT39RZNmgo+/8fyhHSlocTfTNht+kj/xtks
	 h0vWtwrRKr/ZlmiFKaNP+CVYTkG96WzA7StqN9Mxk3ZJZVKCLaGSgKuB30gInY0yoD
	 T4yVqiXyd4/Q0C2LKGA//awl4AI4tzYojkjQQxZjiGa318c6AeQGz8U7uWXfzzI5iK
	 bn5z9wLjrPR0w==
Received: by mail.tradeharmony.pl for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2024 08:15:25 GMT
Message-ID: <20240424084500-0.1.5w.28jw1.0.4sgz79c9tb@tradeharmony.pl>
Date: Wed, 24 Apr 2024 08:15:25 GMT
From: "Karol Michun" <karol.michun@tradeharmony.pl>
To: <linux-mtd@lists.infradead.org>
Subject: W sprawie samochodu 
X-Mailer: mail.tradeharmony.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_011808_485645_348CD36E 
X-CRM114-Status: UNSURE (   0.66  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWVsaWJ5xZtteSB6YXBld25pxIcgUGHFhHN0d3Uga29tcGxla3Nv
d2Ugcm96d2nEhXphbmlhLCBqZcWbbGkgY2hvZHppIG8gc3lzdGVtIG1vbml0b3Jpbmd1IEdQUy4K
ClByZWN5enlqbmUgbW9uaXRvcm93YW5pZSBwb2phemTDs3cgbmEgbWFwYWNoIGN5ZnJvd3ljaCwg
xZtsZWR6ZW5pZSBpY2ggcGFyYW1ldHLDs3cgZWtzcGxvYXRhY3lqbnljaCB3IGN6YXNpZSByemVj
enl3aXN0eW0gb3JheiBrb250cm9sYSBwYWxpd2EgdG8ga2x1Y3pvd2UgZnVua2Nqb25hbG5vxZtj
aSBuYXN6ZWdvIHN5c3RlbXUuIAoKT3JnYW5pem93YW5pZSBwcmFjeSBwcmFjb3duaWvDs3cgamVz
dCBkemnEmWtpIHRlbXUgcHJvc3RzemUgaSBiYXJkemllaiBlZmVrdHl3bmUsIGEgb3N6Y3rEmWRu
b8WbY2kgaSBvcHR5bWFsaXphY2phIHcgemFrcmVzaWUgcG9ub3N6b255Y2gga29zenTDs3csIG1h
asSFIGRsYSBrYcW8ZGVnbyBwcnplZHNpxJliaW9yY3kgb2dyb21uZSB6bmFjemVuaWUuCgpEb3Bh
c3VqZW15IG5hc3rEhSBvZmVydMSZIGRvIFBhxYRzdHdhIG9jemVraXdhxYQgaSBwb3RyemViIG9y
Z2FuaXphY2ppLiBDenkgbW9nbGliecWbbXkgcG9yb3ptYXdpYcSHIG8gbmFzemVqIHByb3Bvenlj
amk/IAoKClBvemRyYXdpYW0KS2Fyb2wgTWljaHVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
