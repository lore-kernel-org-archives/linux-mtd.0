Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CtPIn-0001rm-0D
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2005 06:56:10 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1106650690.5081.81.camel@tglx.tec.linutronix.de>
References: <1106603928.5081.50.camel@tglx.tec.linutronix.de>
	<41F61BE1.10A2DDA8@st.com>
	<1106650690.5081.81.camel@tglx.tec.linutronix.de>
Content-Type: text/plain
Date: Tue, 25 Jan 2005 14:55:34 +0300
Message-Id: <1106654134.31239.49.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/fs/jffs2 nodemgmt.c,1.115,1.116
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-01-25 at 11:58 +0100, Thomas Gleixner wrote:
> Things have changed over time, so I'm not sure whether the wasted ->
> dirty accounting is still correct all over the place. It was once :)
You know, it not completely correct. When wbuf is sync-ed, the padding
is treated as wasted irrespective of its size. But this doesn't break
JFFS2, though.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
