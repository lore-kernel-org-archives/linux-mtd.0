Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B504BC4708F
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 06:53:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5667B61159
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 06:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5667B61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xWoWzHSlA6EipZnewYh+IgA1CV3G88TJc883PS5gBWs=; b=NUk6cj3KVf4VfeOjqIDOt9O27J
	9t5OhBx2VyBeCarGsENptM7xWnPPZR6MdR//xfeGYSoHqGgcsqEi3Kbrg09D02huwhihnT+LmofZv
	zUKznP9DjEDVEVv10kF8aJqIS12i5umWiRcmehFxNGKNygXPC22FRDfU0E8Xg4t787maJjc3Y8sYh
	f963cAA0Darskr7di8mOxdpLLFCiulYluFJrZpoUhCDCfBXUb6uoWqjtT7M/0QKH826RvAajZvgzq
	mg/xfdUxphK2Nc7bECdZhURvcXjx+WzVkvoXHEMjKjyL0jLeY8cjKVH+xkOUc7vNePM5CkzEZ92om
	JF0HOEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnyGE-00F0Mu-T5; Tue, 01 Jun 2021 06:52:22 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnyGB-00F0Jw-TJ
 for linux-mtd@lists.infradead.org; Tue, 01 Jun 2021 06:52:21 +0000
Received: from [192.168.100.10] (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id A7038464038;
 Tue,  1 Jun 2021 06:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1622530333; bh=iIMAOcEHY6wDQ53OPlW7P0eoOlrFgGJqpSGMuFvKKUo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=YAk5/lco7wGrtaO2GbCJlrB9nzY0aUQv3nfMxhBCNoU9VT4YRZ3bcm7P1b4zQBJ7y
 EmPJ7tIOZ9FclgB6OSWsWsGBKUAdfwQSA9NmQn1fnul2vAVc3r8agOTwwLSevnZv1t
 kJaZ6Hjn3TqgrFh36Xxe/be3J6UZGm61AHi4nN0ioFUrNvsVZLgz/jEIjxehX3ua/J
 bkYUXsWHLL7L+jhfAI32oCBGW1ZhpqAF0b3Mh7ryXNZOfcdbzqi5meNqhdJ9XwyDO5
 cbLsC6Yz2rIpBdQ0Uzep+3axEEs91Mt1BVK4t+cUPvotXX2HzJtAuzSFCCrYStHuDL
 7oyK+l1xvqg0g==
Subject: Re: [RESEND]: Kernel 4.14: UBIFS+SQUASHFS: Device fails to boot after
 flashing rootfs volume
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: Phillip Lougher <phillip@squashfs.org.uk>,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
References: <CAOuPNLjgpkBh9dnfNTdDcfk5HiL=HjjiB9o_=fjrm+0vP7Re2Q@mail.gmail.com>
 <CAOuPNLh_0Q9w96GKT-ogC0BBcEHgo=Hv3+c=JBcas2VgqDiyaw@mail.gmail.com>
 <CAOuPNLjmJ0YufFktJzjkyvdxwFTOpxVj5AW5gANAGSG=_yT=mQ@mail.gmail.com>
 <1762403920.6716767.1621029029246@webmail.123-reg.co.uk>
 <CAOuPNLhn90z9i6jt0-Vv4e9hjsxwYUT2Su-7SQrxy+N=HDe_xA@mail.gmail.com>
 <486335206.6969995.1621485014357@webmail.123-reg.co.uk>
 <CAOuPNLjBsm9YLtcb4SnqLYYaHPnscYq4captvCmsR7DthiWGsQ@mail.gmail.com>
 <1339b24a-b5a5-5c73-7de0-9541455b66af@geanix.com>
 <CAOuPNLiMnHJJNFBbOrMOLmnxU86ROMBaLaeFxviPENCkuKfUVg@mail.gmail.com>
 <4304c082-6fc5-7389-f883-d0adfc95ee86@geanix.com>
 <CAOuPNLigHdbu_OTpsFr7gq+nFK2Pv+4MUSrC6A6PfKfF1H1X3Q@mail.gmail.com>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <8b488dbf-9a2b-4c26-b377-1c150826051e@geanix.com>
Date: Tue, 1 Jun 2021 08:52:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAOuPNLigHdbu_OTpsFr7gq+nFK2Pv+4MUSrC6A6PfKfF1H1X3Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_235220_130937_91C733CC 
X-CRM114-Status: GOOD (  22.34  )
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

On 31/05/2021 04.54, Pintu Agarwal wrote:
> On Tue, 25 May 2021 at 11:07, Sean Nyekjaer <sean@geanix.com> wrote:
>> We are writing our rootfs with this command:
>> ubiupdatevol /dev/ubi0_4 rootfs.squashfs
>>
>> Please understand the differences between the UBI and UBIFS. UBI(unsorted block image) and UBIFS(UBI File System).
>> I think you want to write the squashfs to the UBI(unsorted block image).
>>
>> Can you try to boot with a initramfs, and then use ubiupdatevol to write the rootfs.squshfs.
>>
> Dear Sean, thank you so much for this suggestion.
> Just a final help I need here.
> 
> For future experiment purposes, I am trying to setup my qemu-arm
> environment using ubifs/squashfs and "nandsim" module.
> I already have a working setup for qemu-arm with busybox/initramfs.
> Now I wanted to prepare ubifs/squashfs based busybox rootfs which I
> can use for booting the mainline kernel.
> Is it possible ?> Are there already some pre-built ubifs images available which I can
> use for my qemu-arm ?
> Or, please guide me how to do it ?
> 
> I think it is more convenient to do all experiments with "nandsim"
> instead of corrupting the actual NAND hardware.
> If you have any other suggestions please let me know.
> 
> 
> Thanks,
> Pintu
> 
Hi,


I have not used qemu with nandsim :(
I would prefer testing on the actual hardware.

We have used Labgrid in the past for that.

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
