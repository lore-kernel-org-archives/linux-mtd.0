Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00164C30658
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Jun 2024 08:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TiJSyYlUEo/9taK5+kBezVcHzHhzKRXPoIDqdk5/5vE=; b=Iq6CBCNPrxyaoPQsbcFEXoEcGb
	j0fYUlC5Gg1YFkfjvOXgH9Atj9oLPXBVAQCMzDPUmvrUyLJczBnvvL+YDDQ0HaI3RcqDrO5evrnaH
	0XNqCgRa58om0T9uwZQmdxxU3zbRB+0YmgBBpXYTb3V/yZflvVUvj8eydoSId89/FuACKoXDkjn8O
	CjG98E0aBQKmK9I4z/+LOTt54Yo4iWebpvyQ6kOeY+yI1z9XkPFg5QDVFc15xwItLmG3BShLc4UF6
	nUL6uCirfzX6ogM9NCsz/rY9J4TCWEOTLER1OM87qS8SZeOuDVf6NPcB0lRp00laxbodiO3sWe/vR
	K5qGpprQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNT1X-0000000G5Ve-1PYU;
	Sat, 29 Jun 2024 08:01:31 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNT1U-0000000G5Up-33tL
	for linux-mtd@lists.infradead.org;
	Sat, 29 Jun 2024 08:01:30 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-70670188420so1043733b3a.2
        for <linux-mtd@lists.infradead.org>; Sat, 29 Jun 2024 01:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719648088; x=1720252888; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVZFO1FkOZN43VwhDsUFI8m9w2uZibjKDiWK6PAbrwE=;
        b=dLcJzmt5meJPP1VqiEkDDEMn9HpVaWBChC4bBaF4sXXY+9XRX2kYA9PQ5Bep2G7viY
         PvVFRnpOGih7+A0TcEuRZ2Lsz/RArJK5tDWCzpoxUNFewSey34mG5SL8x1gS4Km6ZaHA
         KAFvHDrNmX0qzOeQXNQPKb8ui5A/9fnOPrKyz1XJHtBDUGnZ85g4SGUxrBxUHynpNmLk
         nS+eNv6bEdLMwEZMThgZKlpMiNaOricG0QV5XiamYiHFtPYyVd3aqbmCrz9AmXJijgMh
         n6EdTWVyp/HAp56mj9iBOWaSRPN20e5lp0UXAeVFvNverQtyOlnluVqJqJqEQ12ViWpx
         6CCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719648088; x=1720252888;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RVZFO1FkOZN43VwhDsUFI8m9w2uZibjKDiWK6PAbrwE=;
        b=abESC56b6FYHK65uOO8sn9jfsMPSv8qJyjXpkxzFsheKJIaCWm5UbCe0jlypNeE/IF
         grVn6pnCNfOkjnFtabckGZkB7m0u6T5dMLXgfJb3eIbmx/M7xYP9CI9N43cdWXm++JqX
         Ibdgxhu4m0SukM99UuJA9n/f1+0wqRjrE6oM7pmF7JaS6hCYsXUokPBeh8IUuU3x5V3P
         ekiLWdi9KYoe3Io/lSRBlks6hqAy64OHMB4VnGY2Yqee3Z4Jx1pPzXJ/twIf1lbaAnTR
         T87pdPrVRU0jkB8PdCRlefQKlVwVNaQ1lZ46/wpX6rDQoUh98lNn/Ys+68r80dJHwmV8
         cHKg==
X-Forwarded-Encrypted: i=1; AJvYcCXM90XUKdoL1jvTKRqb7O58l3GXQ1u45WRJNUItphqhN6B2lhsj6P3yW4gvZ0o18jnyFcYXNSLhAfblnjBUypBsXHEP8jaRShddA5NE6g==
X-Gm-Message-State: AOJu0YzlVEclZzwf1yqVwVlEF29UT2DpDQyRm11EnxD5x8YnnBiFgEJc
	ToW2JhYtaLTFjhiQFn14wXZRz8hXj7b2YQ5lUWDc6DFAu5rno6yR
X-Google-Smtp-Source: AGHT+IGbKv40OC5mDaOBFOYXNNOUwtkx3qqlTzN5ZmmL41H/SNbMVh1aYZxa8FS2RvtudOgVTuELsw==
X-Received: by 2002:a05:6a00:1ca4:b0:706:68ff:2bce with SMTP id d2e1a72fcca58-70aaad1e232mr458676b3a.2.1719648087517;
        Sat, 29 Jun 2024 01:01:27 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70802565b3asm2768066b3a.53.2024.06.29.01.01.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2024 01:01:27 -0700 (PDT)
Subject: Re: m68k 54418 fails to execute user space
To: Andreas Schwab <schwab@linux-m68k.org>
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
 <735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
 <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
 <a7084eac-b92a-4ddb-a079-f4a600b93f8e@yoseli.org>
 <c7235957-1f00-40dd-a78a-925b0b943ec7@gmail.com>
 <57879ac8-eaf5-48f1-b4ef-6619d9108440@yoseli.org>
 <d66e2daa-8b31-727f-bd66-6976b0bc0130@gmail.com>
 <ce18844d-9a93-40c7-9ac6-b49b8f823c47@yoseli.org>
 <64c30829-499d-fb48-16ee-891f8d8c443a@gmail.com>
 <04ffd421-28e8-4bde-b44b-e3685bed99fc@yoseli.org>
 <8ba7fa44-876e-5f7b-70c8-e8a5499db2a4@gmail.com>
 <87msn4z15c.fsf@linux-m68k.org>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 linux-m68k@lists.linux-m68k.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, wbx@openadk.org
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <c7203054-2839-eb94-2be7-b27c0c3c7770@gmail.com>
Date: Sat, 29 Jun 2024 20:01:19 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <87msn4z15c.fsf@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_010128_806935_819A07AB 
X-CRM114-Status: GOOD (  10.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Andreas,

Am 29.06.2024 um 18:57 schrieb Andreas Schwab:
> On Jun 29 2024, Michael Schmitz wrote:
>
>> No heap space allocated here. I would have expected that to cause an error
>> message from libc ...
>
> No, the heap starts at _end and there is still enough space before the
> next page boundary.

Right - not all that unusual then.

Thanks,

	Michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
