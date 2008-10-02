Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KlNia-00031f-DQ
	for linux-mtd@lists.infradead.org; Thu, 02 Oct 2008 12:55:44 +0000
Date: Thu, 2 Oct 2008 13:55:32 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: UBIFS sync question
Message-ID: <20081002125529.GA29028@shareable.org>
References: <OFD58EAD0A.B5E12235-ON882574D4.007AC780-882574D4.007B6DB9@selinc.com>
	<1222839603.8051.16.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1222839603.8051.16.camel@sauron>
Cc: linux-mtd@lists.infradead.org, Bruce_Leonard@selinc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> However, if you open a file, and just add few lines to it, then it
> should not become empty after reboot. You should just loose whole or
> part of new data.
> 
> I think you actually truncate the file, then re-write it, instead of
> appending. This often happens in case of shell scripts - shell commands
> like truncating files.

Generally when updating a file, then I write a new file under a
temporary name in the same directory, then fsync() the new file, then
rename() it over the original file, then fsync() the containing
directory.

That should be safe for any change to the file contents.  After boot
during this process, you should see the old contents or the new
contents, nothing else.  After the second fsync(), you should be
confident that any subsequent boot will always see the new contents.

O_APPEND should be ok too and is essential for log files, but there's
always a danger than after a boot in the middle of the update, you'll
see half the write.

-- Jamie
