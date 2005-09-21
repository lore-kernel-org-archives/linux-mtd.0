Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EI5Jq-0007Sb-2B
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 10:11:37 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: balkohen@gmail.com
In-Reply-To: <196b7d310509201437bd93c27@mail.gmail.com>
References: <196b7d310509201437bd93c27@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 21 Sep 2005 18:10:55 +0400
Message-Id: <1127311855.20014.83.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: kernel panic with block2mtd
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-09-20 at 23:37 +0200, Lior Balkohen wrote:
> diaspora lior # dmesg|tail
>  [<e0be4c3c>] jffs2_stop_garbage_collect_thread+0x7c/0x90 [jffs2]
>  [<e0be6849>] jffs2_kill_sb+0x49/0x6f [jffs2]
>  [<c015cbda>] deactivate_super+0x5a/0x90
>  [<c0174f3f>] sys_umount+0x3f/0x90
>  [<c0149cbf>] do_munmap+0x11f/0x180
>  [<c0149d64>] sys_munmap+0x44/0x70
>  [<c0174fa7>] sys_oldumount+0x17/0x20
>  [<c0102e4b>] sysenter_past_esp+0x54/0x75
> Code: 89 1c 24 8b 74 24 10 f6 42 10 01 75 2c 8d 5e ff 0f a3 9a 64 04
> 00 00 19 c0 85 c0 75 1c 8d 04 b6 c1 e0 02 03 82 60 04 00 00 31 d2 <8b>
> 40 f0 83 f8 01 74 25 85 c0 74 0f 89 d1 8b 1c 24 8b 74 24 04
>  <6>note: umount[6883] exited with preempt_count 3
> 
> 
> what's going on?
> 
Is it possible to send some debugging information by means of enableint
it in the JFFS2 config ?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
