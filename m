Received: from web52710.mail.yahoo.com ([206.190.39.161])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DY4T4-0006JR-M2
	for linux-mtd@lists.infradead.org; Tue, 17 May 2005 11:58:51 -0400
Message-ID: <20050517155855.14651.qmail@web52710.mail.yahoo.com>
Date: Tue, 17 May 2005 08:58:55 -0700 (PDT)
From: Michael <xemc@yahoo.com>
To: HS8JCV <hs8jcv@gmail.com>, linux-mtd@lists.infradead.org
In-Reply-To: 6667
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 
Subject: Re: How to use jffs2.?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- HS8JCV <hs8jcv@gmail.com> wrote:
> Hi all.
> I use AT91RM9200DK and linux version 2.4.27-vrs1.
> This kernel support jffs2 because I saw at startup(dmesg).
> but I run command cat /proc/mtd and df -h .
> cat /proc/mtd
> dev:    size   erasesize  name
> 
> df -h
> Filesystem                Size      Used Available Use% Mounted
> on
> /dev/root                14.5M      6.7M      7.8M  46% /
> 
> Flash on my board 8 M (intel E28F640)
> I will save data into my board.
> 
> How to use jffs2.?
> Please,suggest me for next step.
> 
> Best Regard
> Mr.X

Uhh..
Maybe you are using JFFS2 already.

Could you read the documents prepared at linux-mtd.infradead.org? 
They should tell you all you need to know, and if not, a search of
the mailing list should.

Otherwise, you'll have to come up with a specific question in order
to get an answer.

Mike
