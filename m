Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHXSJ-0002Dr-Rh
 for linux-mtd@lists.infradead.org; Sat, 31 Jan 2015 12:47:20 +0000
Message-ID: <1422708415.8637.328.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RFC 2/2] UBIFS: scan all log lebs during log replay
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Sat, 31 Jan 2015 14:46:55 +0200
In-Reply-To: <549C0CC4.9050703@huawei.com>
References: <549C0A10.3000201@huawei.com> <549C0CC4.9050703@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, shengyong1@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-12-25 at 21:10 +0800, hujianyang wrote:
> UBIFS suppose no more log lebs need to be scanned when
> replay_log_leb() return %1. But it is not true because
> some log lebs maybe incorrectly empty and the next leb
> of this empty one may contain valid filesystem data.

>From your other e-mail, I understood that you are doing fuzzing. That
is, you take a valid file-system, then you corrupt it (e.g., erase one
LEB), and then you try to mount it.

This is a great test, I never saw anyone doing it for UBIFS, so I expect
there may be issues.

Let's agree on expectations.

What do we expect UBIFS to do when we give it a corrupted image? I think
we expect it to either reject it, or accept, but some files may be lost
or corrupted.

And we for sure do not expect UBIFS to crash the kernel, or corrupt the
file-system even more (still good data should not become corrupted).

Now, what this patch does, it essentially it fixes the following UBIFS
behavior.

UBIFS replies the log. It meets empty LEB (this is our injected
corruption), and it believes this is the end of the log. It proceeds and
mounts the FS.

Nothing wrong so far, IMO.

However, the LEBs we missed contain valid data. And what will happen to
them once we start writing to the FS? Right - they'll be erased, and
good data disappears. However, this will be the data that was not
committed, which means this will be something written to the file-system
just before the power cut. And I think it is expected that this data may
disappear. So this is not that bad.

The other _potential_ problem is that the "skipping one LEB" scenario
has never been really tested, and there may be bugs which may lead to
kernel crashes or data loss.

Therefore, while I acknowledge the problem, I do not think this patch is
the right answer to the problem.

The easiest solution is to do nothing. Just let the rest of the log go
away. Does not look big deal to me.

The more difficult thing to do is to start analyzing the log further,
see what's in there, and keep replying if we are sure this is our stuff.
But I cannot come up with a reliable algorithm for this off the top of
my head.
