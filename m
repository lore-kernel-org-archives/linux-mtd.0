Received: from asbestos.brocade.com ([63.121.140.244] helo=mail.brocade.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 150qhG-0003L7-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 May 2001 21:18:02 +0100
Message-ID: <3B058523.2060107@brocade.com>
Date: Fri, 18 May 2001 13:25:07 -0700
From: Amit D Chaudhary <amitc@brocade.com>
MIME-Version: 1.0
To: Xavier DEBREUIL <xde@inventel.fr>
CC: linux-mtd@lists.infradead.org
Subject: Re: how to make
References: <3B01495C.A7CC459A@inventel.fr>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

You sure you have MTD* enabled in your .config?
Please send more information next time including .config, make output, etc.

Amit


Xavier DEBREUIL wrote:

> I got the 20010306 version working on my board and now I would like to use jffs2
> ; so, I got the last source version from the cvs access from yesterday and copy
> necessary files in my kernel tree ; then make clean, xconfig, and Image but it
> does not compile mtdchar or mtdblock and nothing in fact. I am using the
> 2.4.0-test6 kernel. Did I miss something obvious ?
> Do I have to modify Makefiles by hand ?
> 
> Xavier
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
