Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15M9UQ-0007x6-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 15:36:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D995554@webmail.mediatrix.com> 
References: <F1BED55F35F4D3118C0F00E0295CFF4D995554@webmail.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: 'Vipin Malik' <vipin.malik@daniel.com>,
    linux-mtd@lists.infradead.org, jffs-dev@axis.com,
    Jean-Denis Boyer <jdboyer@mediatrix.com>
Subject: Re: JFFS2 Stability problem! 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 16 Jul 2001 15:42:29 +0100
Message-ID: <26220.995294549@redhat.com>
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

fgiasson@mediatrix.com said:
> Here are Vipin's debug terminal log:
> <snip> 

That's just klogd/syslogd failing to keep up with the spew of normal 
debugging messages. 

--
dwmw2
