Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A557D68BDA
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 22:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svARs98C212J40vU1rPNJVe13frhidtOZWurNQ5udmw=; b=WxcmZgQaveaV2m
	/0on0g+clnfTEahLRnI5P1yy36YlTrCjTESdI+IizRNuSPbPAWi1FOwK+HRnToVbqcCQY9RmXDoBV
	DE20z2820ieSQvCcU/9739NxHy2Tva4TkIpVvoCrNk3hEoDIkL0Dh/pW6wIDKW/UIqbC8F17p+yAG
	2ippmJC3own8HN4neALMV4G4whEvfT7BsPOkEJJ+kN6jG+I2DrNxppCHZXh2yXugSMq/qM6j3aXTp
	wcHNGxkwfjqUECOy5po/s5GPXBXs6VJTDMGIZ0vq3CW83o9cBiKuQdgVvit0JcsbxQ/TQnZkD8b6P
	uus9cgmTkjj3Ov1S3mhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4PU-00000004KQD-0o6w;
	Fri, 15 Nov 2024 22:03:24 +0000
Received: from bout3.ijzerbout.nl ([2a01:7c8:fff8:2b8:5054:ff:fe86:f72d])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4PQ-00000004KOM-3UjG
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 22:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1731708199; bh=M3Ci0LpESooemyUEOXjuEkeTPc2TNS896Kl6Iwilx+g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qm2JhEVGTFaPRjdJcvWrlHmsaHRMc1JW+xyjo+ZUtmI+LTFzmrJO2c4fbNqkJRPkS
	 9flINcZzBggF1fXhj0BWqo54o9N5x406bWq1VMpM4ajnHQEkc0R38E0iLfDulHScAW
	 arp1Kb26L0NgdgMcCDrSuuhMT10/mo/IpaKdUd4+oHjSBi3bvILcaNOddeeC4RuRYl
	 JBJZVjn7rwY43OYU5BbBP5TxwRYko71Hp83KFQs+bxc7NYb0k20COWI+tMaxnHbnH2
	 vWGNf9UPi5bvi9l+ouP5iFELXbAPcXUm74lleHnjKCbwUBpJ4s4tbP1nKN2hU7PTH1
	 TyYyFzS5uw42CYWs1DPzNcXoYCoSXULEcRJfbrEPbxaFwmVRDAFL9nY9y/tDofFy/a
	 XKwiFYMoOmYqRJucxWHWRhxAvsJ2Eeirv64h3Yejqfw8Xm9++gz0OfFaE54G2ZbSpV
	 Uo5EEYPh6MDbTizVDabZkB6xBrWil8gl2oWENqVLTYQZVM/2zqFj4PmF3uc3LwLuB6
	 /0VFC/Cwg4fWuRN49BYKTWyi3k0hpY4TMK8CUgz6vBt277gHY1vMUDqMNQS40726O8
	 fMVkHo4exa3A7DhhccaZTtDEPIcv+kPN6va4SwY4bzUt+iCLZTloVmts7euY0yuTiE
	 Gmz4E3/yKNuezuVi3HkloyzM=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 7061318E00D;
	Fri, 15 Nov 2024 23:03:18 +0100 (CET)
Message-ID: <fdf9c621-cab1-4d0f-a6f7-93684fb20852@ijzerbout.nl>
Date: Fri, 15 Nov 2024 23:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ubifs: ubifs_jnl_write_inode: Only check once for the
 limitation of xattr count
To: Zhihao Cheng <chengzhihao1@huawei.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
References: <20240710022628.1227996-1-chengzhihao1@huawei.com>
 <20240710022628.1227996-2-chengzhihao1@huawei.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20240710022628.1227996-2-chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_140321_011001_DE736390 
X-CRM114-Status: GOOD (  15.44  )
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

Op 10-07-2024 om 04:26 schreef Zhihao Cheng:
> No need to check the limitation of xattr count every time in function
> ubifs_jnl_write_inode(), because the 'ui->xattr_cnt' won't be modified
> by others in the inode evicting process.
>
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> ---
>   fs/ubifs/journal.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index 4a35f9e8f668..a5c7c499cc29 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -981,6 +981,14 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
>   
>   	dbg_jnl("ino %lu, nlink %u", inode->i_ino, inode->i_nlink);
>   
> +	if (kill_xattrs) {
> +		if (ui->xattr_cnt > ubifs_xattr_max_cnt(c)) {
> +			ubifs_err(c, "Cannot delete inode, it has too much xattrs!");
> +			ubifs_ro_mode(c, err);
The function ubifs_ro_mode is called with an uninitialized `err`.
Can you please look at this again?
> +			return -EPERM;
> +		}
> +	}
> +
>   	/*
>   	 * If the inode is being deleted, do not write the attached data. No
>   	 * need to synchronize the write-buffer either.
> [...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
