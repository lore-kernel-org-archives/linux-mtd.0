Received: from ee.snu.ac.kr ([147.46.112.25])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15yqEw-0002vA-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2001 07:56:47 +0000
Received: from fdma.snu.ac.kr (fdma.snu.ac.kr [147.46.61.99])
	by ee.snu.ac.kr (8.11.4/8.11.4) with ESMTP id f9V860o25195
	for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2001 17:06:00 +0900 (KST)
Received: from localhost (shkim@localhost)
	by fdma.snu.ac.kr (8.10.1/8.10.1) with ESMTP id f9V7nZN05889
	for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2001 16:49:35 +0900 (KST)
Date: Wed, 31 Oct 2001 16:49:35 +0900 (KST)
From: Kim Sang Hun <shkim@dsp.snu.ac.kr>
To: linux-mtd@lists.infradead.org
Subject: Problem in patching to 2.2.13
Message-ID: <Pine.SOL.4.10.10110311640420.5871-100000@fdma.snu.ac.kr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I patched my kernel2.2.13 different way...

Before...
2.2.13 does not have "/linux/include/linux/compatmac.h", so I copied this
file form 2.4.x

After....
New way... 
I found that, /linux/inlcude/linux/mtd/compatmac.h was wrong in some
where.
kernel 2.2.13 does not have compatmac.h at /linux/include/linux/, but
MTD's compatmac.h include this file...

so, add some parameter
typedef struct wait_queue * wait_queue_head_t;
#define DECLARE_WAITQUEUE(x,y) struct wait_queue x = {y,NULL}
#define DECLARE_WAIT_QUEUE_HEAD(x) struct wait_queue *x = NULL
#define init_waitqueue_head init_waitqueue
#define DECLARE_MUTEX(x) struct semaphore x = MUTEX;

MTD 2.2.13 must include above 5 line....

is it wrong?

and...


Please tell me, Why my mtdblock0 does not work...(could not find
request_fn)
.....

If possible, Please upload screen capture about "JFFS on NAND".... 

######################################
Sang-Hun , Kim
Multimedia Systems Lab. SNU
School of EE. Seoul National Univ.
E-Mail : shkim@fdma.snu.ac.kr
Http://fdma.snu.ac.kr/~shkim
HP : 017-398-6203
######################################
