Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dxH1-00044v-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 17:44:51 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C7532E3.A87EC45B@comdev.cc> 
References: <3C7532E3.A87EC45B@comdev.cc>  <E16dxIT-0006R0-00@infradead.org> 
To: Adam Wozniak <adam.wozniak@comdev.cc>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD CVS update: 'mtd/fs/jffs2 dir.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 21 Feb 2002 17:56:07 +0000
Message-ID: <684.1014314167@redhat.com>
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

adam.wozniak@comdev.cc said:
> > Modified Files:
> >         dir.c
> > Log Message:
> > Don't allow linking directories.

>  Are you still recommending the jffs2-2_4-branch over the main branch
> for production code? 

Yes. Especially as I just merged the NAND work onto the main branch. :)

Are you volunteering to merge the occasional bug fix (like this one) onto 
the jffs2-2_4-branch for me when I forget? :)

--
dwmw2
