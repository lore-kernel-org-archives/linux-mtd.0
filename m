Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VXu1-0002N6-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2002 13:02:21 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C569C1A.38BBF76F@etx.ericsson.se> 
References: <3C569C1A.38BBF76F@etx.ericsson.se>  <3C5673A4.662CC3E6@cambridgebroadband.com> 
To: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
Cc: Alex Zeffertt <ajz@cambridgebroadband.com>,
    linuxppc-embedded <linuxppc-embedded@lists.linuxppc.org>,
    "mtd@infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2: strange output 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 29 Jan 2002 13:13:21 +0000
Message-ID: <11887.1012310001@redhat.com>
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

kenneth.johansson@etx.ericsson.se said:
> After 11 of the above I get the following message in /var/log/messages:
> 
> Dec 24 00:05:55 gonzo kernel: Waiting for chip to read, status = 4
> Dec 24 00:05:55 gonzo kernel: Waiting for chip to read, status = 7
> Dec 24 00:06:26 gonzo last message repeated 2841 times
> 
> By this point the copies are progressing painfully slowly. 

Those messages are harmless. They're removed in non-ancient versions of the 
code. The system slows down partly due to the garbage collection, and 
partly due to the spewing of these messages.

--
dwmw2
