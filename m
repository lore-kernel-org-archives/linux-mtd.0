Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YmKWu-0006rj-DF
 for linux-mtd@lists.infradead.org; Sun, 26 Apr 2015 11:15:20 +0000
From: "Dolev Raviv" <draviv@codeaurora.org>
To: <linux-mtd@lists.infradead.org>,
	<linux-ext4@vger.kernel.org>
Subject: planning general storage capacity for y fs
Date: Sun, 26 Apr 2015 14:14:53 +0300
Message-ID: <006901d08012$3a1f97a0$ae5ec6e0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: Tanya Brokhman <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I'm looking for guidelines for planning storage capacity. I understand it
strongly depended on the usage type.
I want to know at what point storage fullness is effecting performance in a
standard read/write partition. Do different File Systems (UBIFS/EXT4) have
different full-free ratio?
What about read only fs? Can I plan less free space in such cases?

I'll appreciate any input on this, for UBIFS specific and fs in general.

Thanks,
Dolev
-- 
Qualcomm Israel, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux
Foundation Collaborative Project
