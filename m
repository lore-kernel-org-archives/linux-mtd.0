Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fN6y-0003Np-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 15:32:20 +0000
Date: Mon, 25 Feb 2002 07:38:56 -0800 (PST)
From: Adam Wozniak <awozniak@comdev.cc>
To: David Woodhouse <dwmw2@infradead.org>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: MTD CVS update: 'mtd/fs/jffs2 dir.c file.c write.c'
In-Reply-To: <E16fIKq-0000w3-00@infradead.org>
Message-ID: <Pine.LNX.4.33.0202250738270.28327-100000@rangers.comdev.cc>
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

On Mon, 25 Feb 2002, David Woodhouse wrote:
> Update of /home/cvs/mtd/fs/jffs2
> In directory infradead.org:/tmp/cvs-serv3585
>
> Modified Files:
> 	dir.c file.c write.c
> Log Message:
> Obey the new rule that you must still be holding the alloc_sem when adding nodes to the lists and hence obsoleting other nodes
>

Should these wind up in the 2_4 branch as well?

--Adam
-- 
Adam Wozniak (KG6GZR)   COM DEV Broadband - Digital and Software Systems
awozniak@comdev.cc      805 Aerovista Place, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
