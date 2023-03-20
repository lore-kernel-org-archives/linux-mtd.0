Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C650DC7618A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 03:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnai1FP8eFsHT6pd4c4Y/UfNQ7R4ioSJfVWAnr/WqM0=; b=O2r4eNaIbhneYCRpWSKrNjtuH1
	ghhA9Odzh6PK4LdIQ0ZCP2MimEY41EcI5Ai1HVBH2AZoC3sY/YFvWgVIaLCaj2+xXkyO8oHfLDrGA
	gTX4du9ZriFjG1f/Yzx+74BFc/aGuHOsnxgy94s9SHuQWLAxf8wrS53MdHyn1C4SE4+nRcHHDv13+
	RJ9pMQrDilTxEHaqaHy36s1FToHo1r5HyC4h/da3htZD6XQDM0/9sx4c5kncUts+m8k5Yq4gNROEG
	/YC28YmFwCU8Wxo/ZctaI2p/Wfu5imCd7MqMHU1F1FdMcRBkCKekIGpQmzHUB5QCG9O/cFJO2QNKj
	hqBOiXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe62a-007yyO-0c;
	Mon, 20 Mar 2023 03:18:32 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe62X-007yxT-0I
	for linux-mtd@lists.infradead.org;
	Mon, 20 Mar 2023 03:18:30 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Pg0Gv3lnVz17M2V;
	Mon, 20 Mar 2023 11:15:19 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 11:18:22 +0800
Subject: Re: ubi0 error: ubi_open_volume: cannot open device 0, volume 6,
 error -16
To: Pintu Agarwal <pintu.ping@gmail.com>, open list
	<linux-kernel@vger.kernel.org>, linux-fsdevel
	<linux-fsdevel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
References: <CAOuPNLgTWNMSaZmE4UzOq8UhsLWnBzyt0xwsO=dS9NpQxh-h_g@mail.gmail.com>
 <CAOuPNLiu+40HREtXFL_yMaXiaRtnZSbW9VvZRZmEpNXvZWzaQw@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5d0e0518-267c-7445-5d6a-b28b6000b033@huawei.com>
Date: Mon, 20 Mar 2023 11:18:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAOuPNLiu+40HREtXFL_yMaXiaRtnZSbW9VvZRZmEpNXvZWzaQw@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_201829_294714_F823C4E6 
X-CRM114-Status: GOOD (  13.26  )
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
> Hi,
> 
> Sorry, for missing the subject last time.
> 
> On Wed, 15 Feb 2023 at 23:06, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>>
>> Hi,
>>
>> We are seeing below "ubi errors" during booting.
>> Although this does not cause any functionality break, I am wondering
>> if there is any way to fix it ?
>> We are using Kernel 4.14 with UBI and squashfs (ubiblock) as volumes,
>> and with systemd.
>>
>> Anybody have experienced the similar logs with ubi/squashfs and
>> figured out a way to avoid it ?
>> It seems like these open volumes are called twice, thus error -16
>> indicates (device or resource busy).
>> Or, are these logs expected because of squashfs or ubiblock ?
>> Or, do we need to add anything related to udev-rules ?
>>
>> {
>> ....
>> [  129.394789] ubi0 error: ubi_open_volume: cannot open device 0,
>> volume 6, error -16
>> [  129.486498] ubi0 error: ubi_open_volume: cannot open device 0,
>> volume 7, error -16
>> [  129.546582] ubi0 error: ubi_open_volume: cannot open device 0,
>> volume 8, error -16
>> [  129.645014] ubi0 error: ubi_open_volume: cannot open device 0,
>> volume 9, error -16
>> [  129.676456] ubi0 error: ubi_open_volume: cannot open device 0,
>> volume 6, error -16
>> [  129.706655] ubi0 error: ubi_open_volume: cannot open device 0,
>> volume 10, error -16
>> [  129.732740] ubi0 error: ubi_open_volume: cannot open device 0,
>> volume 7, error -16
>> [  129.811111] ubi0 error: ubi_open_volume: cannot open device 0,
>> volume 8, error -16
>> [  129.852308] ubi0 error: ubi_open_volume: cannot open device 0,
>> volume 9, error -16
>> [  129.923429] ubi0 error: ubi_open_volume: cannot open device 0,
>> volume 10, error -16
>>
>> }
>>
> 
> I see that the errors are reported by systemd-udevd and other processes.
> Is there a way to fix it by some means ?
> These logs actually consume lots of boot up time...

I guess that systemd-udevd and mtd_probe are racing to open the same 
volume with mode UBI_EXCLUSIVE or UBI_READWRITE, and these error 
messages are in expected. How about temporarily shutting down 
systemd-udevd during booting?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
