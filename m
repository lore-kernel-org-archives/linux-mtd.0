Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92F3C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 05:49:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D8F64F93
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 05:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64D8F64F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yt/nQBDIa1wZeS4bwxCW2QzlPeZ7C0EQZIT3a8S2sJE=; b=Q4Az9+XyGbDPCpMB7GkaZOnF/
	xi7JN7f0y32h8YYF/G0lYNlFXASItzRHxBJsOeilIFRlFl6USkF8daf1+hSMmvxBL1wRUEfJrdsBk
	ewDU3nJBu1+7+eTusm7Yx5TkfKJ1Sz0Zi71lZUxnmKSd0RElVdQtPzf1A0wxh+/Lvm6BQg5ZbqhBD
	HKY8AXPDcDS22yyir5OkbdJcSeyNM0ZHO+BTfZixRT8kJlBEMR1s10vtyJuYynXtb3orsqNWuTXLi
	eX4jLw5Mf57ner8I4oOAF9iUKO/zcDlcuY+wT2ThQcbVzF1u61Gq7rZKBSepShNuLKpF4QxOA/D69
	aeyauhWOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ8kg-00FLFp-6S; Mon, 08 Mar 2021 05:48:22 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ8kW-00FLCB-Kq
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 05:48:18 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1285m00m091039;
 Sun, 7 Mar 2021 23:48:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615182480;
 bh=9nJC7DaE2GsjplhQCY0KZ4hg4E/ocMraHd9RNRdwSIM=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=QhMVKdgFgzo+1neh4mypPqWa7NvIM0ZyQNBtKIzfXtrNO49rhRtlbMVw/XBcrsk/E
 Xn6TEgvUeRybUgprt0unUn+s+eY8OsMR5YamrWnTYfHeCGeeuO3hlSifwAs+QieUHF
 6xZXyeKl5T7hY1nBLwfdiYZKr9xcayT4uoa7nTLU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1285m0OO105233
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 7 Mar 2021 23:48:00 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 7 Mar
 2021 23:47:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 7 Mar 2021 23:47:59 -0600
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1285lwnr009624;
 Sun, 7 Mar 2021 23:47:58 -0600
Subject: Re: [PATCH] mtd: chips: AMD chip 0x2201 - write words not buffers
To: Mauri Sandberg <sandberg@mailfence.com>, <linux-mtd@lists.infradead.org>
References: <20210223170052.963927-1-sandberg@mailfence.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <13b22fce-e98c-2835-f164-ead1b7b6f1d7@ti.com>
Date: Mon, 8 Mar 2021 11:17:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223170052.963927-1-sandberg@mailfence.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_054814_008350_EBEABDAB 
X-CRM114-Status: GOOD (  28.25  )
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

Hi,

On 2/23/21 10:30 PM, Mauri Sandberg wrote:
> CFI flash memory driver cmdset_0002 uses buffers for write operations.
> That does not work with AMD chip with id 0x2201 and we must resort to
> writing word sized chunks only.
> 

Which flash is this? Do you have datasheet for the same.

Please add above information to the commit message for future reference.

> This patch creates fixup mechanism that renders a chip to use word sized
> write operation and adds that as the last item in a fixup table, shadowing
> the entry that causes use of buffer writes.
> 
> Without the patch kernel logs will be flooded with entries like below:
> 
> MTD do_erase_oneblock(): ERASE 0x01fa0000
> MTD do_write_buffer(): WRITE 0x01fa0000(0x00001985)
> MTD do_erase_oneblock(): ERASE 0x01f80000
> MTD do_write_buffer(): WRITE 0x01f80000(0x00001985)
> MTD do_write_buffer_wait(): software timeout, address:0x01f8000a.
> jffs2: Write clean marker to block at 0x01a60000 failed: -5
> MTD do_erase_oneblock(): ERASE 0x01f60000
> MTD do_write_buffer(): WRITE 0x01f60000(0x00001985)
> MTD do_write_buffer_wait(): software timeout, address:0x01f6000a.
> jffs2: Write clean marker to block at 0x01a40000 failed: -5
> 
> Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
> ---

1. Please explicitly CC maintainers for quicker response. Given the
amount of traffic on Mailing list, it'll take quite a while for me to
get to a patch that is not address directly to me.

Run ./scripts/get_maintainer.pl  on the patch to get list of maintainers
to be CC'd

2. $subject should start with appropriate prefix:

	"mtd: cfi_cmdset_0002: ...."

Just run git log --oneline on the file being patched to know the convention.

If you don't CC the maintainers and use the appropriate prefixes, it
will be a while until I get to such patches.


>  drivers/mtd/chips/cfi_cmdset_0002.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index a1f3e1031c3d..b8b564342062 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -279,6 +279,12 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
>  }
>  #endif /* !FORCE_WORD_WRITE */
>  
> +static void fixup_use_write_words(struct mtd_info *mtd)
> +{
> +	pr_debug("Using word write method\n");
> +	mtd->_write = cfi_amdstd_write_words;

Default is cfi_amdstd_write_words(). fixup_use_write_buffers() forces
this to cfi_amdstd_write_buffers() if 	cfi->cfiq->BufWriteTimeoutTyp is
non zero.

What does this field read in case of your flash? Should be 0 in case
buffered write is not supported.

> +}
> +
>  /* Atmel chips don't use the same PRI format as AMD chips */
>  static void fixup_convert_atmel_pri(struct mtd_info *mtd)
>  {
> @@ -470,8 +476,10 @@ static struct cfi_fixup cfi_fixup_table[] = {
>  #if !FORCE_WORD_WRITE
>  	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers },
>  #endif
> +	{ CFI_MFR_AMD, 0x2201, fixup_use_write_words },


Should be worked around in fixup_use_write_buffers() instead. No point
in overriding mtd->_write to cfi_amdstd_write_buffers() and then
reverting it again.

>  	{ 0, 0, NULL }
>  };
> +

Please don't do white space fixes in the same patch adding
code/feature/bug-fix

>  static struct cfi_fixup jedec_fixup_table[] = {
>  	{ CFI_MFR_SST, SST49LF004B, fixup_use_fwh_lock },
>  	{ CFI_MFR_SST, SST49LF040B, fixup_use_fwh_lock },
> 

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
