Received: from ernst.netinsight.se ([212.247.11.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JuS8F-0005hO-AP
	for linux-mtd@lists.infradead.org; Fri, 09 May 2008 12:55:27 +0000
Message-ID: <482449AD.405@users.sourceforge.net>
Date: Fri, 09 May 2008 14:55:09 +0200
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: James <jamessteward@optusnet.com.au>
Subject: Re: New thread [BUG] JFFS2 usage of write_begin and
	write_end	functions causes kernel panic
References: <1210312276.28139.19.camel@Ubuntu-Desktop>
In-Reply-To: <1210312276.28139.19.camel@Ubuntu-Desktop>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

James wrote:
> Did the change suggested here
> http://lists.infradead.org/pipermail/linux-mtd/2008-April/021473.html
> help?

It avoids a panic if you have set panic-on-oops but the write operation fails
for the application. write(2) returning a short write count is what I saw.

Anders
