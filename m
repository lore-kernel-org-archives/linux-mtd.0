Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dxOP-00045e-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 17:52:29 +0000
Message-ID: <3C753577.FFD9EF97@comdev.cc>
Date: Thu, 21 Feb 2002 09:59:19 -0800
From: Adam Wozniak <adam.wozniak@comdev.cc>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: M T D C V S update: 'mtd/fs/jffs2 dir.c'
References: <3C7532E3.A87EC45B@comdev.cc>  <E16dxIT-0006R0-00@infradead.org> <684.1014314167@redhat.com>
Content-Type: text/plain; charset=us-ascii
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

David Woodhouse wrote:
> adam.wozniak@comdev.cc said:
> >  Are you still recommending the jffs2-2_4-branch over the main branch
> > for production code?
> 
> Yes. Especially as I just merged the NAND work onto the main branch. :)
> 
> Are you volunteering to merge the occasional bug fix (like this one) onto
> the jffs2-2_4-branch for me when I forget? :)

I don't think I have enough time.  I'm also not convinced I understand
all the subtleties involved in this.

I'm not convinced the recent scan.c bugfix found its way into
jffs2-2_4-branch

Is there anything (else?) missing from the jffs2-2_4-branch ???

--Adam
-- 
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      805 Aerovista Place, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
