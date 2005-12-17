Received: from zproxy.gmail.com ([64.233.162.199])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EnQj4-0005Qk-EY
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2005 20:19:10 -0500
Received: by zproxy.gmail.com with SMTP id i11so823560nzi
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 Dec 2005 17:19:02 -0800 (PST)
Message-ID: <758a2bbf0512161719h98a2a84h2967a4771245fac9@mail.gmail.com>
Date: Fri, 16 Dec 2005 17:19:02 -0800
From: Vijay Sampath <vsampath@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: bug in MTD code based on kernel 2.4.32
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I will probably get flamed for referring to ancient kernels. However
we have been using 2.4 based kernels for a while now, and do not want
to change for customer compatability issues etc. We occasionally see
board lockups on flash accesses. I have traced this down to a bug in
the 2.4 MTD code, and I see this problem even in the latest code I
could download (2.4.32).

The problem is in cfi_cmdset_0001.c, and may be present in drivers for
other chips as well. In the function cfi_intelext_sync() function
before calling add_wait_queue, the current process needs to be put to
sleep by calling set_current_state(TASK_INTERRUPTIBLE). If it is not
put to sleep, the task remains in the run queue of the kernel and if
its priority is high enough, the kernel will constantly keep
scheduling this process, the state of the chip will never change.

Adding this one line seems to make our lockups go away.

Please let me know if this is an accurate assessment. BTW we are using
Timesys Linux kernel, which is slightly different from the stock
kernel.

Thanks,

Vijay
