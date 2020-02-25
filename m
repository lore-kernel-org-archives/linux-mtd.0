Return-Path: <SRS0=ETWj=4N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A94C35DF9
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 08:54:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 624E12176D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2020 08:54:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dqZm8jdB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+eV51aj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 624E12176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGVVO5s7xA90kkE5S/2pctXhqJ33es5R+dvn4d/wFHY=; b=dqZm8jdBedolTf
	IIcQWtsFkR9fAvtGGV0aO1v/kulDt4j/nLNoYX2wFNMMb7sddDby/rlL0uRdJNtVFPsn3uuO4oc91
	A2zCslWt4LIgXedBt66RRN6fKN1YbHG0DYvCXMvmDhaD+Ms/bQSrHVQzaZoFGIirYa2gTOlCwZh2Q
	I7FTh9CA/atUo64NhFyr/zPkn5oTxTNQV8vKD2Mi1jxQzKybo6SuxVwrud08pkWvxyeelMzlBCWk0
	zx5G8wuanMnRds1f/DGvB6aiH4QizW+3WEkRAEpCU12aEiudNySAj34IriNqrvinembcrIrEKGG7w
	0xrd3LA+lSmx67ntw1kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Vz5-0002FO-S2; Tue, 25 Feb 2020 08:54:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Vyx-00023W-06
 for linux-mtd@lists.infradead.org; Tue, 25 Feb 2020 08:54:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id a5so2103115wmb.0
 for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2020 00:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U0PYL1EX09JByfmO82VsPx+EklZ6SE+TK5zxgWF95t0=;
 b=W+eV51ajb36vCjn01EWBwxH1xSBZgwywE2seO4uu8368p3rslC3DCjrDyxVWoVq33a
 pT03fa/SycKxVKEiP8aA0i5MRaNC3WAlE/uaE/WbpWJPBW0z/bSR9myoJKp4vTngvWC4
 3TUhVhbw4yH+vR1GGSzDYK/iO9Qz8yu4sHoCGQ8uqnmY8Q84NETxOu1qTuTnT61Y6201
 gVdrHNgKXbLr5er5KxBLaY64XYvf6hpgiSIm3PaiIu/IdK6qEYoyYyr7Rp/2Yh+4+pI4
 9fXfXaPF4eByC6nrf2xk9iqJ2021ynP4CP5k1F5zIeEplLoErHVyMcrLKwMqDnJAJFN3
 GiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U0PYL1EX09JByfmO82VsPx+EklZ6SE+TK5zxgWF95t0=;
 b=H+NGGnQlsZEXVwlX5GLa6hWQxLPGVROScDrRUrcZ5iqkWTktxgdOR5pieY0DKGmBeZ
 vEWOVYHQg8v1bG1r6hmRptlfvSOAPnZAvm0f02F61FXEMnVE1vNqnAq4UIWns2WFzw6k
 9gumBtqsaVhTbgfOmTse/qGnK5h/vFwuIwSs4EH+VCsXd8ouT8D3uoz+8KfKRJdp1cDX
 CUFdKroFxKHqk7YVjXKC7IYaZ8Cr2mBxbLwDltVAy7l1XAnVwepRzJp5tV40JfSDg9uU
 0WrbljTJgmPq12cX5GX5yOj03aLSTBHAgTQzgUn/y67YCrBY4uI66+eCAx+zlaBABq5j
 EH9w==
X-Gm-Message-State: APjAAAU+p09c5FWemrMakZ6U6es7I3NIaC8a7BluqqU9OoMsUUYgjoP1
 zkJcAiwYPORgM8LMP0urFH8sw4dga+OOQqxdeb/eug==
X-Google-Smtp-Source: APXvYqyc961qX+2JrtC1MNXmnzDuUswVdsNvJ8js7bbnIhuzwKrcAR0/CYTa5GP7FTl5yUjmZyg7jrx2YbAMst+bTTg=
X-Received: by 2002:a1c:6389:: with SMTP id x131mr4188097wmb.155.1582620861248; 
 Tue, 25 Feb 2020 00:54:21 -0800 (PST)
MIME-Version: 1.0
References: <CAA=hcWQOxh-FDU9iy-juGySDdxDRvj7nKDOWebQS7zF7RJ+fSQ@mail.gmail.com>
 <CAFLxGvwUMsXCO2yG27z7av3eAajwEzuHafX9Fimejc_u2mpGig@mail.gmail.com>
 <CAA=hcWS1WPA-Sb93rGgXYFnJckYtwypTXS2LTZ=HhLRiUfYnyw@mail.gmail.com>
In-Reply-To: <CAA=hcWS1WPA-Sb93rGgXYFnJckYtwypTXS2LTZ=HhLRiUfYnyw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 25 Feb 2020 09:54:10 +0100
Message-ID: <CAFLxGvy1SSc6-snBCViMUf79bON7w3xNPfDLJeYeBf43edDvzg@mail.gmail.com>
Subject: Re: File IO write flush time span
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_005423_172521_C1C9D884 
X-CRM114-Status: UNSURE (   9.08  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Feb 25, 2020 at 9:45 AM JH <jupiter.hce@gmail.com> wrote:
> I was actually talking about applications write files to a UBIFS
> volume mounted as RW in Linux, let's say if I write a file by vi, will
> it immediately flush to the NAND or will it stay in cache until some
> algorithm in MTD to erase NAND pages and flush the cache to NAND page
> based on size of output or time, is it correct?

UBIFS is a filesystem and follows the rules of the vfs and pagecache.
But it is less forgiving than ext3/4. To make sure data hits the NAND you
need to properly use fsync/fdatasync().

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
