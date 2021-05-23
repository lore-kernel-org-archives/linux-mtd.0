Return-Path: <SRS0=cCt4=KS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1CAC4707A
	for <linux-mtd@archiver.kernel.org>; Sun, 23 May 2021 17:32:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0CD861155
	for <linux-mtd@archiver.kernel.org>; Sun, 23 May 2021 17:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0CD861155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z93apguy5q6txYFtTkNxBQ18UI5FHqjE+pOL4Tg6chU=; b=Cm/u6WgmMiNC1NTHgU0aU9UI5R
	X/D4O0oWIbfut/28nskMrFYQhvn+hm3e5Nc2Dwgnkx8xMLJcWr3nT+qB74TftkoQUtCLqtutyUy6j
	2wj005BosIV7HEMDei+o4HIrRwgV1K+zbFzFovJf3wuwVfgxl7M26hV0+vmDjftUf7mm+ZeTOfhmQ
	2AWytYGan4nKU077ErvAHVxv/Q8CvBMlUXiOsVMOkpzeuBNQHVblYBnIa0rvIV5kbu1mz84Z6ZlMx
	YfDwwsk0gAkPCBnnOcxjyAUR/V10KBB3dRf//L1XpSuMLLq/vz8lygchQZgIvHQGWeWC/JdXLvu7K
	w4JhpTsw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkrwf-004fnV-SM; Sun, 23 May 2021 17:31:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkrwd-004fnH-5R
 for linux-mtd@desiato.infradead.org; Sun, 23 May 2021 17:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=SVw9YDxlfb3Wp0TqyOy5TxaXqzpo0DFrHAeFXsKSb9Q=; b=hCYZLGcrqnqqAsqUTLXZMEIVpX
 Ei2GiwKyxJqz9bqnhSb2IDPOz/e8UcNTDir6CVviYN1aE5D+guOcKbODRrKlRpAngP/1oxdWGZUoW
 0gmq05R988WsvUkYzQFlmXWQMAruP/DT97SKRK9bbctlX/y7BYiFQohxkY2+yOKZWNHf2CvCV7JdG
 uapmQifvdFUSw351ZXHO8x8Vtv9u09umx/ioKrEev7FNwgVlfEcpRcKS7GIcV0P/5Ge+LPTBmrdhE
 gxvot3YLnU66lIOhOVsKANbU4cATXydAuDABGG8a7So1KjAFe1tVrsLt8zqOfBAlXvqv5JuPhWh34
 phyqSAdw==;
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkrwZ-000WJe-Jp
 for linux-mtd@lists.infradead.org; Sun, 23 May 2021 17:31:17 +0000
