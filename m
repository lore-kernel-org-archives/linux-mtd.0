Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12031EE6B70
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Feb 2026 03:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UVc7060J40DOND2uW+7LT7Ix7DS+tvKU+g5YKeqgF7A=; b=mLHlX78YdTOlAt
	NuUlsukpohyPataIYEZYFq2DaENaDrb0rgOOjIp9wfJTFG3LdU4VCeb9BHZCZNUSG3e+Nz45ac8VL
	JQbgbSsRgfCL48AWPBxGdZpKEKjv6d7AJnAKGlrji+pYb0Bp6XGZu8fS0OU1sJpwqSVy3A5BRth5F
	qKmmrcgtYqDtmlZrgYLD7CN3PLCHzscDW2PwDo3X9AJ76amM6RM/ywV3K4r6ZACvTyDSOPd3feF/y
	BjjsXexdLUqSNDZE7wNUkj4Jdw5f6uCyXUoNl/F91vfmKmONY5SkytY9XO9axCLbtqYlqRlwgD8CS
	XHrTvV1E9JW/OWPipZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voZ2v-0000000C5Fk-0aXQ;
	Sat, 07 Feb 2026 03:31:45 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voZ2s-0000000C5FO-275P
	for linux-mtd@lists.infradead.org;
	Sat, 07 Feb 2026 03:31:43 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-382fd8aaa6eso23640471fa.1
        for <linux-mtd@lists.infradead.org>; Fri, 06 Feb 2026 19:31:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770435100; cv=none;
        d=google.com; s=arc-20240605;
        b=bcYTt3QvnDsleFMXp60k+3KBOwNT4aWk3L7+U6C65KEWoK6AChNvppvX2i3qAQayyd
         jR4RSZNGkQ04Ey5HSFegiSME/oQ99lsj+HY7wzV/uYjq22+1KHL1oSSA+FRiZtm43Um/
         rbwyMTR2MDlQ+pO8HnSLsZPL4HZSKOn7sLXsOKy2MifSP88gbaKtSvaXhbrl2SJ923BU
         UAdS8Tu6nNH61/FkZV66SWkOn1V8vodo/eaDasMJLsy4XsnuPRwOWsG510Q/awRnMJb7
         TpwgXgA45qnvdBuuT+kNyYk5uDFP0oW+MSUHTeS5NHJoC99VpsiLAfrPnAz3ICVYhN8d
         /+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=prespqLTo0fP6d8n2xzukW5DAXpxkGCJl7iE++gp+Zg=;
        fh=fKTchESYroQAauR0DJVzWMIKQanvB7SLTtA8jkKz5pY=;
        b=Bl2trBM+pJGYW34MVcJiu43+DzSOMBilyI8yRV8uYtvL/aHw4P/pJIIflVPJVY06ZG
         E8cqZEtgk9GS+zd9Y8Zs7CrOSwxy0q9fFTHfvklNed9d8GJyWPKvJrgicEagoHa0wxhb
         3Wa6Bg+csY5idmvccVR6AcnBPwwtZQEgBu9PxCphUGTrDtrOpM1ShUUoShil5FYqUVnI
         YhC32n951HawT+aQuQ9N1JtXmW5vgazcie8UPiZGfV4gHljpvTytzEI322M6S/wk4sJR
         58UiwJ7cV3Q4cFNQjzKLCFCwKmKPKkGFTllpkMbQNHjmCzkVEVs5flLCp6J75Ag/qdmC
         l4TA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770435100; x=1771039900; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prespqLTo0fP6d8n2xzukW5DAXpxkGCJl7iE++gp+Zg=;
        b=kg1ZOxLcAj+Z3NLriW9ZHBdsmMTpoYyU5kh0WAcNhChix96a/89prLW7NBXOaijE5d
         sPDCVaqxRUcspDEfzOMfpor+B0kz0q0gMRQItZonPFUId5CTDpucLHSRs/PhpLrwzyzL
         t/MTPT/mvqGLL7F2bxIAxiq5JLLtd7M9EGmsKyoU7dBwvjGTK5+M9RnjLoetA/npzR+I
         3cvMmUXa2QkqERnizJDkAIzqECEGGJrNWRjc+reyupI1g+0gTCYw9riRuVD/Z99dQBm6
         PvM1LEJqjUAmdrPWX1cVPi+DzxnMOWLEUUbWldRXPMFelPSij/6XDok/FlU1lYMJgUnR
         MRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770435100; x=1771039900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=prespqLTo0fP6d8n2xzukW5DAXpxkGCJl7iE++gp+Zg=;
        b=cqQxA3Pinmn30Ar2PlZD6+bVJfjCufBQWp7FkJGr6O05wQWFln483qNJIxwIH8E4KS
         NtbMU+x/QtOxqkvI9abOEdeQYhgefTVkqCSWe+ri+Zu4CTn4q+7awDMZMS8wJOT7Fou/
         LM1HBEJZtvC5ju0PkmcZVPKkC0wxh8KddnUsyEg4/yjNlMwH9RdXyUfDjZagGvUAiFPj
         QwOSCnyaer1lLOpfPtDMX604nLEScLo1Fq1fEr8ULNpgn4nVMGx3Xb0d6hTf9AjvY44W
         Q/gIfjLMU393Sndh5Q85QkGi9KseiN0Y03EVev56nnEz+y/OcY4y3He2q9OBJTtBObmz
         PhBw==
