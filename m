Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CPe3I-0001H4-4s
	for linux-mtd@lists.infradead.org; Thu, 04 Nov 2004 04:37:09 -0500
Message-ID: <4189F823.2060204@yandex.ru>
Date: Thu, 04 Nov 2004 12:36:35 +0300
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Estelle HAMMACHE <estelle.hammache@st.com>
References: <417F961A.1090107@yandex.ru>		<1098881953.13633.1786.camel@hades.cambridge.redhat.com>		<417FA408.9080906@yandex.ru>	<1098884706.13633.1791.camel@hades.cambridge.redhat.com>		<4180E732.70608@yandex.ru>
	<4180FAD8.2000107@yandex.ru> <41879A58.F960F963@st.com>
	<41890762.9030901@yandex.ru> <4189F07F.6495F568@st.com>
In-Reply-To: <4189F07F.6495F568@st.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 & SMP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Estelle, I'm glad not to introduce new mutes, but I don't really know 
how to do so easy way.

 > I didn't check all the functions which
 > modify the wbuf variables so I don't know whether it is a
 > realistic idea or not.
I investigated this. These are:
jffs2_flash_writev()
__jffs2_flush_wbuf()
jffs2_wbuf_recover() too, but it is called only from __jffs2_flush_wbuf().

Anyway, all such functions are in wbuf.c

Basically, the c->alloc_sem protects the write buffer. It is logical to 
use it in the jffs2_flash_read() too. But the problem is that the 
jffs2_flash_read() is called by from many places and the c->alloc_sem 
may be already locked (when the jffs2_flash_read() is called from the 
Garbage Collector, for example) or not locked (when, for example, JFFS2 
performs the read_node() superblock operation).

Thus, we should introduce one more function parameter (like 
alloc_sem_is_set "boolean" flag) to distinguish if the alloc_sem is 
hold. It is possible too. But the jffs2_flash_read() functions is also 
called from many other functions, and we will need to add this parameter 
recursively to all of them (for example, jffs2_mark_node_obsolete()).

It seems the "down_trylock" decision is will not work.

So, I think this way is not very nice... Any suggestions?

Estelle HAMMACHE wrote:
> Hello Artem,
> 
> as I mentionned before I don't have linux so I can't really test
> your patch right now. I agree with the principle of your patch.
> I believe it should work this way.
> I was hoping the problem could be solved without introducing
> a new mutex, however I didn't check all the functions which
> modify the wbuf variables so I don't know whether it is a 
> realistic idea or not.
> bye
> Estelle
> 


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
