Received: from yx-out-1718.google.com ([74.125.44.157])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K9iXs-0003zB-0h
	for linux-mtd@lists.infradead.org; Fri, 20 Jun 2008 15:29:00 +0000
Received: by yx-out-1718.google.com with SMTP id 6so306621yxn.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 Jun 2008 08:28:58 -0700 (PDT)
Message-ID: <8bd0f97a0806200828u2aefc887n37cb48b4cf75528b@mail.gmail.com>
Date: Fri, 20 Jun 2008 11:28:57 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: mkfs.jffs2: creating dirs in /
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

with older mtd-utils, creating a directory in the root worked fine.
with current git, the parent dir search algo breaks this.

for example, just take the current git tree, build it up, and then run:
$ ./mkfs.jffs2 -d . -D device_table.txt -o /dev/null
mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
mkfs.jffs2: skipping device_table entry '/dev/mem': no parent directory!
...
doing `mkdir dev` first works around the issue, but where's the fun in that.

locally i just made the change to interpret_table_entry() where it
looks to see if the dir is "/" and if so, uses "root" rather than
calling find_filesystem_entry(), but i dont think that's the right
long term fix.  i pondered the find_filesystem_entry() function for a
while, but the closest i found was to delete the first if statement
and then tweak the fullname[len] ...
-mike
