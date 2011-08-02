Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QoBP4-0001Nw-2M
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2011 09:36:46 +0000
Received: by wwf22 with SMTP id 22so4597552wwf.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Aug 2011 02:36:42 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 2 Aug 2011 15:00:43 +0530
Message-ID: <CAMjNe_fD8R39w8FScVHLK2q26uuEgd9vuG0e+aLKF7cea-fkeA@mail.gmail.com>
Subject: mtdchar, parallel erase with ioctl
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
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

Hi all,
The mtdchar layer when it does erase using ioctl, it takes  a lock
mtd_mutex.So the erases can only be done sequentially one after
another. The hardware that i am working on has multiple banks and
supports parallel erase operations. I have modified mtd_unlocked_ioctl
function in mtdchar.c, to not take lock for erase commands(as shown
below). With that i am able to do parallel erases. Is this patch an
acceptable solution or what is the correct way to do this?

static long mtd_unlocked_ioctl(struct file *file, u_int cmd, u_long arg)
{
       int ret;

       /* allow parallel-erase by not taking the lock */
#if 1
       if(cmd == MEMERASE || cmd == MEMERASE64){

               ret = mtd_ioctl(file, cmd, arg);
       }
       else
#endif
       {
               mutex_lock(&mtd_mutex);
               ret = mtd_ioctl(file, cmd, arg);
               mutex_unlock(&mtd_mutex);
       }
       return ret;
}

thanks,
mugunthan
