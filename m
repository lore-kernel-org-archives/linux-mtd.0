Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iHJ6-0001vY-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2002 15:56:52 +0000
Date: Tue, 5 Mar 2002 08:08:13 -0800 (PST)
From: Adam Wozniak <awozniak@comdev.cc>
To: David Woodhouse <dwmw2@infradead.org>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: MTD CVS update: 'mtd/fs/jffs2 gc.c'
In-Reply-To: <E16iAt7-0005Jp-00@infradead.org>
Message-ID: <Pine.LNX.4.33.0203050807490.15380-100000@rangers.comdev.cc>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 5 Mar 2002, David Woodhouse wrote:
> Update of /home/cvs/mtd/fs/jffs2
> In directory infradead.org:/tmp/cvs-serv20435
>
> Modified Files:
> 	gc.c
> Log Message:
> iput if interrupted waiting for alloc_sem, more printks

Are these changes that need to make it into the 2_4_branch ?

--Adam
-- 
Adam Wozniak (KG6GZR)   COM DEV Broadband - Digital and Software Systems
awozniak@comdev.cc      805 Aerovista Place, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
