Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADF2C61DB9
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2026 01:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IixYOAYQ0uuInxxevTkLWwBU74qMN3EiUuSdohJ2cY0=; b=ZHi3ldqL+HgrG55S+Id7e+88E3
	J1LusII7UaWVagByJkcUAFciULer8Uuu2Q40e8iV26V3VoD06E/Mwcx5nLMYT7mdTw+bwFuPqTXh6
	QVpGvIclmbsrC+YEHlgegAqQ8w6MUxuSnSFn6wcRnT3xZAuS9+pPm88HRJW2PKDq62LTPsiH/kAj3
	CrqDNWIeg/7nCHHSKdJi1e1cGut9VZ3so+gZDOcZFNo7N7tDccqwzJDs6XQVUJ87zkpY3FbXa8HXh
	WevY3jMCjq5kFZ4eSq+FxGcBvwrg3evvKtht5jl5ruJ9YTyn1hVTXDkkY+3soXmQXlw4e7IXui3/u
	3WeD3nkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzlF2-00000004z2W-3v3R;
	Fri, 28 Aug 2026 01:18:48 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzlEu-00000004z1U-3h09
	for linux-mtd@lists.infradead.org;
	Fri, 28 Aug 2026 01:18:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DwYlbjrmltNbpjcaSym5AnW80p4+Hgl6tmjbaC6/WdA=;
	b=NixHxqkRWrP6GwVKB+I9hMNOwkh4EGt5Z/c4ANdrJ8WSwpMIoi/Aikg3vP7ReC5CEKgY0XL8d
	kcv3/E4P//jzQ2tQuUcQAHb5QKNqXNBCIt1+v5lyv4/sKMpum+mgjkDVDOhMKqPo5woXC1zSbRe
	pWMb/hPqIs2YHgTHLv6/lP4=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hWKxP1ygWzKmVp;
	Fri, 28 Aug 2026 09:07:37 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 92B5C40578;
	Fri, 28 Aug 2026 09:18:27 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 28 Aug 2026 09:18:26 +0800
Subject: Re: mtd-utils: [BUG] fsck.ubifs backwards compatibility issue wipes
 ubi volume encryption information
To: Devin Armstrong <darmstrong@tantalus.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
CC: Junghum Park <jpark@tantalus.com>, Wolfgang Tolkien
	<wtolkien@tantalus.com>
References: <YT4P288MB114509D5F1B6B114BABB5E93B8AE2@YT4P288MB1145.CANP288.PROD.OUTLOOK.COM>
 <9a92cb19-5b14-bc3a-db1b-5fcd7a736722@huawei.com>
 <YT4P288MB114596D4320D56D032E8EC32B8AD2@YT4P288MB1145.CANP288.PROD.OUTLOOK.COM>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <c7857083-5e82-4ce3-dc90-49de9305c8ec@huawei.com>
Date: Fri, 28 Aug 2026 09:18:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <YT4P288MB114596D4320D56D032E8EC32B8AD2@YT4P288MB1145.CANP288.PROD.OUTLOOK.COM>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_181844_881546_7E10A39E 
X-CRM114-Status: GOOD (  32.28  )
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
Content-Type: text/plain; charset="iso-2022-jp"; Format="flowed"; DelSp="yes"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

