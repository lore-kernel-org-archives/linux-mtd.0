Received: from mu-out-0910.google.com ([209.85.134.187])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HiT1h-0003Kf-4R
	for linux-mtd@lists.infradead.org; Mon, 30 Apr 2007 06:22:38 -0400
Received: by mu-out-0910.google.com with SMTP id w1so1685925mue
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Apr 2007 03:22:36 -0700 (PDT)
Message-ID: <4635C35C.8000109@embeddedalley.com>
Date: Mon, 30 Apr 2007 14:22:20 +0400
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [patch/resend] nand: add containing structure for NAND platform data
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
From: Vitaly <vitalywool@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to make it more convenient to pass platform-specific NAND stuff 
to a generic driver which is hopefully to come out next, I've introduced
a container structure for chip-specific and controller-specific data.
I'd expect that use cases in platform code will be like

struct platform_nand_data nand_data = {
	...
};

struct platform_device nand_device = {
	...
	.dev = {
		.platform_data = &nand_data,
		...
	},
};

So, please find the patch below.

 include/linux/mtd/nand.h |   10 ++++++++++
 1 files changed, 10 insertions(+)

Signed-off-by: Vitaly Wool <vitalywool@gmail.com> <mailto:vitalywool@gmail.com>
