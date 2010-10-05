Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P33cZ-0003VK-NQ
	for linux-mtd@lists.infradead.org; Tue, 05 Oct 2010 09:15:41 +0000
Received: by pzk32 with SMTP id 32so2157897pzk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Oct 2010 02:15:37 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 5 Oct 2010 02:15:37 -0700
Message-ID: <AANLkTinZLNERwwQ2xZASRzVs7+ny-ZsTO3Gm8ceh8kVE@mail.gmail.com>
Subject: questions about inval_cache_and_wait_for_operation
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

I apologize in advance for my newbie-ness and potential lack of
critical missing information, please correct me off-list and I will do
better.

I'm trying to fix a lock-up problem I'm seeing with jffs2, we run the
system with a cpu-hog for 8 hrs and somewhere between the GC thread
and sync the filesystems lock up.  I can supply more details about
this but I wanted to have all of my ducks in a row first.

While looking for the hang I ran across some code in
inval_cache_and_wait_for_operation I don't understand, and since it's
very close to the problem code I thought I'd ask.


First question....



        unsigned int timeo, sleep_time, reset_timeo;

( . . .)

        sleep_time = chip_op_time / 2;

        for (;;) {

( . . .)

                /* OK Still waiting. Drop the lock, wait a while and retry. */
                spin_unlock(chip->mutex);
                if (sleep_time >= 1000000/HZ) {
                        /*
                         * Half of the normal delay still remaining
                         * can be performed with a sleeping delay instead
                         * of busy waiting.
                         */
                        msleep(sleep_time/1000);
                        timeo -= sleep_time;
                        sleep_time = 1000000/HZ;
                } else {
                        udelay(1);
                        cond_resched();
                        timeo--;
                }

( . . . )
         }


If the execution path EVER takes the (sleep_time >= 1000000/HZ)
branch, it will ALWAYS take that branch every iteration thru the for
loop because the last statement sleep_time = 1000000/HZ sets
sleep_time explicitly to the value which is being tested for as
greater than OR EQUAL to.  Sleep_time is not otherwise changed
elsewhere in the loop.



Second question....

        unsigned int timeo, sleep_time, reset_timeo;

( . . . )

        timeo = chip_op_time_max;
        if (!timeo)
                timeo = 500000;

        sleep_time = chip_op_time / 2;

( . . .)


        for (;;) {

( . . . )

                if (!timeo) {
            // test if timeo is exactly 0
                        map_write(map, CMD(0x70), cmd_adr);
                        chip->state = FL_STATUS;
                        return -ETIME;
                }

                /* OK Still waiting. Drop the lock, wait a while and retry. */
                spin_unlock(chip->mutex);
                if (sleep_time >= 1000000/HZ) {
                        /*
                         * Half of the normal delay still remaining
                         * can be performed with a sleeping delay instead
                         * of busy waiting.
                         */
                        msleep(sleep_time/1000);
                        timeo -= sleep_time;
     //  timeo can underflow
                        sleep_time = 1000000/HZ;
                } else {
                        udelay(1);
                        cond_resched();
                        timeo--;
          // timeo will always hit 0 before underflow
                }

( . . .)


As timeo is an unsigned int and the timeo test is for exactly 0, the
timeo -= sleep_time can underflow and wrap timeo around. If this code
branch was executed only once and sleep_time < timeo this won't be a
problem, but, see first problem above.


Thanks in advance for extending me newbie latitude.


Aaron
