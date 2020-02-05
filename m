Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2260C35254
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 11:29:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8E1F2072B
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 11:29:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZBLA0kGq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uKyyHUuy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8E1F2072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nLUHqVhUv7rRjR2ixzTZu/O4t8mHLRegol5jSI0NVCk=; b=ZBLA0kGquf7xQAWTVHNeObQHY/
	z9PV1aHXESHlfJ+G4v6Eght05mH2ODFZ2QMCnlXZIrccAo+/rjkoeqp0HgIPCmfHGhONrL4G04iz9
	2NvJjJc+lNwonNgoyIdp+iyMMF0UBe8eyDDagT8xQc3wQQvQlSTZTQDOjCm0ZYamQt5BWX8mz6iiD
	81j7Mgm5mwfj9wfUZzv4X9sw0d09cUzuddBguWUmnhosG36jsMK/OnqofYGs/TLyROhOzQuuFmQvu
	VU1cp6nr7aZkA1qfQyiy8VTf7uwAI1Yo1gf42mx8RokCjqVerslaek5TVfJ/FONgmxZQhDR4PMbI2
	YP0d/1yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izIrX-0004cf-Td; Wed, 05 Feb 2020 11:28:55 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izIrU-0004cG-Ld
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 11:28:54 +0000
Received: by mail-io1-xd29.google.com with SMTP id x1so1714621iop.7
 for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2020 03:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=bibgYXpzQBugzfE3QWwVwKA0y67K31qOGa2IXdE3n1U=;
 b=uKyyHUuy0Utpyo43S4kT02ysgSZ0CbwMCw234n8WnRvuVLEs3AiptGX6m//RJC/a7V
 atFODiMjLLG5BEeOigAOTwH00/tSk1OP/6iznKdwQFmttHQsPan+HhRNv/aYjRPE2jbZ
 eXQ31IMGuFIry9mMN3w3XDuiJe6bxYpbf22sqnw5YV+fVdpVYNaaNsyl3QL4O4YAWLo5
 2dSLi49xYkF4gTTZkKOktryH5qUn0r/M+JfVkZ8p5PXdW6kaIOP8F0HspQdEks7IhUbu
 586eQToHhx/0WcKVVBc8B4eRht0NpdFkfxLwzQcyYHBZQnzQsNquBIcAxs66gZOTa2bZ
 2PIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=bibgYXpzQBugzfE3QWwVwKA0y67K31qOGa2IXdE3n1U=;
 b=lugzjpAbEL2HZyv29eKiUukKMQKtWGv80bUiGY3e2hWz6reKqJLFj7OWowe8fojL9H
 q6xGq4TfQyGdozDo/O/HY2clTDYgHO9C9M80IvwTL7E9lx3J/WqhLGM89kRzN812HnXB
 K5JZmeCkyN5oPdEo8mzcCz+WobwtF/pSpH591YlBA80P8edP/8Wr2zT2IVMotb1+ZBFq
 aUSeDnBQ7QwsWmMfPT5DEsiarKU+A11Jo3B0M3wts2guFIHnCEi2nJoqqHs0tmzFPxHJ
 LArMFFUX6D/MLYqg9UB5mcUMGHY7n1dcD0T4NwV0aHRI3vL+aL/XUMcC2kBh2hOAlSZ+
 ceVw==
X-Gm-Message-State: APjAAAV+gNKSdtZaWZQEnkO8daelu0ghIyVPwjGNOiZhoj1Uk4bnC0ct
 KNzQ6p7ih7xvQPVoB2nKBi1ztPYI4vYrw6u/3QJJJ77FxIc=
X-Google-Smtp-Source: APXvYqxM4ZJXjzLixi6UB6j933bffRE2STEbrWHX+3F+NzR0mO5GrHc+25HnwsNlicB8xF0o6zZXZ1jDClbR2exS38Q=
X-Received: by 2002:a6b:6e18:: with SMTP id d24mr28286683ioh.301.1580902131240; 
 Wed, 05 Feb 2020 03:28:51 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
 Wed, 5 Feb 2020 03:28:50 -0800 (PST)
