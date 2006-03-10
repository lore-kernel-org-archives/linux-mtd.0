Received: from mx1.cdacindia.com ([203.199.132.35] helo=mx2.cdac.ernet.in)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FHgOx-0002J3-GK
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 07:07:33 -0500
Received: from mailhub.cdac.in ([203.199.132.67])
	by mx2.cdac.ernet.in (SAVSMTP 3.1.0.29) with SMTP id
	M2006031017343828903
	for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2006 17:34:38 +0530
Received: from mailhub.cdac.in (mailhub [196.1.109.254])
	by mailhub.cdac.in (8.13.4/8.13.4) with ESMTP id k2AC7HgE011694
	for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2006 17:37:17 +0530
From: "NIkhil Shirodkar" <nikhils@cdac.in>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Date: Fri, 10 Mar 2006 17:45:21 +0530
Message-ID: <GKELLIPIEBJEKGFGNIFKGEHACAAA.nikhils@cdac.in>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <44115D6D.8030702@yandex.ru>
Cc: linux-mtd@lists.infradead.org
Subject: RE: About JFFS2 garbage collector.
Reply-To: nikhils@cdac.in
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

What I figured out one call jffs2_garbage_collect_pass() which initiates
garbage collection when there is not enough space to write a file. I figured
out few more instances when this got called, Let me know if this is the only
call to trigger garbage collector or are there any more calls?

Is it essential to call jffs2_garbage_collect_pass() repeatedly to get a
free jeb, or if once the jffs2_garbage_collect_pass() is called, it ensures
of making one jeb free. (barring the case when ic-->state of
INO_STATE_READING is found and the GC returns success without achieving the
desired)

I also wanted to find out _all_ other instances when the GC thread runs. Is
there any way one can force the GC thread to run like the case when, you are
not performing any I/O operations. This might be helpful to reduce the write
latency of a nearly full filesystem.

thx,

nik
NISG, CDAC

-----Original Message-----
From: Artem B. Bityutskiy [mailto:dedekind@yandex.ru]
Sent: Friday, March 10, 2006 4:35 PM
To: Nikhil
Cc: linux-mtd@lists.infradead.org
Subject: Re: About JFFS2 garbage collector.

Nikhil wrote:
> Is there any documentations as such for the JFFS2 garbage collection
> policy. Plaese let me know if any. Even if there is none, i am not
> hesistant to look in the code, can some one of you give me some pointers
> for the same.
I don't think there is some documentation. JFFS2 GC policy is fairly
trivial. Just ask your questions, I'll try to answer.

--
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
