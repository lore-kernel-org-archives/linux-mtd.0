Received: from [80.190.106.10] (helo=taytron.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ArXzX-0001ST-TG
	for linux-mtd@lists.infradead.org; Fri, 13 Feb 2004 07:44:04 +0000
From: Florian Schirmer <jolt@tuxbox.org>
To: linux-mtd@lists.infradead.org
Date: Fri, 13 Feb 2004 08:43:59 +0100
References: <20040212223001.53258.qmail@web20724.mail.yahoo.com>
In-Reply-To: <20040212223001.53258.qmail@web20724.mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200402130843.59993.jolt@tuxbox.org>
cc: Shawn Jin <shawnxtech@yahoo.com>
Subject: Re: Understanding JFFS2 behavior
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> I know that 5 blocks need to be reserved for garbage colletion. But is this
> related the gc? Is the phenomenon normal? BTW, I use the latest mtd/jffs2
> code from CVS.

 Probably related to the cmdset2 bug.

Regards,
   Florian
