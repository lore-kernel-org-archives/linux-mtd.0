Received: from femail18.sdc1.sfba.home.com ([24.0.95.145])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15HsH9-0003hU-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jul 2001 20:25:27 +0100
Message-ID: <3B436F22.2D42C70F@asu.edu>
Date: Wed, 04 Jul 2001 12:31:46 -0700
From: Russ Dill <Russ.Dill@asu.edu>
MIME-Version: 1.0
To: Frederic Giasson <fgiasson@mediatrix.com>,
 	linux-mtd@lists.infradead.org
Subject: Re: Boot loader that understands JFFS2
References: <F1BED55F35F4D3118C0F00E0295CFF4D99550D@webmail.mediatrix.com>
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

Frederic Giasson wrote:
> 
> Hi David,
> 
> Do you know if there is a boot loader that understands JFFS2 so it could
> read a JFFS2-compressed image stored in the filesystem itself?  I made some
> search and I didn't find anything that convinced me that it has been
> written.
> 
> Thanks!
> 
> Frédéric Giasson
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

general code to boot cramfs/jffs2
http://lists.arm.linux.org.uk/pipermail/linux-arm/2001-June/001523.html

patch against blob
http://www.lart.tudelft.nl/list/list.php3?arc=lart&sd=1&sm=6&sy=2001&ed=30&em=6&ey=2001&sort=t&inl=&mid=3B2FB1AB.35FF17DD%40asu.edu#body

btw, don't cc david when you mail the mtd mailing list, I'm sure he is
subscribed
