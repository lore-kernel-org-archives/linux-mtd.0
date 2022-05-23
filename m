Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809F6C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 15:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XE+1ptYVWEGQbCPdrJ+T3BLd+A/elg8/dCuX9UYv0RY=; b=KkG1lg5qMZLr2F
	ZW+5Gf+YZxNQwdW+/BwnUMEGG2pHT2wvm3NV1dZdoBh4mN/Hvcwye0QdysCxgNoVuqjetuNVIFqEn
	sIhrTDoHCd0WkUe/LQs5aeyMyLmJDkUn2He11CRuBxxtHoARXKbo166aKu4q5GyYMxkZWyY/NSVqA
	OfV9/5xla8x/9kzHboQZKCA9x1zQdB2TTgQD9kXp0SwLpH1bDmbBYxu69UAs4HfklqFt41RIO/Ns9
	O3Sm2hD5Xp1p+eue5rpMEcfGsb0yoHGsB0Oiarzp8Es/Vm2cef4nL8Q4Moo2UPLvgZuRc8SIhJDlS
	PG+/7oMRIPn6C8MjguGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt9Xl-004pZv-8E; Mon, 23 May 2022 15:00:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt9Xh-004pYb-V1
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 15:00:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A403A611D0;
 Mon, 23 May 2022 15:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EBBC385AA;
 Mon, 23 May 2022 15:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1653318020;
 bh=IUaEfLj6953s/H4mbcGF6KlLruM+MM9WWWcWdgxpOWs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K/Za5QKWDzE6PsRsSeWsx+zVtE7/Ad05Qi3B44uTxU+3Lv0rXiXLMgNRM8Bk4gfJu
 wDLaM/dFjZ/mXFtnKYgU4IWX1DL1RF56VaT3dM4dE36JbrUGsLexrKnURTO0b+B3Op
 E0VLtnZBgUW0nN/akEG+qhZHdvuROerLG1Z35ek0=
Date: Mon, 23 May 2022 17:00:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Petr Malat <oss@malat.biz>
Cc: linux-mtd@lists.infradead.org, Joern Engel <joern@lazybastard.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: phram: Map RAM using memremap instead of ioremap
Message-ID: <YouhgL/sAHtrxbeR@kroah.com>
References: <20220523142825.3144904-1-oss@malat.biz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220523142825.3144904-1-oss@malat.biz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_080022_121038_150F1C6D 
X-CRM114-Status: GOOD (  21.76  )
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

On Mon, May 23, 2022 at 04:28:25PM +0200, Petr Malat wrote:
> One can't use memcpy on memory obtained by ioremap, because IO memory
> may have different alignment and size access restriction than the system
> memory. Use memremap as phram driver operates on RAM.
> 
> This fixes an unaligned access on ARM64, which could be triggered with
> e.g. dd if=/dev/phram/by-name/testdev bs=8190 count=1
> 
>    Unable to handle kernel paging request at virtual address ffffffc01208bfbf
>    Mem abort info:
>      ESR = 0x96000021
>      EC = 0x25: DABT (current EL), IL = 32 bits
>      SET = 0, FnV = 0
>      EA = 0, S1PTW = 0
>    Data abort info:
>      ISV = 0, ISS = 0x00000021
>      CM = 0, WnR = 0
>    swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000000cd5000
>    [ffffffc01208bfbf] pgd=00000002fffff003, p4d=00000002fffff003, pud=00000002fffff003, pmd=0000000100b43003, pte=0068000022221717
>    Internal error: Oops: 96000021 [#1] PREEMPT SMP
>    CPU: 2 PID: 14768 Comm: dd Tainted: G           O      5.10.116-f13ddced70 #1
>    Hardware name: AXM56xx Victoria (DT)
>    pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
>    pc : __memcpy+0x168/0x230
>    lr : phram_read+0x68/0xb0 [phram]
>    sp : ffffffc0138f3bd0
>    x29: ffffffc0138f3bd0 x28: 0000000034a50090
>    x27: 0000000000000000 x26: ffffff81176ce000
>    x25: 0000000000000000 x24: 0000000000000000
>    x23: ffffffc0138f3cb8 x22: ffffff8109475000
>    x21: 0000000000000000 x20: ffffff81176ce000
>    x19: 0000000000001fff x18: 0000000000000020
>    x17: 0000000000000000 x16: 0000000000000000
>    x15: ffffff8125861410 x14: 0000000000000000
>    x13: 0000000000000000 x12: 0000000000000000
>    x11: 0000000000000000 x10: 0000000000000000
>    x9 : 0000000000000000 x8 : 0000000000000000
>    x7 : 0000000000000000 x6 : 0000000000000000
>    x5 : ffffff81176cffff x4 : ffffffc01208bfff
>    x3 : ffffff81176cff80 x2 : ffffffffffffffef
>    x1 : ffffffc01208bfc0 x0 : ffffff81176ce000
>    Call trace:
>     __memcpy+0x168/0x230
>     mtd_read_oob_std+0x80/0x90
>     mtd_read_oob+0x8c/0x150
>     mtd_read+0x54/0x80
>     mtdchar_read+0xdc/0x2c0
>     vfs_read+0xb8/0x1e4
>     ksys_read+0x78/0x10c
>     __arm64_sys_read+0x28/0x34
>     do_el0_svc+0x94/0x1f0
>     el0_svc+0x20/0x30
>     el0_sync_handler+0x1a4/0x1c0
>     el0_sync+0x180/0x1c0
>    Code: a984346c a9c4342c f1010042 54fffee8 (a97c3c8e)
>    ---[ end trace 5707221d643416b6 ]---
> 
> Signed-off-by: Petr Malat <oss@malat.biz>
> ---
>  drivers/mtd/devices/phram.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> index d503821a3e60..25d3674b4e51 100644
> --- a/drivers/mtd/devices/phram.c
> +++ b/drivers/mtd/devices/phram.c
> @@ -83,7 +83,7 @@ static void unregister_devices(void)
>  
>  	list_for_each_entry_safe(this, safe, &phram_list, list) {
>  		mtd_device_unregister(&this->mtd);
> -		iounmap(this->mtd.priv);
> +		memunmap(this->mtd.priv);
>  		kfree(this->mtd.name);
>  		kfree(this);
>  	}
> @@ -99,9 +99,9 @@ static int register_device(char *name, phys_addr_t start, size_t len, uint32_t e
>  		goto out0;
>  
>  	ret = -EIO;
> -	new->mtd.priv = ioremap(start, len);
> +	new->mtd.priv = memremap(start, len, MEMREMAP_WB);
>  	if (!new->mtd.priv) {
> -		pr_err("ioremap failed\n");
> +		pr_err("memremap failed\n");
>  		goto out1;
>  	}
>  
> @@ -129,7 +129,7 @@ static int register_device(char *name, phys_addr_t start, size_t len, uint32_t e
>  	return 0;
>  
>  out2:
> -	iounmap(new->mtd.priv);
> +	memunmap(new->mtd.priv);
>  out1:
>  	kfree(new);
>  out0:
> -- 
> 2.30.2
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
