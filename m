Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1COzha-00059f-Ke
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2004 09:32:04 -0500
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <41879A58.F960F963@st.com>
Date: Tue, 02 Nov 2004 15:31:52 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
References: <417F961A.1090107@yandex.ru>		<1098881953.13633.1786.camel@hades.cambridge.redhat.com>		<417FA408.9080906@yandex.ru>	<1098884706.13633.1791.camel@hades.cambridge.redhat.com>
	<4180E732.70608@yandex.ru> <4180FAD8.2000107@yandex.ru>
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

Have you made any progress with this issue ?

I believe this problem could be reproduced more easily
by adding a long sleep() at the end of __jffs2_flush_wbuf
between memset() and the affectation of c->wbuf_ofs.
Then write and fsync a file and try to read it back during
the sleep.
I've done something similar on my non-linux setup (actually
I use a longjmp to exit from __jffs2_flush_wbuf) and I obtain 
the following when I try to read back the file:
<7>Node read from 00080160: node_crc ffffffff, calculated CRC f09e7845. dsize ffffffff, csize ffffffff, offset ffffffff,
buf 1100a48
<4>Node CRC ffffffff != calculated CRC f09e7845 for node at 00080160

I think the wbuf variables are well protected against
cuncurrent writes, however if the wbuf is being flushed 
(fsync or GC) and you try to _read_ the file which has a 
node in wbuf, there may be some inconsistency between 
wbuf_ofs and wbuf contents.
I suggest to modify the end of __jffs2_flush_wbuf this way:

	c->wbuf_len = 0; /* do this FIRST so that reads won't attempt to use wbuf */
	memset(c->wbuf,0xff,c->wbuf_pagesize);
	/* adjust write buffer offset, else we get a non contiguous write bug */
	c->wbuf_ofs += c->wbuf_pagesize;

Does this seem useful ?
Estelle

"Artem B. Bityuckiy" wrote:
> 
> Hello,
> 
> how the the wbuf and related variables in the jffs2_sb_info are protected?
> 
> --
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Estelle Hammache
Terminal Management Team (Mobile phones MCU Software Development)
TINA : 044 8024
Phone : (+33) 1 58 07 80 24
