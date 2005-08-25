Received: from tyo202.gate.nec.co.jp ([210.143.35.52])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8F1S-0000iJ-PS
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 06:31:54 -0400
Message-ID: <430D9D5A.4000504@ak.jp.nec.com>
Date: Thu, 25 Aug 2005 19:28:42 +0900
From: Kaigai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <430AF95F.1050704@ak.jp.nec.com>	<20050823124649.GB30853@wohnheim.fh-wedel.de>	<1124801569.29448.13.camel@hades.cambridge.redhat.com>
	<430C429B.6040500@ak.jp.nec.com>
In-Reply-To: <430C429B.6040500@ak.jp.nec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: James Morris <jmorris@redhat.com>, Ma Yun <sx_yunma@hotmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Stephen Smalley <sds@tycho.nsa.gov>,
	Kaigai Kohei <kaigai@ak.jp.nec.com>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Today, I think about appropriate locking in JFFS2's XATTR.
I hope to get some comments about dividing locking.

> * Dividing the global xattr_sem semaphore into more small lock.

xattr_sem is a global read/write semaphore stored in jffs2_sb_info
to protect any XATTR structure.
In common case, dividing lock/semaphore has good effects for scalability
toward the number of CPUs. But JFFS2 is frequently used for small
and embedded region in my understanding.

If global semaphore is divided into many per-entry locks, we may be able
to execute setxattr() concurrently. But each locking/un-locking cost
may also exceed the scalability effect.
Since I don't have much experience in this region, I hope any professional's
worthwhile comments.

Now, I think one global read/write semaphore is enough for 1-2 CPUs,
if assumption of the XATTR processing with wrinting does not happen
so much is permitted.  In almost case, we can execute get/listxattr
cuncurrently with one lock/un-locking, I think.

Thanks,
-- 
Linux Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>
