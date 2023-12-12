Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B316C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 09:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vttFHNlJZ6kMZ3kV0RKtO8YrwFcV5lTdezko+E42hdE=; b=RJBUAhAuvF0iMC
	7m6JbZev0UVzxQUSuO9eZWdv8WZuu8b/BnBNc+aSHqmJu70bVj7LkKumjBp7TV4Te6lN3g4xiOfMe
	Ewx71LWW0NO4HkUnMvQy0qh1LBG5P1llMzjpWL2LUrpHnMQ6rYMLEenjOO5uiVkbvAnOaitfEsnJ9
	WSLy+0lQQ6OJNTkiPybvDPMdaz17RkWNXwKQjtUfEJR26/TOQlrZ1sFqJ9eD/O9zSE+GQkwFHTfwm
	hkZszQswYF7icUtmu/HU7C/jvbXXQjkq/kcae9dPC8R7G8qmQ8tlC2Calctsj1UQV016DolW2U/Rh
	5BmF89ADS3uulJrd94fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyiB-00B8CB-2j;
	Tue, 12 Dec 2023 09:05:55 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCyi8-00B8B3-21
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 09:05:54 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d0bb7ff86cso47561565ad.1
        for <linux-mtd@lists.infradead.org>; Tue, 12 Dec 2023 01:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702371949; x=1702976749; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8J3ToT2VvaAxPO3SoURCiKLrbweGhEdkkz9IvoFcDFw=;
        b=RKCbXfHxw9DsL8RtlnioZHkcmzng2IbQKaUfKytspDq515uZhnJQ4h/xf1uQO4GmVN
         gfN3Gi/nzKaDgZWNKoT6fUoIxeAy58kkWsR8P8E9ysmcINE0TVmosHbmJho11OFDv5WB
         zWf7yAanNA/ET5P9uiMwLfjWr4n6IYWWNLcO7d1+/WeWfqQgIM53ge0HkIZ5eAu2TaSG
         gBzitznXQExqwGEzC8PL/SsgEyFB3j5bTDenDbhstyposjHegzFso6OGAb6PQvwchqzG
         s3wcJxJrxxmQn7AvSTTv1AYLVw68qM+LILab3YDfL4MDHK/v0BMd5b3eZ5RsyE2PagIv
         yOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702371949; x=1702976749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8J3ToT2VvaAxPO3SoURCiKLrbweGhEdkkz9IvoFcDFw=;
        b=kSWna3K33UPdZTL0iEgnDstqa7cErCa2hFF0fhTtXXRQKaYNpwwa6Q/q8FXzS+Tyat
         /3rv5SuseUsgnJOcFO9aNVmHsSbjo3At5190wZPw+/vYo4NIADswcOg6cRwtyX1ujdnt
         ZiESbD+XZPhcgz8lEcVEZP1etcrBDcXkcuYsUc4UY8pLp3LhzGcO+LD1ux4LAllrqgLq
         wUW8fQgMwrQFsIqLAyW2DAhK7ijwDU6NhHRv2vPNPlslhnOT6oR9XOHduqMdQq7YWLFo
         UB6hKsWTq4YEbLwDJh7MliDCe0T8U2ux3LsXtOXfYCMC7N+KaXAI8eNlKK+GmM9Yha3y
         HuZA==
X-Gm-Message-State: AOJu0YzYcDBW8cvvKXU5gKT6TOyzFrxvHv/3b0IOMAsdfGwQWcSb2nMD
	cs2jOgNWfkOwvTl1xpdNpGAtz6ZTCS8EmXT2ymc=
X-Google-Smtp-Source: AGHT+IGlbaB0drAezYggITPbdD6KESkZfGF006AAn2QqGx2yUUB7PErPRlJZVfFcoz2yQKCSVh1fweCwbqtJp79bjhQ=
X-Received: by 2002:a17:90b:33cb:b0:286:7529:3598 with SMTP id
 lk11-20020a17090b33cb00b0028675293598mr7559037pjb.13.1702371949499; Tue, 12
 Dec 2023 01:05:49 -0800 (PST)
MIME-Version: 1.0
References: <20231207075147.21851-1-jaimeliao.tw@gmail.com> <f015ef75d6bb0a9f8edba37b40affb60@walle.cc>
In-Reply-To: <f015ef75d6bb0a9f8edba37b40affb60@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Tue, 12 Dec 2023 17:05:30 +0800
Message-ID: <CAAQoYR=8b7NR8h0SHz=bp9=XHzZebDQhPUOc20b0eAF6Vd1kAw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Introduce spi_nor_abort_octal_dtr()
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_010552_710647_D26A73C5 
X-CRM114-Status: GOOD (  10.90  )
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

Hi Michael

>
> > Some flashes contains 8D_8D_8D information in SFDP but did not enter
> > octal DTR mode if conditions are not satisfied.
>
> What exactly are these conditions? Rather than "abort" the octal mode,
> the flash shouldn't have that capability in the first place.
"Abort" is not a good word.
Is it better for using "discard"?
3 conditions should be satisfied before enable octal dtr mode.
1. function hook in nor->params->set_octal_dtr
2. nor->read_proto and nor->write_proto are SNOR_PROTO_8_8_8_DTR
3. nor->flags & SNOR_F_IO_MODE_EN_VOLATILE
Flash driver still bring 8D_8D_8D protocol instructions in 1s-1s-1s mode if
conditions are not satisfied.
In a case, flash ID didn't include in vendor's ID table.
It will be "spi-nor-generic".
8D-8D-8D information could be parsed in SFDP but nor->params->set_octal_dtr
didn't hook vendor specific function for enabling octal dtr mode.
So that it still bring 8D protocol in 1s-1s-1s mode and have no chance
to select 1-1-8 protocol.
I think it may better to re-select a suitable protocol for this case.

>
> -michael
Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