在 2026/8/28 1:21, Devin Armstrong 写道:
> Hi Zhihao,
> 
> Thanks for the quick response. I agree, the type field in the old versions of mkfs.ubifs is wrong and rightly flagged by fsck.ubifs. However, I would like to push back about the way this type inconsistency is handled. The type difference between v2.1.1 and v2.3.1 does not mean the node is corrupted. This is a labelling change that is treated as corruption and the action that fsck.ubifs takes is to delete the node, which in our case is the encryption info. Do you think a more appropriate fix is to repair the node in place? i.e. have fsck.ubifs repair the node by changing the type from DIR to REG
Hi Devin,
You can customize your own mtd-utils repository to fix the problematic  
image created by older versions of mkfs by changing the problematic dent  
node from a DIR type to a REG type. However, I do not recommend pushing  
this solution upstream to mtd-utils because this is a corruption issue  
that fsck needs to handle, and fsck cannot determine whether it was  
caused by mkfs or if there was a genuine problem.
> 
> To try and give more context, we have a large number of embedded devices in the field that were formatted with mkfs.ubifs v2.1.1 and if fsck.ubifs were run against these non-upgradable partitions, it would wipe the encryption information from the ubi partition. And since encryption is paramount for our devices, the device would simply fail to boot due to an unencrypted partition, leaving the device permanently bricked.
> 
> I believe fixing the type in place preserves your goal of not ignoring inconsistencies while also avoiding data loss where there isn't actually any corruption.
> 
> Please let me know your thoughts,
> 
> Best,
> Devin
> 
> ________________________________________
> From: Zhihao Cheng <chengzhihao1@huawei.com>
> Sent: August 26, 2026 7:10 PM
> To: Devin Armstrong; linux-mtd@lists.infradead.org
> Cc: Junghum Park; Wolfgang Tolkien
> Subject: Re: mtd-utils: [BUG] fsck.ubifs backwards compatibility issue wipes ubi volume encryption information
> 
> [Caution] This email originated outside of Tantalus
> 
> This is the first time you received an email from this sender (chengzhihao1@huawei.com). Exercise caution when clicking links, opening attachments or taking further action, before validating its authenticity.
> 
> 在 2026/8/27 0:44, Devin Armstrong 写道:
>> Hi,
>>
>> Description:
>> fsck.ubifs v2.3.1 will always detect fatal corruptions in a mkfs.ubifs v2.1.1 encrypted ubi volume. When fsck.ubifs is run with the -y option, it deletes the volume's encryption information and leaves the volume damaged.
>>
>> Steps to Reproduce:
>> I have attached a bash script to this email that can reproduce this issue reliably. Essentially, it:
>> 1. Builds mtd-utils v2.1.1 and v2.3.1
>> 2. uses mtdram to emulate an mtd device and attaches an ubi volume to it
>> 3. format and encrypt the ubi volume with mkfs.ubifs v2.1.1
>> 4. Run fsck.ubifs v2.3.1 against the encrypted ubi volume
>> The script also allows you to test an unencrypted ubi volume for comparison
>>
>> To run the script:
>> sudo ./https://linkprotect.cudasvc.com/url?a=https%3a%2f%2ffsck_ubifs_reproduce_bug.sh&c=E,1,HwWSNjxDb4Jyi6Svubv4_rU_XXblAM5sl-SGW5gnPWBkek9xx1RZkIdBVsnBUxLDjH_E4giHec_5fveXphcc48M7bQdBQizqd2-e4-8MMQ,,&typo=1 --encrypted /path/to/staging/dir --no-patch
>>
>> fsck.ubifs will output something like this:
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Read superblock
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Read master & init lpt
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Replay journal
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Handle orphan nodes
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Traverse TNC and construct files
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Check and handle invalid files
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): problem: File has inconsistent type, ino 65, inode type file(xattr), dentry c has type dir(xattr)
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Remove dentry? y
>>
> 
> Hi Devin,
> There was a wrong type assignment in old mkfs.ubifs. which introduced an
> inconsistent problem in ubifs image. The problem is fixed by [1]. Then,
> the fsck will detect the inconsistent problem from the ubifs image made
> by old mkfs.ubifs.
> 
> [1]
> https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fgit.infradead.org%2f%3fp%3dmtd-utils.git%3ba%3dcommit%3bh%3dd17b14d953b2ab56c938d6c7829b70b91c736efe&c=E,1,fSFm63jP5iXDZF6oguP_D6Dnsu-jSWIGtM0IU1q1M7Ks6IGRzpY4Q1MG_j0iqRWJIEIv5rOKZNFe8_f46iJ_DT7EuassTHgEodvrxN6a6pOKn8OV&typo=1
> 
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): problem: File has no dentries, ino 65 type file(xattr)
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Delete it? y
>>
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): problem: Encrypted file has no encryption information, ino 1 type dir
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Delete it? y
>>
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Check and handle unreachable files
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Check and correct files
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): Check whether the TNC is empty
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): problem: TNC is empty
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): inconsistent problem must be fixed
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): ********** Filesystem was modified **********
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): ********** WARNING: Filesystem still has errors **********
>> fsck.ubifs[21612] (/dev/ubi0_0,danger mode): FSCK failed, exit code 5
>>
>> The steps to reproduce should be agnostic to the linux kernel version, however for reference I am running this on an Ubuntu 24.04 with linux kernel version 7.0.0-30-generic
>>
>> I have done some digging and I believe this issue stems from the fsck.ubifs tool is doing a strict type check in the "file_is_valid" function of the extract_files.c source code file. A fix in v2.2.1 (git hash: d17b14d953b2ab56c938d6c7829b70b91c736efe) changed xent->type  from  "UBIFS_ITYPE_DIR"  to "UBIFS_ITYPE_REG". The fsck.ubifs tool does not account for this change.
> 
> I think fsck.ubifs should not skip this inconsistency issue for the sake
> of compatibility, in case this issue was not introduced by the old
> version of the mkfs.ubifs tool.
>>
>> I have made and tested a patch which I have also attached to this email.
>>
>> With the patch applied fsck.ubifs outputs:
>> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Read superblock
>> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Read master & init lpt
>> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Replay journal
>> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Handle orphan nodes
>> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Traverse TNC and construct files
>> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and handle invalid files
>> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and handle unreachable files
>> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and correct files
>> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check whether the TNC is empty
>> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and correct the space statistics
>> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and correct the index size
>> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Check and create root dir
>> fsck.ubifs[24723] (/dev/ubi0_0,danger mode): Final committing
>> fsck.ubifs[24723] (-): FSCK success!
>>
>> Best,
>> Devin Armstrong
>>
>>
>> Email: darmstrong@tantalus.com
>> https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fwww.tantalus.com&c=E,1,KxYAgvOSYMOTWGdye0Adt1F048oGFXnOpJah8_YTqn3b6A4MQdT4tyIv9gQ6A00P9wFm02BvBnXB6i20P5tEBLReYmPYuPi7H9rGvJoKyw,,&typo=1
>>
>> CONFIDENTIALITY NOTICE.&nbsp; This documentation, including any attachments, transmitted by electronic mail is intended for the use of the individual to whom or the entity to which it is addressed, and may contain information which is proprietary, confidential, privileged and/or protected from disclosure by applicable laws. Confidentiality and privilege are not lost by this documentation having been sent to the wrong electronic mail address. If you are not the intended recipient (or the person responsible for delivering thereto) please immediately notify the sender and destroy this documentation and all copies (in any form and media); and note that any distribution, reproduction or other use of this documentation is strictly prohibited and may violate public and intellectual property laws.&nbsp; Thank you.
>>
>> -
>> CONFIDENTIALITY NOTICE. This documentation, including any attachments, transmitted by electronic mail is intended for the use of the individual to whom or the entity to which it is addressed, and may contain information which is proprietary, confidential, privileged and/or protected from disclosure by applicable laws. Confidentiality and privilege are not lost by this documentation having been sent to the wrong electronic mail address. If you are not the intended recipient (or the person responsible for delivering thereto) please immediately notify the sender and destroy this documentation and all copies (in any form and media); and note that any distribution, reproduction or other use of this documentation is strictly prohibited and may violate public and intellectual property laws. Thank you.
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> https://linkprotect.cudasvc.com/url?a=http%3a%2f%2flists.infradead.org%2fmailman%2flistinfo%2flinux-mtd%2f&c=E,1,Xh2NmZs7gefQx34TtrCEOwqEojHkrwcC4s3P8wZQAFW-F4oaZOFhE3eja3YeKpzd6xXRcGMSP66fqVHs7GNJ8E1BAmMNr9YJru9OI80OJrm0k08qiw,,&typo=1
>>
> 
> CONFIDENTIALITY NOTICE. This documentation, including any attachments, transmitted by electronic mail is intended for the use of the individual to whom or the entity to which it is addressed, and may contain information which is proprietary, confidential, privileged and/or protected from disclosure by applicable laws. Confidentiality and privilege are not lost by this documentation having been sent to the wrong electronic mail address. If you are not the intended recipient (or the person responsible for delivering thereto) please immediately notify the sender and destroy this documentation and all copies (in any form and media); and note that any distribution, reproduction or other use of this documentation is strictly prohibited and may violate public and intellectual property laws. Thank you.
> .
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
