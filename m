Received: from carisma.slowglass.com ([195.224.96.167]
	helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Jrzx-0000w7-BT
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 10:41:02 +0100
Received: from [203.194.209.83] (helo=machine36.com)
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 19JMfI-0007HP-00
	for linux-mtd@lists.infradead.org; Sat, 24 May 2003 01:13:36 +0100
From: Mark Meade <mark@lakeshoremicro.com>
To: scohen@atlanticpositioners.com,
 <linux-mtd@lists.infradead.org>
Date: Fri, 23 May 2003 20:10:37 -0400
References: <001201c32081$b4e2d360$1d28a8c0@flpalmharbor>
In-Reply-To: <001201c32081$b4e2d360$1d28a8c0@flpalmharbor>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200305232001.01206.mark@lakeshoremicro.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: Corrupted DOC 2000 and Tools Building Problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 22 May 2003 12:46 pm, Stephen D. Cohen wrote:
> If anyone can suggest a method to revive my scrogged DOC, I will greatly
> appreciate it. 

I've had more than a few times when I've thought my DOC was completely dead, 
and I've always been able to revive it with an older M-Sys utility called 
"docpmap.exe".  I recall that this command could be dangerous - it had the 
ability to completely erase the DOC, including the bad block table.

I don't think this utility is available anymore, but similar functionality may 
be available through command line options to DFORMAT.

It's also possible that eraseall and nftl_format under Linux could fix things 
up, but that may trash the BBT as well.
