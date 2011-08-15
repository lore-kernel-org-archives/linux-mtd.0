Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qsz0V-0003rI-98
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 15:23:15 +0000
Received: by gyh20 with SMTP id 20so3428220gyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 08:23:13 -0700 (PDT)
Subject: Re: mtdchar, parallel erase with ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
Date: Mon, 15 Aug 2011 18:24:52 +0300
In-Reply-To: <CAMjNe_fD8R39w8FScVHLK2q26uuEgd9vuG0e+aLKF7cea-fkeA@mail.gmail.com>
References: <CAMjNe_fD8R39w8FScVHLK2q26uuEgd9vuG0e+aLKF7cea-fkeA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313421896.8691.7.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-08-02 at 15:00 +0530, srimugunthan dhandapani wrote:
> Hi all,
> The mtdchar layer when it does erase using ioctl, it takes  a lock
> mtd_mutex.So the erases can only be done sequentially one after
> another. The hardware that i am working on has multiple banks and
> supports parallel erase operations. I have modified mtd_unlocked_ioctl
> function in mtdchar.c, to not take lock for erase commands(as shown
> below). With that i am able to do parallel erases. Is this patch an
> acceptable solution or what is the correct way to do this?

No, mtd_mutex is needed e.g., because it makes sure that no-one removes
the MTD device meanwhile. I do not see why exactly mtd_mutex prevents
parallel erase.

-- 
Best Regards,
Artem Bityutskiy
