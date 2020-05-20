Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DC8C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 15:22:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8876F206F1
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 15:22:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z3yLTEn+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8876F206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bKc/3ePS4PdXyHT41hBEV6ieFVty3q8cA9r2N3IFh+A=; b=Z3yLTEn+n1O0yW
	5cNADnMjya6s8mp/K+uwy1c7hmw8DouxrQI/82ArUCHlLHIyDCue6t2R165Vb7tB7ANHs2/ROVnfO
	KWimGInw7WnEnyZxQYa7V/oaRhXbnhWGEY1xWDOfunNLjOb5Xl9d+BVuSpJ1Ok106LrxxGf/GC1uA
	l+hTZHPjQWiaKIOoW4AEXc5EwC0KSM2q15HP2+XiAnOaUUu+oNQdYhL25ewSplkW1covVBPPDZ3tc
	GZeQkzmPQTq4expcApSopI44ItT+cD1gFgLEXqTzniPwJiqnGvsnyYcXj6K+R0w6I2SlfXC66e56F
	CIAamJPhnj56RbZmK3Ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbQXv-0001wy-Uu; Wed, 20 May 2020 15:22:15 +0000
Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbQXt-0001wJ-5k; Wed, 20 May 2020 15:22:14 +0000
Received: from mail-qt1-f181.google.com ([209.85.160.181]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mgf8s-1j7scw34RQ-00h3tE; Wed, 20 May 2020 17:22:10 +0200
Received: by mail-qt1-f181.google.com with SMTP id d7so2783654qtn.11;
 Wed, 20 May 2020 08:22:10 -0700 (PDT)
X-Gm-Message-State: AOAM531BN42DDCDLGYJel2TwjBt36WfeenyaOyjQn10FJOaopj2AJFKD
 zZCFCjGAXEffr6QCR5BbYKNeIcLQIbnkNPleKQA=
X-Google-Smtp-Source: ABdhPJxPaIcts5txZj5QVL3rWtmCCyq5PMXDICJ646QfX7NaTKW5ny+4Lx6EVHwuZMSzUg8JEBr5SbaSH10UJr6q+WI=
X-Received: by 2002:ac8:691:: with SMTP id f17mr5677921qth.204.1589988129396; 
 Wed, 20 May 2020 08:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200520102125.8934-1-robert.jarzmik@free.fr>
In-Reply-To: <20200520102125.8934-1-robert.jarzmik@free.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 May 2020 17:21:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2+auSWBROZR-hobM_qSWtKiG1DRYP3Y7uvbCy_ZLy+gg@mail.gmail.com>
Message-ID: <CAK8P3a2+auSWBROZR-hobM_qSWtKiG1DRYP3Y7uvbCy_ZLy+gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: pxa: remove Compulab pxa2xx boards
To: Robert Jarzmik <robert.jarzmik@free.fr>
X-Provags-ID: V03:K1:2xudLmAnhJ2hVD56vWWrBrEVUUptCoSx68vYrb/cilR3qBMD3RK
 gNa/F7m6WC9MvWrm5794BAn8Cik83+7n/EhRVuQMk0TwrIb4c0ePSl7SEgL1HaI3vWNmwXv
 A5DQgPfgTmx2+uarDtrigHy6Pc5R20wgs7/lE32EsODlrlaz7RjhK750X72ub2eNeuWqA1U
 tC46jOFei3mnFqW+0vivg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ja2pbpv5lHk=:glyVndeE/QLjA8rmndynwy
 y+DvF2E46rrdVmzw5DTQu7bN+lV+/8sFj/vSb6d13HuE3617AHaqAQoC4UrLJAsvpJpO8GsQB
 re4EsgWDW/rChRo+qqznnnplGub2IPfN+Unh/QL+JraV+mnJyLPaWXxccFoAJW4Jv9SggrDtC
 rsp3QfldMY7sScexzbjRu+iQFt6TmpiEzzajrvjXKK2VxHrQYqE984GjqyyepmwTRpSd1/dVE
 +NaQ6hdl25b37AshAed1vlAbZ5/Bfnflf9+Uph833gecRQyhdVXAA9SlsoZf+WfYAFUrLjdTz
 /hdIkf3ebxg6OT0m03RjIAJijGhqlZ+A1uHj73NOeFDcvGeKIq4+MEECr7tyYFHHt2nDuRjFJ
 J2t+KCIGcE7jmeFXzoFRRkJ2g2f/COBkN6XERVpPjOeqWGr4Wc/F125CXLbFKB0tTTFoR0fh+
 J2RejLf+K/NxLs6hlOXdBOU0zo19Z4VtSyNaaN7v1yt5oeUpZ8VibRAp7g+sexCjfBpTfcpID
 YVssxySPGn8XYQRz7pTsW43vB/8aTOtygv6LAEYnyn20mE5tPPkomq+5XhjSJ6gxqhcxP4JUv
 ZmwmnfDJISj+nh8jlgF10uSnTGj+gi5m2V85k0lsdNyw6ASgvDisp3jkj112dNpBLU7Ly6kuO
 YuxEHOTABDOZcDYDlLrxZLbjuS0dnqRbNblyYwqbPLaaLjIKxK18L3FWaXPZCE5TWN07VlRLf
 jjIyiJtxDuKctuR37de/rujx+Gw5Jk95GHy4MISs0bZC8DHEnSyxVwnQ5jfx4j8LaFSISKeCD
 9JEA2wIV9zcY+1AygVoNs1opW2MotaIefPFlghON4KPUDx3L1A=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_082213_509358_9653131E 
X-CRM114-Status: GOOD (  10.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 20, 2020 at 12:21 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>
> As these boards have no more users nor testers, and patching them has
> become a burden, be that because of the PCI part or the MTD NAND
> support, let's remove them.
>
> The cm-x300 will for now remain and represent Compulab boards at its
> best in the PXA department.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

Acked-by: Arnd Bergmann <arnd@arndb.de>

Should we take the series through the soc tree? If so, please
send them to soc@kernel.org if there are no objections;
or along with other patches you might have in the pull requests.

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