X-Forwarded-Encrypted: i=1; AJvYcCU9ibz7BN2ySI7lFlakuTqCN2aYGQKZZ94LcBR4KNyOp1VFt454RJothCi/DWaVdwl9fWYaIitlquU=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh3XP5i+UfeAithNatyvDwURH/8TwV2I7ZCZ6/h8hCQqcN17hW
	IPIqZ8D891ydirxtdy6CRPDrcdRGP2bhDG40WX7L5Acn5uSvX/ISZ7n8XkLwu0JcWFMGdMP3Z9B
	icpe5bPn1+ZtjxMOHjXts3Rkpck/FM4g=
X-Gm-Gg: AZuq6aJiJRLulx83vz/7shjyG0YrSXUCru+MmDIlgpcfaaWIixZe9dFv9xiIgMCwnv/
	T06KdfLJ6JtZRjPcE+bUXc8R0auOsUUphjny2genzqKNotIKKx1tsRk11IbksvpTuhv8ai5xn1F
	NxvRcIOOw7BIjnd3AtkvwlqHEj4Q6VWPwWFZ9gvNIg/9nJu8buaL7i8DQjCuBZafvb959mddi0n
	pY9Q4YVRCwTAtqF919RrkpBPNlOyV7pzHH3myrous1GbBtwc1Tq/0sZDPNzCSHbJR73goDgxBYi
	F6QZOBs7JgmcdNgOE+e0LBy4SjA=
X-Received: by 2002:a05:651c:509:b0:383:5ea4:20b4 with SMTP id
 38308e7fff4ca-386b4f05676mr14885281fa.13.1770435099673; Fri, 06 Feb 2026
 19:31:39 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5Bdxv2ifJ8XUq-dcE=NZ=DJdDfw+du-CQ_BTUigxcKV6A@mail.gmail.com>
In-Reply-To: <CAOMZO5Bdxv2ifJ8XUq-dcE=NZ=DJdDfw+du-CQ_BTUigxcKV6A@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 7 Feb 2026 00:31:28 -0300
X-Gm-Features: AZwV_Qg29YV6QCzIqwSibue5KPoHITNOwE9ROV6idrfTcSBGgc77hNpU6R4A2TY
Message-ID: <CAOMZO5BQs8Ny_i3gNr3C_LJHOZ6i7+SogYAjaf5xuxqBJAHXQA@mail.gmail.com>
Subject: Re: SPI-NAND crash on linux-next
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_193142_555616_57B931A9 
X-CRM114-Status: UNSURE (   6.24  )
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

T24gRnJpLCBGZWIgNiwgMjAyNiBhdCAyOjU14oCvUE0gRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1A
Z21haWwuY29tPiB3cm90ZToKCj4gV2hlbiBJIHRyeSBsaW51eC1uZXh0IDIwMjYwMjA1LCBpdCBj
cmFzaGVzOgo+Cj4gWyAgICAxLjk2Mzc2M10gODwtLS0gY3V0IGhlcmUgLS0tCj4gWyAgICAxLjk2
NzIwNF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0
CgpUaGlzIGhhcyBiZWVuIGZpeGVkIGJ5OgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
bXRkLzE3NzAzODUxMDIzOC4xMTgyMzM2LjEwODE4MzE0MTIzNTU4ODY0OTkzLmI0LXR5QGJvb3Rs
aW4uY29tL1QvI3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
