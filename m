Received: from webmail11.yandex.ru ([213.180.200.52])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GNuhz-0000mB-3B
	for linux-mtd@lists.infradead.org; Thu, 14 Sep 2006 18:09:03 +0100
Date: Thu, 14 Sep 2006 21:04:59 +0400 (MSD)
From: "dedekind" <dedekind@yandex.ru>
Sender: dedekind@yandex.ru
Message-Id: <45098BBB.000009.05972@webmail11.yandex.ru>
MIME-Version: 1.0
Errors-To: dedekind@yandex.ru
To: justin_treon@yahoo.com
Subject: Re: JFFS2 ECC options
In-Reply-To: <20060914163219.74505.qmail@web30505.mail.mud.yahoo.com>
References: <20060914163219.74505.qmail@web30505.mail.mud.yahoo.com>
Content-Type: text/plain;
  charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, davide.cascone@st.com
Reply-To: dedekind@yandex.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>I have no idea about your first question.  You may
>want to ask it again.  
>
>Regarding summary support I have never been able to
>make a jffs2 filing system that used summary support
>with the mkfs.jffs2 tool that worked.  I create the
>filing system with summary support on an empty chip
>and then transfer the files. Please let me knhwo if
>you get it to work with the mkfs.jffs2 tool.

Yeah, it makes a lot of sense not integrate the "sumtool" stuff
and mkfs.jffs2.

Nevertheless, it would prabably be nice if you sent a bugreport if
it doesn't work.

Artem.