Received: from [192.168.16.66] (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id B500A464730;
 Sun, 23 May 2021 17:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1621791065; bh=ZCkIWffbhhMdbIhqJK+g931zNirJIa1Z9QiPSFtiFPY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Ik/KaQWHpQnhItRn4vNI0ok45iotk6FxWeO1G1pcVniF5hbv652P/PVTQbCaMBj55
 YpbIOv5Obf0TvLmDKVojmxonrCv/JaKW6kgvkrmO5roN+U1kPtNdnqAtbz8cYPYm9J
 bA8HSQ08NKDh0py7fzw78+DBH805rwo4WnA1VMxUZPOhkHkkrAUYaUOmTitsKrmCP+
 uhziJogjwspUuQjuKd8qYPfpunNkNZNUxM6BZecpWaTueXbOkbcUQF9Vdj5p6KDW1Z
 nShKvobeMRZFJon6UuC4F6ZP4m/lC+97tj17y1vEEG1dpLuLhKaXbvO1M55gtLgylY
 cHZxt9O5ayMfg==
Subject: Re: [RESEND]: Kernel 4.14: UBIFS+SQUASHFS: Device fails to boot after
 flashing rootfs volume
To: Pintu Agarwal <pintu.ping@gmail.com>,
 Phillip Lougher <phillip@squashfs.org.uk>
Cc: open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
References: <CAOuPNLjgpkBh9dnfNTdDcfk5HiL=HjjiB9o_=fjrm+0vP7Re2Q@mail.gmail.com>
 <CAOuPNLh_0Q9w96GKT-ogC0BBcEHgo=Hv3+c=JBcas2VgqDiyaw@mail.gmail.com>
 <CAOuPNLjmJ0YufFktJzjkyvdxwFTOpxVj5AW5gANAGSG=_yT=mQ@mail.gmail.com>
 <1762403920.6716767.1621029029246@webmail.123-reg.co.uk>
 <CAOuPNLhn90z9i6jt0-Vv4e9hjsxwYUT2Su-7SQrxy+N=HDe_xA@mail.gmail.com>
 <486335206.6969995.1621485014357@webmail.123-reg.co.uk>
 <CAOuPNLjBsm9YLtcb4SnqLYYaHPnscYq4captvCmsR7DthiWGsQ@mail.gmail.com>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <1339b24a-b5a5-5c73-7de0-9541455b66af@geanix.com>
Date: Sun, 23 May 2021 19:31:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAOuPNLjBsm9YLtcb4SnqLYYaHPnscYq4captvCmsR7DthiWGsQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_103115_990097_B6221F70 
X-CRM114-Status: GOOD (  36.57  )
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

On 23/05/2021 18.44, Pintu Agarwal wrote:
> On Thu, 20 May 2021 at 10:00, Phillip Lougher <phillip@squashfs.org.uk> wrote:
>>
> 
>> Then run it on your Squashfs image
>>
>> % unsquashfs <your image>
>>
>> If the image is uncorrupted, it will unpack the image into
>> "squashfs-root".  If it is corrupted it will give error
>> messages.
>>
> I have tried this and it seems with unsquashfs I am able to
> successfully extract it to "squashfs-root" folder.
> 
>> I have not used the MTD subsystem for more than 13 years, and so
>> this is best answered on linux-mtd.
> 
> Yes, I have already included the linux-mtd list here.
> Maybe MTD folks can share their opinion as well....
> That is the reason I have changed the subject as well.
> 
>> You appear to be running busybox, and this has both support for
>> "dd" and the "md5sum" checksum program.
>>
>> So do this
>>
>> % dd if=<your character device> of=img bs=1 count=<image size>
>>
>> Where <image size> is the size of the Squashfs image reported
>> by "ls -l" or "stat".  You need to get the exact byte count
>> right, otherwise the resultant checksum won't be right.
>>
>> Then run md5sum on the extracted "img" file.
>>
>> % md5sum img
>>
>> This will produce a checksum.
>>
>> You can then compare that with the result of "md5sum" on your
>> original Squashfs image before flashing (produced on the host
>> or the target).
>>
>> If the checksums differ then it is corrupted.
>>
> I have also tried that and it seems the checksum exactly matches.
> $ md5sum system.squash
> d301016207cc5782d1634259a5c597f9  ./system.squash
> 
> On the device:
> /data/pintu # dd if=/dev/ubi0_0 of=squash_rootfs.img bs=1K count=48476
> 48476+0 records in
> 48476+0 records out
> 49639424 bytes (47.3MB) copied, 26.406276 seconds, 1.8MB/s
> [12001.375255] dd (2392) used greatest stack depth: 4208 bytes left
> 
> /data/pintu # md5sum squash_rootfs.img
> d301016207cc5782d1634259a5c597f9  squash_rootfs.img
> 
> So, it seems there is no problem with either the original image
> (unsquashfs) as well as the checksum.
> 
> Then what else could be the suspect/issue ?
> If you have any further inputs please share your thoughts.
> 
> This is the kernel command line we are using:
> [    0.000000] Kernel command line: ro rootwait
> console=ttyMSM0,115200,n8 androidboot.hardware=qcom
> msm_rtb.filter=0x237 androidboot.console=ttyMSM0
> lpm_levels.sleep_disabled=1 firmware_class.path=/lib/firmware/updates
> service_locator.enable=1 net.ifnames=0 rootfstype=squashfs
> root=/dev/ubiblock0_0 ubi.mtd=30 ubi.block=0,0
> 
> These are few more points to be noted:
> a) With squashfs we are getting below error:
> [    4.603156] squashfs: SQUASHFS error: unable to read xattr id index table
> [...]
> [    4.980519] Kernel panic - not syncing: VFS: Unable to mount root
> fs on unknown-block(254,0)
> 
> b) With ubifs (without squashfs) we are getting below error:
> [    4.712458] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0,
> name "rootfs", R/O mode
> [...]
> UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node type (255 but expected 9)
> UBIFS error (ubi0:0 pid 1): ubifs_read_node: bad node at LEB
> 336:250560, LEB mapping status 1
> Not a node, first 24 bytes:
> 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff
> 
> c) While flashing "usrfs" volume (ubi0_1) there is no issue and device
> boots successfully.
> 
> d) This issue is happening only after flashing rootfs volume (ubi0_0)
> and rebooting the device.
> 
> e) We are using "uefi" and fastboot mechanism to flash the volumes.
Are you writing the squashfs into the ubi block device with uefi/fastboot?
> 
> f) Next I wanted to check the read-only UBI volume flashing mechanism
> within the Kernel itself.
> Is there a way to try a read-only "rootfs" (squashfs type) ubi volume
> flashing mechanism from the Linux command prompt ?
> Or, what are the other ways to verify UBI volume flashing in Linux ?
> 
> g) I wanted to root-cause, if there is any problem in our UBI flashing
> logic, or there's something missing on the Linux/Kernel side (squashfs
> or ubifs) or the way we configure the system.
> 
> Thanks,
> Pintu
> 

Have you had it to work? Or is this a new project?
If you had it to work, i would start bisecting...

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
