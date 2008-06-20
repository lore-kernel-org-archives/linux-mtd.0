Received: from mta-w2.tc.umn.edu ([134.84.119.6])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K9jOj-0003k5-Tt
	for linux-mtd@lists.infradead.org; Fri, 20 Jun 2008 16:23:38 +0000
Date: Fri, 20 Jun 2008 09:22:50 -0700
Subject: Re: mkfs.jffs2: creating dirs in /
From: Grant Erickson <erick205@umn.edu>
To: Mike Frysinger <vapier.adi@gmail.com>
Message-ID: <C481276A.FE21%erick205@umn.edu>
In-Reply-To: <8bd0f97a0806200828u2aefc887n37cb48b4cf75528b@mail.gmail.com>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/20/08 8:28 AM, Mike Frysinger wrote:
> with older mtd-utils, creating a directory in the root worked fine.
> with current git, the parent dir search algo breaks this.
> 
> for example, just take the current git tree, build it up, and then run:
> $ ./mkfs.jffs2 -d . -D device_table.txt -o /dev/null
> mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
> mkfs.jffs2: skipping device_table entry '/dev/mem': no parent directory!
> ...
> doing `mkdir dev` first works around the issue, but where's the fun in that.
> 
> locally i just made the change to interpret_table_entry() where it
> looks to see if the dir is "/" and if so, uses "root" rather than
> calling find_filesystem_entry(), but i dont think that's the right
> long term fix.  i pondered the find_filesystem_entry() function for a
> while, but the closest i found was to delete the first if statement
> and then tweak the fullname[len] ...
> -mike

Mike,

I just submitted several patches earlier last week to fix what appears to be
a similar issue:

See:

    http://lists.infradead.org/pipermail/linux-mtd/2008-June/021997.html
    http://lists.infradead.org/pipermail/linux-mtd/2008-June/022008.html
    http://lists.infradead.org/pipermail/linux-mtd/2008-June/022058.html

Have you picked/merged up these changes from GIT?

Regards,

Grant
