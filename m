Received: from pop.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hg3aU-0008LT-Oa
	for linux-mtd@lists.infradead.org; Mon, 23 Apr 2007 14:48:36 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: Wanted - simple NOR Flash filing system
Date: Tue, 24 Apr 2007 06:55:37 +1200
References: <loom.20070423T132454-397@post.gmane.org>
In-Reply-To: <loom.20070423T132454-397@post.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200704240655.37619.manningc2@actrix.gen.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 23 April 2007 23:34, MikeW wrote:
> For storing a few tens/hundreds of bytes of configuration data,
> in a handful of files (no subdirs), read access 99.99%,
> write/update once or twice in life of the system.
> Fits into single erase block ideally, so might need to hold data in RAM
> pending erase - if ever filled the block !
>
> Any suggestions ?

It is far too grand to call this a file system. 
This is a bit more like a linear file store, or even more proimitive than 
that.

I agree with the basic principle: if you don't need a full fs, then why use 
one? You don't need a chainsaw to cut butter!

I have done stuff like this numerous times, but don't have any OSS code to 
release.

The last time I did this, I used a pretty simple system that just used records 
of the form:

Header byte
2 byte Length
Validity byte (0xFF not set up, 0x0F= in use, 0x03 = deleted
Name
data (length - (strlen(name) + 1 + 1 + 1))

With this mechanism you could only write a whole "file". No append/overwrite 
etc. Just rewrite the whole record.

To delete a file you just set the validity byte accordingly.

I had two blocks and when the one got full I would do "garbage collection", 
copying the valid "files" through to the new block. With one block you could 
store the stuff in RAM.

-- CHarles
