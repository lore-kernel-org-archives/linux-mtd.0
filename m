Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15M8yz-0007ta-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 15:04:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D995552@webmail.mediatrix.com> 
References: <F1BED55F35F4D3118C0F00E0295CFF4D995552@webmail.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com,
    Jean-Denis Boyer <jdboyer@mediatrix.com>
Subject: Re: JFFS2 Stability problem! 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 16 Jul 2001 15:09:52 +0100
Message-ID: <21355.995292592@redhat.com>
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
> 	I found a stability problem that looks like a flash space leak while
> running intense test case with JFFS2. 

Definitely looks like a leak. Does the space come back after an unmount and 
remount?

--
dwmw2
