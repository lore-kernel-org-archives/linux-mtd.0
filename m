Received: from webmail.mediatrix.com ([66.129.134.11] helo=mail.mediatrix.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15MTqz-0000kq-00
	for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2001 13:21:29 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D995556@webmail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'David Woodhouse' <dwmw2@infradead.org>, Vipin Malik
	 <vipin.malik@daniel.com>
Cc: Frederic Giasson <fgiasson@mediatrix.com>,
	linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: RE: JFFS2 Stability problem! 
Date: Tue, 17 Jul 2001 08:20:28 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Do those KERN_DEBUG messages tell you anything about this?  Do you have =
an
idea on how fixing this problem?

Fr=E9d=E9ric Giasson




-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Tuesday, July 17, 2001 3:11 AM
To: Vipin Malik
Cc: Frederic Giasson; linux-mtd@lists.infradead.org; jffs-dev@axis.com;
Jean-Denis Boyer
Subject: Re: JFFS2 Stability problem!=20



vipin.malik@daniel.com said:
>  Well, actually that's why I called them "strange" as these did not
> show up on my serial console (I was logging my serial console =
messages
> to a file on another computer)!.

> Plus, they were not a "spew"- rather one in a few minutes type
> frequency. Do they tell you anything?=20

KERN_DEBUG messages don't go to the console by default. But there were=20
enough of them to confuse syslogd.


--
dwmw2
