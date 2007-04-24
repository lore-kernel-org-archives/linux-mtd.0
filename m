Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HgNV5-0007tT-5D
	for linux-mtd@lists.infradead.org; Tue, 24 Apr 2007 17:04:21 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HgNUu-0007vm-QH
	for linux-mtd@lists.infradead.org; Tue, 24 Apr 2007 18:04:08 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Apr 2007 18:04:08 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Apr 2007 18:04:08 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: Wanted - simple NOR Flash filing system
Date: Tue, 24 Apr 2007 16:03:53 +0000 (UTC)
Message-ID: <loom.20070424T174804-792@post.gmane.org>
References: <loom.20070423T132454-397@post.gmane.org>
	<200704240655.37619.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles Manning <manningc2 <at> actrix.gen.nz> writes:

> 
> On Monday 23 April 2007 23:34, MikeW wrote:
> > For storing a few tens/hundreds of bytes of configuration data,
> > in a handful of files (no subdirs), read access 99.99%,
> > write/update once or twice in life of the system.
> > Fits into single erase block ideally, so might need to hold data in RAM
> > pending erase - if ever filled the block !
> >
> > Any suggestions ?
> 
> It is far too grand to call this a file system. 
> This is a bit more like a linear file store, or even more proimitive than 
> that.
> 
> I agree with the basic principle: if you don't need a full fs, then why use 
> one? You don't need a chainsaw to cut butter!
> 
> I have done stuff like this numerous times, but don't have any OSS code to 
> release.
> 
> The last time I did this, I used a pretty simple system that just used records 
> of the form:
> 
> Header byte
> 2 byte Length
> Validity byte (0xFF not set up, 0x0F= in use, 0x03 = deleted
> Name
> data (length - (strlen(name) + 1 + 1 + 1))
> 
> With this mechanism you could only write a whole "file". No append/overwrite 
> etc. Just rewrite the whole record.
> 
> To delete a file you just set the validity byte accordingly.
> 
> I had two blocks and when the one got full I would do "garbage collection", 
> copying the valid "files" through to the new block. With one block you could 
> store the stuff in RAM.
> 

Thanks - I have certainly thought before about implementing
such a simple scheme,
but I was wondering if there was already an tested 'off-the'shelf'
set of code since it seems to be such a basic requirement if you don't
want or need JFFS2 size, functionality or overhead.

I have had a direct email (imcd) suggesting storing a tar file directly in
the /dev/mtd, but would prefer that any 'driver' was self-sufficient
so it could potentially be used before kernel boot.
"tarfs", anyone ?

>> (from imcd)
Save:
 tar cz -f /dev/mtdblock/1 -C dir .

Load:
 tar xz -f /dev/mtdblock/1 -C dir
<<

For now I have made do with a single block romfs device created 'offline',
though in principle I could create the required files in /tmp and then
load them into the erased flash block using genromfs.

Regards,
MikeW
