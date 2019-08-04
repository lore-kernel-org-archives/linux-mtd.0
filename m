Return-Path: <SRS0=EOAK=WA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E58C433FF
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Aug 2019 09:42:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2BB32070D
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Aug 2019 09:42:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BvbL/sad";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLRH8T6Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2BB32070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rSipMlEP+s41vbXNpfqkW0GMWk1tmg9OC8YP+TPuRbA=; b=BvbL/sad0v4ytm78QtuxxatuEF
	Isa704d+pRlQE+yoDRdJi+Dgf3/UoCa7Jj5XWsbkqJzYysYAcGe/tNeV4lWuiMSsvRvqjfDzVinpa
	DKou7GiZSk3cN+oRQqSEvvazFKO7tuqYh1Rl/Wnnuaf+uxvWsjdEGCWqCftsYMevm9mz2RHdtUa0w
	I7+yF1ykkC1SoqDSJMVRmjk2Dts9PNcxni7c6fgV85YFdEttRvr5PkAEzC6JvXk+eDVf/qjunOmNz
	sERDFjGQy+SBfitR2qeEzdMZctZSVfcS1F01Kt2HR9AIG7pbTPpS2bMSJje5PQ7le9KuLc/N4s9YN
	HqOdhZfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huD23-00072G-7F; Sun, 04 Aug 2019 09:42:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huD1w-00070a-3l
 for linux-mtd@lists.infradead.org; Sun, 04 Aug 2019 09:42:22 +0000
Received: from [192.168.0.101] (unknown [180.111.32.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A5C02070D;
 Sun,  4 Aug 2019 09:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564911736;
 bh=eHZ3LbVmL56YmqVlqrvOvSSJqzheWzSMhiY9l05NP2o=;
 h=From:Subject:To:References:Date:In-Reply-To:From;
 b=cLRH8T6ZTkrZK5qS1nnzFT8DjeL2x+uywKyjzjXJH2irPLsvRPe4dqQc6Tk1XuxHC
 6Y7KEfgh9+Y+tAVpgnfmZoe7NCQJeOKo/g4Y1DJ1F/afQry2WGDSwmae1pj6bLGNCO
 QJsggE08iTcD2KYJ7TcVNyDvJjt5HHfWLe/X0wDI=
From: Chao Yu <chao@kernel.org>
Subject: [f2fs-dev] [PATCH v7 14/16] f2fs: wire up new fscrypt ioctls
To: Chao Yu <yuchao0@huawei.com>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 linux-api@vger.kernel.org, linux-crypto@vger.kernel.org,
 keyrings@vger.kernel.org, Paul Crowley <paulcrowley@google.com>,
 Satya Tangirala <satyat@google.com>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-15-ebiggers@kernel.org>
 <e3cf53a7-faf2-0321-22de-07d2e2783752@huawei.com>
 <20190802173148.GA51937@gmail.com>
Message-ID: <88479efb-6625-8778-f802-e159ec60a374@kernel.org>
Date: Sun, 4 Aug 2019 17:42:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190802173148.GA51937@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190804_024220_353022_9169ADCE 
X-CRM114-Status: GOOD (  12.33  )
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

On 2019-8-3 1:31, Eric Biggers wrote:
> On Fri, Aug 02, 2019 at 04:10:15PM +0800, Chao Yu wrote:
>> Hi Eric,
>>
>> On 2019/7/27 6:41, Eric Biggers wrote:
>>> From: Eric Biggers <ebiggers@google.com>
>>>
>>> Wire up the new ioctls for adding and removing fscrypt keys to/from the
>>> filesystem, and the new ioctl for retrieving v2 encryption policies.
>>>
>>> FS_IOC_REMOVE_ENCRYPTION_KEY also required making f2fs_drop_inode() call
>>> fscrypt_drop_inode().
>>>
>>> For more details see Documentation/filesystems/fscrypt.rst and the
>>> fscrypt patches that added the implementation of these ioctls.
>>>
>>> Signed-off-by: Eric Biggers <ebiggers@google.com>
>>
>> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>>
>> BTW, do you think it needs to make xxfs_has_support_encrypt() function be a
>> common interface defined in struct fscrypt_operations, as I see all
>> fscrypt_ioctl_*() needs to check with it, tho such cleanup is minor...
>>
> 
> Maybe.  It would work nicely for ext4 and f2fs, but ubifs does things
> differently since it automatically enables the encryption feature if needed.
> So we'd have to make the callback optional.

Correct, ubifs can leave the callback as NULL function pointer.

> 
> In any case, I think this should be separate from this patchset.

Yup, it can be done in a separated patch if need.

Thanks,

> 
> - Eric
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
