Received: from dsl-dt-207-34-112-i157-cgy.nucleus.com ([207.34.112.157] helo=mail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16hLRF-0005BP-00
	for <linux-mtd@lists.infradead.org>; Sun, 03 Mar 2002 02:09:25 +0000
Received: (from rayl@localhost)
	by mail.com (8.11.2/8.11.2) id g232Kja21036
	for linux-mtd@lists.infradead.org; Sat, 2 Mar 2002 19:20:45 -0700
Date: Sat, 2 Mar 2002 19:20:45 -0700
From: Ray Lehtiniemi <rayl@otii.com>
To: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 question
Message-ID: <20020302192045.E14453@otii.com>
References: <20020302175237.C14453@otii.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20020302175237.C14453@otii.com>; from rayl@otii.com on Sat, Mar 02, 2002 at 05:52:37PM -0700
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

On Sat, Mar 02, 2002 at 05:52:37PM -0700, Ray Lehtiniemi wrote:

sorry to followup my own post:

> will only contain /sbin (assuming it's the first dirent in usr)
                                        ^
                                       not


also, i now think that the contents of the "missing" directory are included
in the image, they just do not show up under jffs2reader.

i recreated my toplevel tree, ensuring that the first dirent was a file,
not a directory.  now, all items show up just fine in the jffs2reader output,
but the jffs2 image is the same size as it was before.

so maybe it's just a problem with the reader?


thanks

-- 
---------------------------------------------------------------------------
    Ray Lehtiniemi <rayl@mail.com> <rayl@otii.com>
