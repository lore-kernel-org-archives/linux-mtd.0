Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 172WyF-0000I4-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2002 13:43:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D014ECEDE@mail.mediatrix.com> 
References: <F1BED55F35F4D3118C0F00E0295CFF4D014ECEDE@mail.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Endless gc spining on nearly full JFFS2 fs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 30 Apr 2002 13:43:02 +0100
Message-ID: <20574.1020170582@redhat.com>
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
>     I have noticed that the gc sometimes seems to spin-around for a
> very long time, if not endlessly, when files are copied to a nearly
> full JFFS2 drive.  

Hmmm. This shouldn't happen. Can you provide a log with the debugging 
enabled? Somehow, some space is being marked dirty when we're 
garbage-collecting, so it thinks it can still make some progress.

--
dwmw2
