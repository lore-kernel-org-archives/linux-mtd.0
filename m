Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O4yCn-00057I-FN
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2010 15:20:42 +0000
Date: Thu, 22 Apr 2010 17:20:23 +0200
From: Jan Kara <jack@suse.cz>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: Do not corrupt backing device for inode
Message-ID: <20100422152023.GD5805@quack.suse.cz>
References: <20100415172300.GF3561@quack.suse.cz>
	<1271863269-5423-1-git-send-email-kirill@shutemov.name>
	<1271934535.11751.1550.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1271934535.11751.1550.camel@macbook.infradead.org>
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	Alexander Shishkin <virtuoso@slind.org>, linux-mtd@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	"Kirill A. Shutemov" <kirill@shutemov.name>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu 22-04-10 12:08:55, David Woodhouse wrote:
> On Wed, 2010-04-21 at 18:21 +0300, Kirill A. Shutemov wrote:
> > +		/*
> > +		 * We cannot modify file->f_mapping->backing_dev_info directly,
> > +		 * because it will corrupt backing device for inode, since
> > +		 * inode->i_mapping is equal to file->f_mapping. So we have to
> > +		 * copy f_mapping first.
> > +		 */
> > +		file->f_mapping = kmalloc(sizeof(*file->f_mapping), GFP_KERNEL);
> > +		memcpy(file->f_mapping, inode->i_mapping,
> > +				sizeof(*file->f_mapping));
> >  		file->f_mapping->backing_dev_info = mtd->backing_dev_info;
> > +	}
> 
> Ick. What about the rest of file->f_mapping? That'll still be inherited.
> 
> Jan pointed at drivers/char/raw.c as an example, but that doesn't do
> anything as ugly as this -- that sets file->f_mapping to point at
> bdev->bd_inode->i_mapping instead.
> 
> I suspect we should do something similar -- have an inode for the MTD
> device, with a valid i_data of its own.
  Yes, that's what I meant by my suggestion... Sorry if I wasn't clear
enough.

								Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR
