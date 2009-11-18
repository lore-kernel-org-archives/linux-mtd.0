Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NAfug-0003OV-Fo
	for linux-mtd@lists.infradead.org; Wed, 18 Nov 2009 08:29:22 +0000
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
In-Reply-To: <4B02CE86.5000908@aimvalley.nl>
References: <4B012D0D.4080500@aimvalley.nl>
	<1258446318.27437.60.camel@localhost> <4B02CE86.5000908@aimvalley.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 18 Nov 2009 10:28:38 +0200
Message-Id: <1258532918.27437.126.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, joakim.tjernlund@transmode.se
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-17 at 17:25 +0100, Norbert van Bolhuis wrote:
> 
> I tested all mentioned solutions. It turns out only the "erase-suspend option"
> helps.
> 
> 
> lowering the UBI BG task priority somehow causes the application to block until
> the UBI BG task finishes erasing *all* NOR blocks. I guess the application is blocked
> in get_chip and never gets activated by the scheduler.
> I do not understand why this happens. How can a lower UBI BG prio make the application
> block for so long ?
> Maybe I implemented it wrong, I added line 1359.
> 1354 int ubi_thread(void *u)
> 1355 {
> 1356         int failures = 0;
> 1357         struct ubi_device *ubi = u;
> 1358
> 1359         set_user_nice(current, 19);
> 1360
> 1361         ubi_msg("background thread \"%s\" started, PID %d",
> 1362                 ubi->bgt_name, task_pid_nr(current));
> I did see the ubi_bg prio = 139 (lowest possible prio), it used to be 115.
> I also tried 135, same result.
> Anyway, this doesn't seem to work.
> 
> 
> Using yield() in the UBI BG task doesn't seem to do much. It for sure doesn't cause
> the application to become active after a (couple of) erase operations. The log shows:
> LE:0197, TIME=0026.276, pid=0918, M(xy=00)=do_erase_oneblock, START
> LE:0198, TIME=0026.868, pid=1237, M(xy=04)=commit_semR, make_reservation, Req DOWN 1
> LE:0199, TIME=0026.868, pid=1237, M(xy=05)=commit_semR, make_reservation, DOWN 1
> LE:0200, TIME=0026.868, pid=1237, M(xy=02)=io_mutex, reserve_space, Req LOCK 1
> LE:0201, TIME=0026.868, pid=1237, M(xy=03)=io_mutex, reserve_space, LOCK 1
> LE:0202, TIME=0027.104, pid=0918, M(xy=01)=do_erase_oneblock, END
> LE:0203, TIME=0027.104, pid=0918, M(xy=0c)=yield
> LE:0204, TIME=0027.104, pid=0918, M(xy=00)=do_erase_oneblock, START
> LE:0205, TIME=0027.876, pid=0918, M(xy=01)=do_erase_oneblock, END
> LE:0206, TIME=0027.876, pid=0918, M(xy=0c)=yield
> LE:0207, TIME=0027.876, pid=0918, M(xy=00)=do_erase_oneblock, START
> LE:0208, TIME=0028.672, pid=0918, M(xy=01)=do_erase_oneblock, END
> LE:0209, TIME=0028.672, pid=0918, M(xy=0c)=yield
>    <omitted many do_erase_oneblock END/START + yield entries>
> LE:0294, TIME=0051.132, pid=0918, M(xy=00)=do_erase_oneblock, START
> LE:0295, TIME=0051.944, pid=0918, M(xy=01)=do_erase_oneblock, END
> LE:0296, TIME=0051.944, pid=0918, M(xy=0c)=yield
> LE:0297, TIME=0051.944, pid=0918, M(xy=00)=do_erase_oneblock, START
> LE:0298, TIME=0052.080, pid=0108, M(xy=04)=commit_semR, make_reservation, Req DOWN 1
> LE:0299, TIME=0052.080, pid=0108, M(xy=05)=commit_semR, make_reservation, DOWN 1
> LE:0300, TIME=0052.080, pid=0108, M(xy=02)=io_mutex, reserve_space, Req LOCK 1
>    <omitted many do_erase_oneblock END/START + yield entries>
> LE:0405, TIME=0080.652, pid=0918, M(xy=00)=do_erase_oneblock, START
> LE:0406, TIME=0081.536, pid=0918, M(xy=01)=do_erase_oneblock, END
> LE:0407, TIME=0081.536, pid=0918, M(xy=0c)=yield
> LE:0408, TIME=0081.536, pid=0918, M(xy=00)=do_erase_oneblock, START
> LE:0409, TIME=0082.332, pid=0918, M(xy=01)=do_erase_oneblock, END
> LE:0410, TIME=0082.332, pid=0918, M(xy=0c)=yield
> LE:0411, TIME=0082.332, pid=1237, M(xy=06)=io_mutex, release_head, Req UNLOCK
> LE:0412, TIME=0082.332, pid=0108, M(xy=03)=io_mutex, reserve_space, LOCK 1
> LE:0413, TIME=0082.332, pid=0108, M(xy=06)=io_mutex, release_head, Req UNLOCK
> LE:0414, TIME=0082.332, pid=0108, M(xy=07)=io_mutex, release_head, UNLOCK
> LE:0415, TIME=0082.332, pid=0108, M(xy=08)=commit_semR, finish_reservation, Req UP
> LE:0416, TIME=0082.332, pid=0108, M(xy=09)=commit_semR, finish_reservation, UP
> As can be seen it still takes ~ 55 seconds before the application (pid=1237) and pdflush
> (pid=0108) can continue.
> 
> 
> Using the erase-suspend feature works great. The application creates and writes
> files without any delay. pdflush isn't delayed either.
> The difference is that the UBI BG thread erased only 200 blocks after our application
> is completely up and running while this used to be ~ 1000. This is as expected and
> a logical consequence of the erase-suspend.
> 
> 
> So as far as I'm concerned this problem has been solved. I'm gonna use the
> erase-suspend feature in the way Joakim suggested.
> I will do a few additional erase-suspend related tests (since it looks like I'm one of the
> first users for cmdset_002) and report problems to this list (as usual).
> 
> thanks for all help.

The best way to say thanks is:

1. Add a small documentation section about your case to UBIFS howto, so
others could benefit. You could send a patch against the MTD web-site:
http://git.infradead.org/mtd-www.git

2. Make your solution work in upstream out-of-the box.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
