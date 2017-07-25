Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dZxpP-0007C7-0L
 for linux-mtd@lists.infradead.org; Tue, 25 Jul 2017 11:16:40 +0000
To: Richard Weinberger <richard@nod.at>
From: Ritesh Harjani <riteshh@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, bhuvanchandra.dv@toradex.com
Subject: Regarding UBI/UBIFS corruptions during random power-cuts.
Message-ID: <c44fc096-c994-5b63-2647-1774e8406c0c@codeaurora.org>
Date: Tue, 25 Jul 2017 16:46:13 +0530
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

Hi Richard,

Recently we also encountered a similar problem which is discussed in 
this thread. This was encountered on board with kernel 3.18.
This is happening with external power supply power cut testing.

https://patchwork.ozlabs.org/patch/719544/

Can you kindly help with what happened on this issue?
Were we able to identify any bug in kernel for this? Since I don't have 
any later conversations, it will be good to know if this problem is 
fixed in the latest kernel or not.
If yes, then could you please point me to the patches/discussion on 
this, if any.


Issue logs :-
https://pastebin.com/TL2b0ZbH


Regards
Ritesh

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
