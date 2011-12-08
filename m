From: Junxiao Bi <junxiao.bi@windriver.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: [V2][PATCH 0/6]ARM: fix BE8 mode support
Date: Thu, 8 Dec 2011 18:07:46 +0800
Message-ID: <1323338872-24716-1-git-send-email-junxiao.bi@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: nicolas.pitre@linaro.org, dwmw2@infradead.org, dave.martin@linaro.org,
 linux@arm.linux.org.uk, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is V2 for this series. See V1 at
http://comments.gmane.org/gmane.linux.ports.arm.kernel/140189

Changes since V1:
1. Drop the patch "ARM: gic: fix big endian support" since gic
implementation has been changed and it works well in BE mode.

2. remove "read/write_instr*" from the patch 
"ARM: support kernel modules in BE8 mode", and use new helper 
__opcode_to_mem_* and __mem_to_opcode_* to implement it. These 
new helpers come from Dave Martin's patch 
"ARM: Add generic instruction opcode manipulation helpers"

3. split the big endian fix for MTD from the original patch
"ARM: add big endian support for peripheral access" 
