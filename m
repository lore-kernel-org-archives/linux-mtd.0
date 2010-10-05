Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P3Efw-0003HT-9P
	for linux-mtd@lists.infradead.org; Tue, 05 Oct 2010 21:03:53 +0000
Received: by gxk27 with SMTP id 27so2916442gxk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Oct 2010 14:03:50 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 5 Oct 2010 14:03:49 -0700
Message-ID: <AANLkTikttX8kwa2upG1_T78y=r_cOZgoUrt4PWOZWv3i@mail.gmail.com>
Subject: questions about jffs2 jffs2_erase_pending_blocks in erase.c
From: Aaron Nabil <krellboy@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Again apologies if I'm doing this wrong, I rarely poke at the kernel
and only have a few days experience looking at jffs2 and don't
understand the "big picture" yet, but I'm seeing some things I don't
understand and would be grateful for any help.  Please contact me
off-list if you want to send me a "you are so stupid, it's supposed to
be doing that", in fact I'd welcome that over silence.  I'd even thank
you.

My question:

jffs2_erase_pending_blocks is only called with 1 or 0 as count arguments.

 nodemgmt.c jffs2_reserve_space  121 jffs2_erase_pending_blocks(c, 1);
 nodemgmt.c jffs2_find_nextblock 248 jffs2_erase_pending_blocks(c, 1);
 super.c    jffs2_write_super     67 jffs2_erase_pending_blocks(c, 0);

The test  if (!--count) seems to be testing for (count == 1) as the
decrement happens first.  If count is 0 it will be decremented
negative, underflow and wrap around to positive, and then eventually
hit 0 4 billion loop interations later.

Thanks in advance to anyone looking at this,

Aaron

void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
{
        struct jffs2_eraseblock *jeb;

        mutex_lock(&c->erase_free_sem);

        spin_lock(&c->erase_completion_lock);

        while (!list_empty(&c->erase_complete_list) ||
               !list_empty(&c->erase_pending_list)) {

                if (!list_empty(&c->erase_complete_list)) {
                        jeb = list_entry(c->erase_complete_list.next,
struct jffs2_eraseblock, list);
                        list_move(&jeb->list, &c->erase_checking_list);
                        spin_unlock(&c->erase_completion_lock);
                        mutex_unlock(&c->erase_free_sem);
                        jffs2_mark_erased_block(c, jeb);

                        if (!--count) {            //  decrement then
test is equiv to (count == 1)
                                D1(printk(KERN_DEBUG "Count reached.
jffs2_erase_pending_blocks leaving\n"));
                                goto done;
                        }
