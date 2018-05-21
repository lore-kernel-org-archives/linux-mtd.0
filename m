Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fKjIR-0002hH-6G
 for linux-mtd@lists.infradead.org; Mon, 21 May 2018 11:48:13 +0000
To: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
From: Ritesh Harjani <riteshh@codeaurora.org>
Subject: Selabel/selinux support in mtd-utils for ubifs
Message-ID: <d1fc48d2-ee16-2405-bf4d-a75ea8cd5f46@codeaurora.org>
Date: Mon, 21 May 2018 17:17:53 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

Could anyone please help whether selinux support is fully present on 
ubifs or not?

Below are my observations:-
1. Selinux support was added in ubifs kernel via below patch
"UBIFS: Add security.* XATTR support for the UBIFS"

2. Extended attribute support was added in mtd-utils via below patch.
"mkfs.ubifs: Add extended attribute support"

With above I think that selinux could be enabled but only at the boot 
time using selinux tools.

But I could not see any support to add selinux labels/context 
information while creating ubifs.img in mtd-utils. I do see below link 
where something like above was tried but never made upstream. Could 
anyone please give pointers on whether this support is added/ or bring 
worked upon?

http://lists.infradead.org/pipermail/linux-mtd/2014-February/052136.html

Also Whether selinux labeling support can be added in the mkfs.ubifs or 
not? Do we see any issues with this?

I would like to work upon adding selinux support in mtd-utils.
I would appreciate if I could get some pointers on above queries and if 
anyone has any pointers/suggestions for this.


Regards
Ritesh

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, 
Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project.
