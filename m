Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15MOvO-0000Sc-00
	for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2001 08:05:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B52FE8B.8F2736C6@daniel.com> 
References: <3B52FE8B.8F2736C6@daniel.com>  <F1BED55F35F4D3118C0F00E0295CFF4D995554@webmail.mediatrix.com> <26220.995294549@redhat.com> 
To: Vipin Malik <vipin.malik@daniel.com>
Cc: Frederic Giasson <fgiasson@mediatrix.com>,
    linux-mtd@lists.infradead.org, jffs-dev@axis.com,
    Jean-Denis Boyer <jdboyer@mediatrix.com>
Subject: Re: JFFS2 Stability problem! 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Jul 2001 08:11:23 +0100
Message-ID: <2541.995353883@redhat.com>
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

vipin.malik@daniel.com said:
>  Well, actually that's why I called them "strange" as these did not
> show up on my serial console (I was logging my serial console messages
> to a file on another computer)!.

> Plus, they were not a "spew"- rather one in a few minutes type
> frequency. Do they tell you anything? 

KERN_DEBUG messages don't go to the console by default. But there were 
enough of them to confuse syslogd.


--
dwmw2
