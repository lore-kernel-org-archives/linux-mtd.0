Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8yuO-0003YK-ND
	for linux-mtd@lists.infradead.org; Wed, 09 Mar 2005 05:59:22 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
In-Reply-To: <d0jphc$re$1@sea.gmane.org>
References: <d0jphc$re$1@sea.gmane.org>
Content-Type: text/plain
Date: Wed, 09 Mar 2005 13:58:44 +0300
Message-Id: <1110365924.4353.3.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: martin@egholm-nielsen.dk
Subject: Re: Many small files instead of one large files - writing,
	wearing, mount-time?
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-03-08 at 09:59 +0100, Martin Egholm Nielsen wrote:
> Hi there,
Hello

> Hence, me initial strategy was to have a file in NAND for each resource. 
> However, I noticed that mount-time increased "severely" when many files 
> were put on the device, and doing an "ls" first time on the 
> device/directory took lots of time as well.
Owing to its design JFFS2 works extremely slowly wit directories
containing so many files.

> Unfortunately low mount-time is one of the factors giving the user a 
> good experience with the system, so I started considering another 
> strategy - namely one large file to hold all these states.
> 
> However, I'm a bit concerned how fopen( ..., "rw" ) is handled 
> underneith when I flush/sync the filedescriptor if I only mess with a 
> small part of the file. Is the entire file flushed to NAND once more, or 
> does Linux+JFFS2 handle this, and only write the parts (inodes) that are 
> affected...
Don't worry, Only that "messed" peace will be flushed. The "large file"
solution will be definitely faster.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
