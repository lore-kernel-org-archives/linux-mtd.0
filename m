Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by pentafluge.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CPdXw-0002ps-L0
	for linux-mtd@lists.infradead.org; Thu, 04 Nov 2004 09:04:49 +0000
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <4189F07F.6495F568@st.com>
Date: Thu, 04 Nov 2004 10:03:59 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
References: <417F961A.1090107@yandex.ru>		<1098881953.13633.1786.camel@hades.cambridge.redhat.com>		<417FA408.9080906@yandex.ru>	<1098884706.13633.1791.camel@hades.cambridge.redhat.com>		<4180E732.70608@yandex.ru>
	<4180FAD8.2000107@yandex.ru> <41879A58.F960F963@st.com>
	<41890762.9030901@yandex.ru>
Content-Type: text/plain; charset=us-ascii
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

Hello Artem,

as I mentionned before I don't have linux so I can't really test
your patch right now. I agree with the principle of your patch.
I believe it should work this way.
I was hoping the problem could be solved without introducing
a new mutex, however I didn't check all the functions which
modify the wbuf variables so I don't know whether it is a 
realistic idea or not.
bye
Estelle

"Artem B. Bityuckiy" wrote:
> 
> Hello Estelle.
> 
> It seems I now what is the problem. Thank you for your message.
> 
> The wbuf is protected by the alloc_sem because of all the writes go
> through the space reservation (or in case of GC, it also holds the
> alloc_sem).
> 
> When JFFS2 reads the flash, it also looks to the write buffer and if the
> NAND page which should be read is currently in the wbuf, it reads some
> data from the wbuf too. But there is no any protection there.
> 
> I've introduced the new read/write semaphore (wbuf_sem). It seems the
> problem is fixed, but I'm not sure yet.
> 
> Please, could you try the attached patch? The patch was made against the
> MTD snapshot of date 20041008
> (ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd-snapshot-20041008.tar.bz2).
> 
> David, could you comment this?
>
