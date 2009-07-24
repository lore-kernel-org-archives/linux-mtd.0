Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MUEUx-0006SQ-H3
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 06:43:24 +0000
Message-ID: <4A695819.7000705@nokia.com>
Date: Fri, 24 Jul 2009 09:43:37 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Charles Manning <manningc2@actrix.gen.nz>
Subject: Re: UBIFS robustness questions
References: <200907241600.54640.manningc2@actrix.gen.nz>
In-Reply-To: <200907241600.54640.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles Manning wrote:
> This is probably documented somewhere but I could not find it...
> 
> What operations in UBIFS are robust to power failure and which are not?

Only sync operations guarantee that changes have reached the flash.
There are all the usual ways to sync:
	fsync/fdatasync a file/directory
	open a file as synchronous
	mark a file with the sync flag
	sync the filesystem
	mount the file system as synchronous

> I know for example that writing a file into flash does not mean it has been 
> completely written to flash until after a sync, but what about other 
> operations such as mv?

After mv, the containing directory must be sync'd to be sure the change reaches the
flash.  But rename is atomic so there will always be either the old
naming or the new naming

> The reasonn I'm asking this is that I want to be able to "hot-swap" a 
> directory of files without losing any file state.

Should be no problem if you sync correctly.

> What I'm considerings doing is something like:
> 
> Start with ~/runtime having a sane set of files
> 
> untar etc into ~/updated
> sync
> mv ~/updated ~/run-time
> sync
> 
> What is unacceptable is that, at any time, a power failure/reboot results in 
> ~/runtime having a non-sane set of files.
> 
> * Does the above sequence look safe?

Yes

> * Is the second sync required?

It is required to guarantee that the mv has reached the flash at that
point in time i.e. power loss before the second sync => same as if mv
was not done
