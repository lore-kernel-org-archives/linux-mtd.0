Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Ilo3-0003fU-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 08:47:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001101c21377$9331b6e0$0100a8c0@ester> 
References: <001101c21377$9331b6e0$0100a8c0@ester>  <20020614065541.18847.qmail@web21506.mail.yahoo.com> 
To: "Krypton" <krypton8@inwind.it>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Howto create a new jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Jun 2002 08:47:37 +0100
Message-ID: <18018.1024040857@redhat.com>
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

krypton8@inwind.it said:
> > what is the output of "ls -l /dev/mtd*" ?
> 
> No such file or directory 

Run the MAKEDEV script from the util/ directory of CVS.

--
dwmw2
