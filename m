Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ic69-0003No-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 14:08:53 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C862429.9A987803@etx.ericsson.se> 
References: <3C862429.9A987803@etx.ericsson.se>  <Pine.LNX.4.33.0203050807490.15380-100000@rangers.comdev.cc> <1254.1015352039@redhat.com> 
To: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
Cc: Adam Wozniak <awozniak@comdev.cc>, linux-mtd@lists.infradead.org,
    jffs-dev@axis.com
Subject: Re: MTD CVS update: 'mtd/fs/jffs2 gc.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 06 Mar 2002 14:17:03 +0000
Message-ID: <31058.1015424223@redhat.com>
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
> Nice now we behinde a http only firewall can get to it also. 
> Who are you using as parent for the bk tree?? 

For 2.4, I'm using Jeff Garzik's marcelo-2.4 tree. 
	http://gkernel.bkbits.net:8080/marcelo-2.4

For 2.5, obviously I'll be using Linus' tree. I've just about made the 
CVS trunk work in both 2.4 and 2.5, so I'll be making my 2.5 tree 
actually _differ_ from Linus' one some time today.

--
dwmw2
