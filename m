Received: from lon-del-03.spheriq.net ([195.46.50.99])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CtOhV-0001Xd-Sg
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2005 06:17:42 -0500
Received: from lon-inc-07.spheriq.net ([195.46.50.71])
	by lon-del-03.spheriq.net with ESMTP id j0PBHXp3008444
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2005 11:17:33 GMT
Received: from lon-out-01.spheriq.net (lon-out-01.spheriq.net [195.46.50.129])
	by lon-inc-07.spheriq.net with ESMTP id j0PBHXe8025859
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2005 11:17:33 GMT
Received: from lon-cus-01.spheriq.net (lon-cus-01.spheriq.net [195.46.50.37])
	by lon-out-01.spheriq.net with ESMTP id j0PBHVh8032207
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2005 11:17:33 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <41F62AC2.250C0C4C@st.com>
Date: Tue, 25 Jan 2005 12:17:22 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <1106603928.5081.50.camel@tglx.tec.linutronix.de>
	<1106604557.6480.80.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: mtd/fs/jffs2 nodemgmt.c,1.115,1.116
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> And the first commit I looked at violated the coding style.

I am a horrible coding style violator. I did submit
the patch to the list beforehand didn't I ? 
After googling up "linux kernel coding style" the only
problem I find is with leading braces. If there are other
uglies please tell me (unnecessary comments maybe ?). 
I'll be correcting it tonight.

Estelle
