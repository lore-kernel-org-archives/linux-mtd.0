Received: from albatross-ext.wise.edt.ericsson.se ([193.180.251.46] helo=albatross.wise.edt.ericsson.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ic0N-0003NG-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2002 14:02:55 +0000
Message-ID: <3C862429.9A987803@etx.ericsson.se>
Date: Wed, 06 Mar 2002 15:14:01 +0100
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Adam Wozniak <awozniak@comdev.cc>, linux-mtd@lists.infradead.org,
   jffs-dev@axis.com
Subject: Re: MTD CVS update: 'mtd/fs/jffs2 gc.c'
References: <Pine.LNX.4.33.0203050807490.15380-100000@rangers.comdev.cc> <1254.1015352039@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

Nice now we behinde a http only firewall can get to it also. 

Who are you using as parent for the bk tree??


David Woodhouse wrote:
> 
> awozniak@comdev.cc said:
> >  Are these changes that need to make it into the 2_4_branch ?
> 
> I've imported one more change onto the jffs2-2_4-branch and also made a
> public BK repository for it, including the shared-zlib stuff.
> 
> http://linux-mtd.bkbits.net/
> 
> The shared zlib patch is at ftp.XX.kernel.org:/pub/linux/kernel/people/dwmw2
> and should apply to the 2.4 kernel with or without the few changes which
> have been made since I updated Marcelo's tree to the jffs2-2_4-branch.
> 
> The trunk ought to be working though, and testing would be appreciated.
> 
> --
> dwmw2
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Kenneth Johansson	
Ericsson AB                       Tel: +46 8 404 71 83
Viderögatan 3                     Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@etx.ericsson.se
