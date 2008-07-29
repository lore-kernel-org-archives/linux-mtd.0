Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KNmUL-0007I0-0d
	for linux-mtd@lists.infradead.org; Tue, 29 Jul 2008 10:31:29 +0000
Message-ID: <417327189.03021@cqu.edu.cn>
Subject: Deep thinking about the Wear-leveling mothed
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: Artem Bityutskiy <dedekind@infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Jul 2008 18:31:19 +0800
Message-Id: <1217327479.2812.24.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

most of current wear-leveling motheds are based on three ideas:
1. old-young eraseblocks swapping: If the difference between the erasure
cycles of a old block and a young block is larger then the STATIC
threshold, data stored in the old block and in the young block are
swqpped. this is the KEY idea.
2. young eraseblock priority selection and oldest eraseblock protection.
3. Hot-cold date separation.

I'd tried to improve the wear-leveling performanct by means of the
second and the third ideas improvment.
But unfortunately, the experimental resultes is not every exciting.
Why???? Maybe the current implementation is good enough or the last two
ideas are not the KEY.

Is it impossible to improve the current wear-leveling policy? NO!!!

Some important things, I think, should be clarify:
1. How to evaluate a wear-leveling method? there are, I consider, two
performance index:
   @ the percentage of erasure counter triggered by wear-leveling in the
total erasure counter, refer to as wl_ec/total_ec here. 
   @ the difference between the oldest PEB and the youngest PEB (ECmax -
ECmin)
we can say that a wear-leveling algorithm is good if wl_ec/total_ec and
(ECmax - ECmin) are both small.
But unfortunately, it's defficult to minimize both wl_ec/total_ec and
(ECmax - ECmin) AT THE SAME TIME, because the wl_ec/total_ec is in
inverse proportion to the THRESHOLD, whereas the later is in direct
proportion to the THRESHOLD. 

2. Do we really need wear-leveling when the oldest PEB is far from the
upper limit of reliable erasure? 
   the answer is NO! 
   we just need to ensure that no one ersaeblock reaches the limit long
before the rest of the chip. IOW, there is nearly no need to ensure the
(ECmax - ECmin) small enough when the ECmax is far from the limit. 
   So, we should pay more attention to reduce the wl_ec/total_ec before
the oldest PEB closes to the limit. It follows that the THRESHOLD should
be set large enough in the beginning. And then, when some PEB is close
to the limit, the THRESHOLD should small enough in order to evenly worn.

   sum up, a DYNAMIC threshold is need.


-- 
yours Sincerely,

xiaochuan-xu (许小川)
