Date: Sat, 11 Dec 2004 21:31:35 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0412111816440.15928@phoenix.infradead.org>
Message-ID: <Pine.LNX.4.58.0412112129090.9791@localhost.localdomain>
References: <E1CdAeF-0007RX-Fq@phoenix.infradead.org>
	<1102788349.7231.0.camel@localhost.localdomain>
	<Pine.LNX.4.58.0412111816440.15928@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: mtd/fs/jffs3 jffs3.h, 3.1, NONE jffs3_fs_i.h, 3.1, NONE
 jffs3_fs_sb.h, 3.1, NONE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 11 Dec 2004, Artem B. Bityuckiy wrote:
> > No. Keep it in the fs/jffs3 directory not in include/linux/
> >
> Ok, but just interesting why? 

It's private to the file system. It doesn't need to live in include/linux 
where other people can see it. The only reason we _used_ to put them 
there is because of the inode and superblock unions. 

There _was_ a reason I moved it out of include/linux/ in the first place.

-- 
dwmw2
