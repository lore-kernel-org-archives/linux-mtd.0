Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A710C0044D
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 21:01:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FB74206B1
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 21:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XMompLWw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cartesi-io.20150623.gappssmtp.com header.i=@cartesi-io.20150623.gappssmtp.com header.b="wcg4DTyc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FB74206B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cartesi.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oQ1sJx7cBZISMU2eFqxu4ZuqvIXDB9Ce3+yyaJ4/s8Q=; b=XMompLWwUggoOKELHC4qK8Osuk
	5cSC3An0GbFkoxdyGzzofRVDJ4NrOqJend1Z5J8Dg++wBVk40hJwbbyvaMWIdHyN94pYnBn8O88H+
	Ifgd4+2nadNb6W2XfYeV5cxUQ56k2gBbyQtW1JWzAC6Om1hx8mUkjg+Y36Ct++91QiUujSdblUYNo
	BZuv7yi0eyaMktxmDIUyGZOerwhV+i9NJl3aUp+3ikPi3LBczmVJa2qdwIfESVt3kYKZmsSo5eFne
	D7sbU8HwF/M89cGGJZ93JcHXtY2feQ65MfBzR9OSNLGKleBAA+ga2Nte8d+rQh+aI/BpkeWyNxoaq
	9OdugC4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC8Tc-0008DE-MP; Wed, 11 Mar 2020 21:01:16 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC8TZ-0008CL-CR
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 21:01:14 +0000
Received: by mail-ot1-x336.google.com with SMTP id s15so3649485otq.8
 for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2020 14:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cartesi-io.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ns8pNt/AZp8wxupvpZz8f0DwcEdrB1oGqd8Uvo5RAe8=;
 b=wcg4DTycgUYgJGeSZyCLiV0fkDn+4EynrHMM+im1nbIa6vYp/r3UOqZZ7TsaKBKiyC
 0ZYTmPqii+Y8LoqVVedF9whM6HWzZkuH/gnx9NQsCPAKKi84+6RkQW7qYR+UL/fxv2B9
 ALUc4mkHRf5aYYFvDTqqJxP739wu9N2puF3lDkbmx7qMo9/kAPDC0w/HWeFbddrj0CEp
 Y9X8C71iqQfYEYkjc4+GtAjzW0JBiXllXFWGDcrAOxUSNbSD374AxpWgddIGJ0Re/qsn
 NMc5ezJoftKoUDn+vKcoELN/mENQSjxH3vBnC1JonKcDJQ/P9xLeg2ujGw82f+mfPV36
 2Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ns8pNt/AZp8wxupvpZz8f0DwcEdrB1oGqd8Uvo5RAe8=;
 b=LkgezYC9/h7dDxm4yocwnX4aSsM05lc7Hp/U9YbyRJ2/yQnIhHmXjW0csRmIy7ga9g
 6sDQGhX1Th3uRN+jRRy4hXpYEZdqOEC0ZvvtmihChJCjNxAyOCYACtbyl64H1EJ11RzH
 ZPsWpqqmqoOy+qbIIFhuzj3HNXEFIGsWLTY66V4jNQZ6PL4JiIfMULyBtSyJhN1jgBwR
 OJq0oNpoL25ewa8orYniWNgwqC2x6Is0/D9ElykucZoLTBUl0LCRDcnHxRaaoAFaIeu0
 ucQHfq/657rKYskwVpk8n6b6sBjd+3n9vydjFiDg/RqlQ6ZsRuioQ9yvpNenK14knGq0
 hT5w==
X-Gm-Message-State: ANhLgQ1EkzvJgpuvwvXNwxBiIDb7oE1vWaPUCDhy8kqp431/r3jUa/j6
 vbQJZAcrbD5d0SrU2zf9YZN51IWebQ3drtgJt4yGODzCnpHdOw==
X-Google-Smtp-Source: ADFU+vuAdNfqezRWSEX6XeEQkvlQ1RTpfWcSclyZUN9evd71F0+ZW+B+AKxMw4mjVU7HXdD0JPTrify474U7AyU5zCU=
X-Received: by 2002:a9d:3435:: with SMTP id v50mr2499507otb.19.1583960470657; 
 Wed, 11 Mar 2020 14:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAHpUXUx8puujULLTtLTDEvEVG+gasJcmj9QxLC5vf69+WzL74g@mail.gmail.com>
 <20200311213120.0141aec0@collabora.com>
In-Reply-To: <20200311213120.0141aec0@collabora.com>
From: Victor Fusco <victor@cartesi.io>
Date: Wed, 11 Mar 2020 18:00:59 -0300
Message-ID: <CAHpUXUzEQ+0auo=MPefrp5cbWb15JDvsU48tFOZ++qbTGcvY2Q@mail.gmail.com>
Subject: Re: Possible regression regarding the name and size of MTD devices on
 kernel 5.5.4
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_140113_569283_A2A51B56 
X-CRM114-Status: UNSURE (   5.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On Wed, Mar 11, 2020 at 5:31 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> Looks like 2 regressions, indeed. Would you mind sending 2 fixes for
> that?

Yes, sure no problem. Which tree/branch should I base the fixes on?
Stable/linux-5.5.y?

Regards,

Victor Fusco

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
