Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eBQx-0000WW-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2001 09:19:47 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010903155842.A19349@kosh.hut.fi> 
References: <20010903155842.A19349@kosh.hut.fi> 
To: Jarkko Lavinen <jlavi@iki.fi>
Cc: linux-mtd@lists.infradead.org, alan@lxorguk.ukuu.org.uk
Subject: Re: complete_and_exit() problem 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 04 Sep 2001 09:25:09 +0100
Message-ID: <9062.999591909@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

jlavi@iki.fi said:
> The garbage collection thread crashes when I unmount JFFS2. The
> filesystem is empry and I only mount it and then unmount it. I am
> using kernel  2.4.8ac12 with rmk1 patch for ARM cpu.

> I traced the exeution to complete_and_exit(), then to complete(), then 
> to __wake_up_common(). In __wake_up_common() there is a loop

 <deletia - 
  http://lists.infradead.org/pipermail/linux-mtd/2001-September/003117.html >

> I tried replacing 
> -       if (comp) 
> +	if (comp && comp->wait.task_list.next)
> in complete_and_exit(). I don't know if it is the right way to do it,
> but at least the garbage gollection thread stopped crashing.

Looks like the list_head is uninitialised - we're in complete()
before anything's ever called init_completion().

ISTR this was the reason I bailed out on doing a quick fix for -ac before
disappearing to OLS.

--
dwmw2
