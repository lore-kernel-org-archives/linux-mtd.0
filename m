Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NF1zt-0008Sr-9z
	for linux-mtd@lists.infradead.org; Mon, 30 Nov 2009 08:52:45 +0000
Subject: Re: [PATCH/RFC v5 4/5]: core: Add dump device to call on oopses
	and panics
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20091130074603.GA30911@logfs.org>
References: <20091012131528.GC25464@elte.hu>
	<20091012153937.0dcd73e5@marrow.netinsight.se>
	<alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
	<20091012110954.67d7d8d8.akpm@linux-foundation.org>
	<20091012182346.GH17138@elte.hu>
	<alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
	<20091013151751.59e217a7@marrow.netinsight.se>
	<20091013152235.188059d2@marrow.netinsight.se>
	<20091126093657.GA25430@logfs.org> <1259566071.7518.48.camel@localhost>
	<20091130074603.GA30911@logfs.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Nov 2009 10:51:58 +0200
Message-Id: <1259571118.7518.56.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Simon Kagstrom <simon.kagstrom@netinsight.net>,
	Ingo Molnar <mingo@elte.hu>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-11-30 at 08:46 +0100, Jörn Engel wrote:
> On Mon, 30 November 2009 09:27:51 +0200, Artem Bityutskiy wrote:
> > 
> > To me it looks like 'log_end' is not supposed to wrap. What makes you
> > think it can? In which cases it can?
> 
> It is a 32bit variable.  Would do you expect happens once you reach
> 0xffffffff and add 1?

Yes, now I see log_end is an ever increasing variable.

How about this patch on top of the existing one (untested):

diff --git a/kernel/printk.c b/kernel/printk.c
index f711b99..66995ca 100644
--- a/kernel/printk.c
+++ b/kernel/printk.c
@@ -1486,28 +1486,27 @@ static const char *kmsg_to_str(enum kmsg_dump_reason reason)
  */
 void kmsg_dump(enum kmsg_dump_reason reason)
 {
-	unsigned long len = ACCESS_ONCE(log_end);
+	unsigned long end = ACCESS_ONCE(log_end) & LOG_BUF_MASK;
 	struct kmsg_dumper *dumper;
 	const char *s1, *s2;
 	unsigned long l1, l2;
 	unsigned long flags;
 
-	s1 = "";
-	l1 = 0;
-	s2 = log_buf;
-	l2 = len;
-
-	/* Have we rotated around the circular buffer? */
-	if (len > log_buf_len) {
-		unsigned long pos = len & LOG_BUF_MASK;
-
-		s1 = log_buf + pos;
-		l1 = log_buf_len - pos;
-
-		s2 = log_buf;
-		l2 = pos;
+	/*
+	 * Have we ever rotated around the circular buffer? If we never did,
+	 * we have to have zeroes at the end.
+	 */
+	if (log_buf[end]) {
+		s1 = log_buf + end;
+		l1 = log_buf_len - end;
+	} else {
+		s1 = "";
+		l1 = 0;
 	}
 
+	s2 = log_buf;
+	l2 = end;
+
 	if (!spin_trylock_irqsave(&dump_list_lock, flags)) {
 		printk(KERN_ERR "dump_kmsg: dump list lock is held during %s, skipping dump\n",
 				kmsg_to_str(reason));


Then the whole function will look like this:

/**
 * kmsg_dump - dump kernel log to kernel message dumpers.
 * @reason: the reason (oops, panic etc) for dumping
 *
 * Iterate through each of the dump devices and call the oops/panic
 * callbacks with the log buffer.
 */
void kmsg_dump(enum kmsg_dump_reason reason)
{
        unsigned long end = ACCESS_ONCE(log_end) & LOG_BUF_MASK;
        struct kmsg_dumper *dumper;
        const char *s1, *s2;
        unsigned long l1, l2;
        unsigned long flags;

        /*
         * Have we ever rotated around the circular buffer? If we never did,
         * we have to have zeroes at the end.
         */
        if (log_buf[end]) {
                s1 = log_buf + end;
                l1 = log_buf_len - end;
        } else {
                s1 = "";
                l1 = 0;
        }

        s2 = log_buf;
        l2 = end;

        if (!spin_trylock_irqsave(&dump_list_lock, flags)) {
                printk(KERN_ERR "dump_kmsg: dump list lock is held during %s, skipping dump\n",
                                kmsg_to_str(reason));
                return;
        }
        list_for_each_entry(dumper, &dump_list, list)
                dumper->dump(dumper, reason, s1, l1, s2, l2);
        spin_unlock_irqrestore(&dump_list_lock, flags);
}

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
