Received: from mailer.cse.iitd.ac.in ([202.141.68.3]
	helo=desh.cse.iitd.ernet.in)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D4Jvz-00075f-4s
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2005 09:25:46 -0500
Message-ID: <421DD992.60304@kritikalsolutions.com>
Date: Thu, 24 Feb 2005 19:11:38 +0530
From: Narinder Kumar <narinder@kritikalsolutions.com>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@infradead.org>,
	linux-mtd@lists.infradead.org
References: <4219E20F.80908@kritikalsolutions.com>
	<1108994310.13420.50.camel@sauron.oktetlabs.ru>
	<4219EDC3.1060506@kritikalsolutions.com>
	<1108999278.16852.46.camel@fuzzie.sanpeople.com>
	<421D8C23.2000200@kritikalsolutions.com>
	<Pine.LNX.4.58.0502241318300.5525@phoenix.infradead.org>
In-Reply-To: <Pine.LNX.4.58.0502241318300.5525@phoenix.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

          I have finally mounted my dataflash's jffs2 partition. The 
problem was that the driver of dataflash was taking page size in erase 
size function (which was 1056 bytes) and mkfs.jffs2 takes the block 
size. So i changed the erasesize in the driver to be block size which is 
8 * page_size i,e ( 8 *1056) and then i mounted my device and it mounted 
without any errors.

Thanx to all
Narinder


Artem B. Bityuckiy wrote:

>Please, erase your flash then mount *empty* flash. Then type 'dmesg'. You 
>should find the information about the block size implied by JFFS2 there.
>
>--
>Best Regards,
>Artem B. Bityuckiy,
>St.-Petersburg, Russia.
>
>
>.
>
>  
>
