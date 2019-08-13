Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25640C433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 21:43:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E883C206C2
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 21:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VLN8NoAD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZ8f+5k/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E883C206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YT1yHUBmVyJ4T/zSZvAnu/SOMOZkLbDlKPlDpBfdf/8=; b=VLN8NoADyUT9Q4
	zA+FfqnzKgFOgbsM0/L9PoruQHa1aKNQHQE4R58pn1BQlNECDh6Hk5JDkKlyAHAp6qhwAngk5DMQE
	kHQGADiTqKcmNXgNFn8yR/xOyxGULfYf4ZUrK0kOhsmgwv1LRu44UoT228ripYF4ySJsLmaLpN/yp
	BHZNyQYssl3bY8P5C6AIFwg3vqFdeAnSadWj/ZVQ7l7fIBOdA6+P4D9ILHZCKag6sqSVtYScHET2t
	WNMpIy6qIhrRHTOrOnnB+R4zsJHu6GuL9+1S/WmkEXqlQ6cHJXIVrccG7M5RXchWpu3vlytfpdU98
	ERrsAnY+FS0tpXa7ML9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxea1-0004ka-RE; Tue, 13 Aug 2019 21:43:45 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxeZz-0004kJ-Nn
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 21:43:44 +0000
Received: by mail-wr1-x441.google.com with SMTP id q12so18865420wrj.12
 for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2019 14:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HA9k4jWcE6EwpyfOVUWvgKBkx2GCDQVhMAM3RavZwSg=;
 b=MZ8f+5k/fznc/QyZGQ49I994yYlfbf9RAnpB0jyHIPrUh3mMdiOFe3fkYs2TiTiBPy
 Wl7N73j2Ax6sZSOd65X6LBFT5iH4lHRU2szMkMqFtwaDxrGnjON8WdtK3vKq6eCLxIdc
 yVPjBrtZgx6r5OocIKhakmMryH4iulCdqewIr6aoyLxlVTiPtpCfja4ZUdWK6EBLZ5CT
 Oml3VqmkzSkURgzZEzLmRNyRJbxqlQ+bTgIXnZYigiiNv9twJdtivck2hFpp4lRMxLu1
 oynIeRB8iADJn5Yfy9PMQxsF6Lplkhqt3oOmP5L2OfA7XQJ0l+gnyu/r5gHKvH8wA2TK
 GJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HA9k4jWcE6EwpyfOVUWvgKBkx2GCDQVhMAM3RavZwSg=;
 b=jhDmeJIsOs5aAEUHMzMos8tkm96SkjOR+8x4cBEktMVL2VriIFWF/i0T9P/HMXN7fz
 4UfYFwbM4rCJHlbL59oVTcxwxaOoJN8jAzbP3LLjkvwbfEjt0jryIrCrvVt6ygNqkBc7
 5iuifhWr6One77HsE/lPGk0NJa3TP1+mb/Tdkc3GJMvpjwnHVAZrBNVKrMEjal3FMsiu
 duW0AKgt05B5edjkxALrKJUMmAdRKKxTquR5W5SaqJ1oMwNxmwFKRyYf9/uF02ZGrxoC
 RVfhCl7DAlgglpEAncP4Qu6zVlrUTrAqxbDY9DFx1tNclJ4iDJwdx0p1lsvG1jhfCKPf
 1vQw==
X-Gm-Message-State: APjAAAXJnLsvJrXVRQWxPo58uA2xn4RKSiwgYIlAyWTnw+PnK+SWk26F
 EUhLe3tfkBxTreriXeWxX+FZZOnJQFUFFpPUHuo=
X-Google-Smtp-Source: APXvYqzyOwmCS3luTkiGFItwHavkb2r/eG0oc98BsPGyOILjb86vRta7cOC8vBlzNcCh/BeA/oRT6W0V30fAh4qSWU0=
X-Received: by 2002:a05:6000:12c3:: with SMTP id
 l3mr44881907wrx.100.1565732621921; 
 Tue, 13 Aug 2019 14:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <1563602720-113903-1-git-send-email-chengzhihao1@huawei.com>
 <CAFLxGvxEAGtQDFm4G3orY+M9yuthDA4j0+u=HbE9DKuo7H8WCg@mail.gmail.com>
 <0B80F9D4116B2F4484E7279D5A66984F7A7472@dggemi524-mbx.china.huawei.com>
In-Reply-To: <0B80F9D4116B2F4484E7279D5A66984F7A7472@dggemi524-mbx.china.huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 13 Aug 2019 23:43:30 +0200
Message-ID: <CAFLxGvz__aw+BnfmGS3XXGqT6n6q-9miLPoVcL9KuvaZ2QbVUQ@mail.gmail.com>
Subject: Re: [PATCH] ubifs: ubifs_tnc_start_commit: Fix OOB in layout_in_gaps
To: chengzhihao <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_144343_801969_9A322C8B 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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
Cc: "zhangyi \(F\)" <yi.zhang@huawei.com>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jul 30, 2019 at 3:21 AM chengzhihao <chengzhihao1@huawei.com> wrote:
>
> OK, that's fine, and I will continue to understand more implementation code related to this part.

I think we can go with the realloc() approach for now.
Can you please check whether the assert() triggers?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