In-Reply-To: <CAA=hcWTvGf9_izDMJhER-S=vEYcc22K4Syp5CuVjUr9tND7cgQ@mail.gmail.com>
References: <CAA=hcWTvGf9_izDMJhER-S=vEYcc22K4Syp5CuVjUr9tND7cgQ@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Wed, 5 Feb 2020 22:28:50 +1100
Message-ID: <CAA=hcWSX9tBOjX8DEsg+=9NPdKzdwQBa1PyxA-r9vCLVsz52tg@mail.gmail.com>
Subject: Re: mtd_nandbiterrs errors
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_032852_732483_E6C0EF71 
X-CRM114-Status: UNSURE (   7.45  )
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

Resolved, using kernel test probably a bad idea, change to use
mtd-utils nandbiterrs resolved issue.

Thank you.

Kind regards,

- jh

On 2/4/20, JH <jupiter.hce@gmail.com> wrote:
> Hi,
>
> I am running kernel version 4.19.75 on iMX6, here I got problem to run
> mtd_nandbiterrs:
>
> # modprobe mtd_nandbiterrs
> [  695.090585]
> [  695.092143] ==================================================
> [  695.098317] mtd_nandbiterrs: MTD device: 0
> [  695.114256] mtd_nandbiterrs: MTD device size 1048576, eraseblock=131072,
> pag4
> [  695.122867] mtd_nandbiterrs: Device uses 1 subpages of 2048 bytes
> [  695.129138] mtd_nandbiterrs: Using page=0, offset=0, eraseblock=0
> [  695.144888] mtd_nandbiterrs: incremental biterrors test
> [  695.150594] mtd_nandbiterrs: write_page
> [  695.158629] mtd_nandbiterrs: rewrite page
> [  695.163488] mtd_nandbiterrs: read_page
> [  695.170790] mtd_nandbiterrs: verify_page
> [  695.174887] mtd_nandbiterrs: Successfully corrected 0 bit errors per
> subpage
> [  695.182279] mtd_nandbiterrs: Inserted biterror @ 0/5
> [  695.187387] mtd_nandbiterrs: rewrite page
> [  695.196243] mtd_nandbiterrs: read_page
> [  695.202608] mtd_nandbiterrs: Read reported 1 corrected bit errors
> [  695.209115] mtd_nandbiterrs: verify_page
> [  695.213192] mtd_nandbiterrs: Successfully corrected 1 bit errors per
> subpage
> [  695.220361] mtd_nandbiterrs: Inserted biterror @ 0/2
> [  695.225361] mtd_nandbiterrs: rewrite page
> [  695.235261] mtd_nandbiterrs: read_page
> [  695.240237] mtd_nandbiterrs: Read reported 2 corrected bit errors
> [  695.246384] mtd_nandbiterrs: verify_page
> [  695.250771] mtd_nandbiterrs: Successfully corrected 2 bit errors per
> subpage
> [  695.257984] mtd_nandbiterrs: Inserted biterror @ 0/0
> [  695.262984] mtd_nandbiterrs: rewrite page
> [  695.273646] mtd_nandbiterrs: read_page
> [  695.280000] mtd_nandbiterrs: Read reported 2 corrected bit errors
> [  695.286230] mtd_nandbiterrs: verify_page
> [  695.290489] mtd_nandbiterrs: Error: page offset 0, expected 25, got 00
> [  695.297155] mtd_nandbiterrs: Error: page offset 282, expected 29, got 28
> [  695.303897] mtd_nandbiterrs: Error: page offset 359, expected a7, got 27
> [  695.310834] mtd_nandbiterrs: ECC failure, read data is incorrect despite
> reas
> modprobe: ERROR: could not insert 'mtd_nandbiterrs': Input/output error
>
> What I got wrong here?
>
> Thank you.
>
> Kind regards,
>
> - jh
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
