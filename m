Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E818BC169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 09:50:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7847218D9
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 09:50:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AD/OFxTr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="1JX5DiUB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7847218D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjSui+f/bMx4+eyoKy/iH1SPK1aBpey2WtvPVtQKetA=; b=AD/OFxTr3TPeiD
	dHE3nv339L5ydzWR4VuB50UxQ8NQJG8IlIodfQ5yXgFma/mJZ/UfM+HcIJ2lSK2OcdgbeP3T0MWzG
	qqN6XhgIC4KQ3qjktehk1YSCCEpHR5H+IBEUbAyOB9IkxWz0r+qcy4by+KxFfYtl2Q8HUEGP4NJ0u
	ByTbsQtdmrunR9tNSTd+AitQXgJeMpTVJhYpq/0LdCwgY2vRilwu58ayCqwFscF9LL2LzhbvIdhdW
	ZCAaYkalfgZh3im6qTwaDJr9no0n53+5URcW6a6Hhls5ar3u2krgpmZZr+Va0ZfWokfJ+mk2LNHAA
	Kd0BS0YElABT3HwLr/zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs2nu-00032V-OD; Fri, 08 Feb 2019 09:50:38 +0000
Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs2nr-00032D-01
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 09:50:36 +0000
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id x189oAD8000992
 for <linux-mtd@lists.infradead.org>; Fri, 8 Feb 2019 18:50:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x189oAD8000992
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1549619410;
 bh=5eEFdrqXpbL+j89kaxfwCjisLzIwQBKngAOVuu22ayM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=1JX5DiUBhSv4cRk3sL8bGmWH2syPf/rQkg56+o+PpQYAwNFqRkP8emVhysNzMf5bS
 7spCXd64XerOu5MSC2I+/71qRCDcAbEq0LEkxYemYjgPNdNNz4xKNhjKhZ5YRu9vkG
 98jfpN2lGWjKlX16Pf5/CvOmjIuY+tWGmXFpwcmuIppGqNGoYn0/1/UB6VSnXoZLU1
 J9TbnclSkDQARA4cKIyM0fZ3CSWrWTcmMAG0fQe0nVhL1NpFzLtp7rk/7gwSIET8ag
 xvJsNndN3Dbu1VwQ+XTfEF7hj4PQfEs7DnfzVkreQKId9bfm/L41Qp91jifQoUDz9/
 pRUEY8NrrKOsw==
X-Nifty-SrcIP: [209.85.222.49]
Received: by mail-ua1-f49.google.com with SMTP id z11so915128uaa.10
 for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2019 01:50:10 -0800 (PST)
X-Gm-Message-State: AHQUAuYBjvV1q81xmwaEr7zaIBOtdbwMh0pUkLvwNDtCf8BrdOTmu8YK
 hmrsc+uLU6FiLV8Yg3BeOYCC4JIn50Q0QHH6wGU=
X-Google-Smtp-Source: AHgI3IYnNwm3VK/r4QAiJW2ijwLintg0lvF+3SzzV46BnEltgsgYmmShH51unR306PM0+S3Rw0QA1eYFUcaB1uRbKOU=
X-Received: by 2002:ab0:3402:: with SMTP id z2mr7961605uap.6.1549619409590;
 Fri, 08 Feb 2019 01:50:09 -0800 (PST)
MIME-Version: 1.0
References: <1549613335-30319-1-git-send-email-yamada.masahiro@socionext.com>
 <1549613335-30319-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1549613335-30319-5-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 8 Feb 2019 18:49:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNASb7iDMf28TGtn=-Gz40K=PgdPrwG3sOa_3oL-PLhtBfw@mail.gmail.com>
Message-ID: <CAK7LNASb7iDMf28TGtn=-Gz40K=PgdPrwG3sOa_3oL-PLhtBfw@mail.gmail.com>
Subject: Re: [PATCH 04/11] mtd: rawnand: denali: switch over to ->exec_op()
 from legacy hooks
To: linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_015035_273981_60B771D7 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 8, 2019 at 5:09 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Implement ->exec_op().
>
> Remove the deprecated select_chip(), read_byte(), write_byte(),
> cmd_ctrl(), and waitfunc().

I also deleted read_buf(), write_buf().

Will fix the log.




-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
