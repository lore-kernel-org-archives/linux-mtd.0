Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41561F3ED5C
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 06:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lvlYlsrnsGZQv+2EgmWKe5jjlUoTezn4VmfkEXEASQ=; b=r8rBaRKbG2S7l83cYEFdy/mVjE
	zDw/p2Q3TaTzEGLgmJuMVtoC2FwPDUMH60vrbxYP7FT5AsolHKM1tay2Ho8NeefUvqEC7B4VPskrM
	IVHi+nbp7+B6D+1nAG40u6BZ/H+Ft11NlxqwDzMd8tL0BRsbZb3AQAdGzwPYr69yl1yJLVImDjMhO
	3PJ2pf1S6UwHAuxFU1ZizA1koDW3bMpRH7nLKNf1sEsK4PQckBG0cyl9IFe1DEI2Aiw8iA3vLJanD
	RmdIwTxwNLgCsxo/bXStdsLY+mZP4bNBBFI6dHeY4y4X5V/0lKKh9NjNsZVw9wreLl1Xhej9jfluz
	EC7cIxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAZB-0000000F3TS-3nSx;
	Mon, 13 Apr 2026 06:14:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAZ9-0000000F3Sy-0kLB
	for linux-mtd@lists.infradead.org;
	Mon, 13 Apr 2026 06:14:36 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488a29e6110so43610425e9.3
        for <linux-mtd@lists.infradead.org>; Sun, 12 Apr 2026 23:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1776060873; x=1776665673; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MDIYVQhmj7RiV4WFJOsfpr3mdukoZEJmFG4yymu6dPA=;
        b=NkjW02iRpQKdXqlg5Z8YzcmDNrSh5DC4m7UWHW+4xTa9mAFGdoPvyqmOkRBDzedZ6d
         btYERbTBae++n73LltaZqNSJtLr70ehOAcK/QPqMo4FnQg/3za1HuTP/2fQYet0VPGfJ
         Y8tOOWYe2aDWOLGzoxTnydLrhn1BmmTtnFAAJTZmfx6ofQuOAsQiuW44ApArhnhM3oCk
         nQGcp+GcEV92+aRaYQAJzHDNIPZY+g9n6dRy0cMwi1PbFA4YEHhEJL/x8qXLydLao3Sa
         LwYQUa/vBCyW/E7HUS3tnMRdg2lu3GR8BWTAZWKSvynSYeMWF+2Up7E+nIS/5AKznNC1
         BjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776060873; x=1776665673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDIYVQhmj7RiV4WFJOsfpr3mdukoZEJmFG4yymu6dPA=;
        b=LoRu/d2l0FNCyg5DPaNj+abrAQFy5s/EAKMi5hg+5Urjttd4qdOqc8Ijh94t+v1Xep
         ITuR4KufCpetDDPeT4osjJ4hnoRkBVmefisxvc18OzJ67nICR/l6rAAIEkRq34Fu8UOz
         aEYq0B2FrSWP4RF9VLBPkr16UxxWK2ncoC/ymnwibcNQiZGBF52r9gfuXK5P0Ooe0SG+
         dOL+YRnuVFzHXP/KWYDL6po0JY3gsdmTzwAwpjhe1gARIbnaPu5ghtMjIPB+w4WP+5wU
         rEuoMhkDjyVtAryDSc6e+fr0yZgc2IdapzywzkBce0HJt8e04qAQQu3cSTKNtLmjRn4O
         QcTw==
X-Forwarded-Encrypted: i=1; AFNElJ+rXoHgPEd7P1oAsSlzJ2x1qpl70TV/zxSSRcufzTVBhIAyE5I/IJPetfdShwyrhQ2/IPxIYrCRgNE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3lXV3mrGt7P6XKaW/T0YoirudG9WlHlP0rqGZ5/49bBHnPs1z
	Cz4uVudOOMg6s2bVxFhaP0aWhPgwdScX9mQmUmezwl0YagslJ/5oC4uGEC+qNDz6o1Q=
X-Gm-Gg: AeBDiestkZ5++hCVCIkdsAhlp6XbKfVSdTdHPhU9YKtFNMTDEd4mJVZOY+KP1jML11f
	L353W3g+LKwKbxNFn41cZ/oKbv5iVhbLrjeZIzPuOWd2LuCxIqt3o0c1bFPFNocB9WitdmXfUTD
	zT3dtVKU8GJJXBAob3evBXRz0+iK9QhwJfHy9BuuNXJzFQuFalwah6t+gXblcOlYQPn612ihe7K
	E4KL/kwibypfQVXMeEefHAUa8zyXRHdtp5SwES1xlAz9T/iAR//FiWCxGpAg/lU4l2EUESPAwmK
	aIdB75hB++lIQJUZe2si6zJMpNHDwFR2p4qdqsqQOKyoAx2dBK9HEgc1981v8jZpTov7MMeim2H
	8xrGhXot4WLsTWoOakYq8+o7yYdLdZSt1FIsz7HtSXEpDuBmpR+GISc/9q5/clCo5PeoIzUmQeW
	3jgIgJmCv6qZWXX5YumW3pjCb/auTAtRKXqykWdRuivg2LAA==
X-Received: by 2002:a05:600c:474c:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-488d68101edmr148669285e9.10.1776060872718;
        Sun, 12 Apr 2026 23:14:32 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm356937785e9.3.2026.04.12.23.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 23:14:32 -0700 (PDT)
Message-ID: <acfde3db-379b-48d2-a07f-af5b3128e723@sigma-star.at>
Date: Mon, 13 Apr 2026 08:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iniparser: prevent signed integer underflow in line
 length calculation
To: Anton Moryakov <ant.v.moryakov@gmail.com>, linux-mtd@lists.infradead.org
References: <20260127125657.50784-1-ant.v.moryakov@gmail.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20260127125657.50784-1-ant.v.moryakov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_231435_317124_1BF49B12 
X-CRM114-Status: UNSURE (   8.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

according to your description, this was found by static analysis? I'm
a little confused how it should be possible to trigger this bug:

On 1/27/26 1:56 PM, Anton Moryakov wrote:
>   
>       while (fgets(line+last, ASCIILINESZ-last, in)!=NULL) {
>           lineno++ ;
> -        len = (int)strlen(line)-1;

The return value of `strlen` is cast to an int, which AFAIK has
higher precedence than the following subtraction of 1 (also, by default,
an integer).

The variable `len` is declared as an `int` at the beginning of the
function, it is signed and *can* be negative, there is no underflow
here.

Directly after the code you inserted is this:

>           if (len<=0)
>               continue;

which should catch that exact case you are trying to fix, no?

Greetings,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
