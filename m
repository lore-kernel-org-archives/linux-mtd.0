Received: from lon-del-01.spheriq.net ([195.46.50.97])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6Vqe-0000eQ-1b
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2005 10:33:17 -0500
Received: from lon-out-01.spheriq.net ([195.46.50.129])
	by lon-del-01.spheriq.net with ESMTP id j22FXBor024780
	for <linux-mtd@lists.infradead.org>; Wed, 2 Mar 2005 15:33:11 GMT
Received: from lon-cus-01.spheriq.net (lon-cus-01.spheriq.net [195.46.50.37])
	by lon-out-01.spheriq.net with ESMTP id j22FXA0w008171
	for <linux-mtd@lists.infradead.org>; Wed, 2 Mar 2005 15:33:11 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <4225DCA2.AFBE689F@st.com>
Date: Wed, 02 Mar 2005 16:32:50 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
References: <d01lkf$v0d$1@sea.gmane.org> <d04hdb$8k1$1@sea.gmane.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Cannot remove child "XXX", ino #13, because it doesn't exist
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Martin Egholm Nielsen wrote:
> 
> Hi again,
> 
> > After removing a directory containing a lot of files, I get lots of the
> > following messages on reboot (one for each of the files I removed):
> 
> > Cannot remove child "file10.txt", ino #13, because it doesn't exist

This might happen when the deletion dirent for the directory
is found, but the deletion dirent for the files are not found
(which should not happen during ordinary operation).
Exactly what command (or code) did you use to remove the file and
directory ? Did you umount correctly after that ?
Do you really get this message for each and every deleted file
or only part of them ?

> The problem arose after creating a directory in my JFFS2 NAND fs, and
> creating some 1000 (small) files in it. After rebooting I removed the
> entire directory, and at the next reboot I got the error.

This message is a notice. It should not prevent JFFS2 from running.
The directory and the files are considered as deleted.

Just out of curiosity, do you get these messages
"Eep. Child "fileXXXX" (ino #XXX) of dir ino #XX doesn't exist!"
previously to the "Cannot remove..." messages ?
If you don't, it might be interesting to get a trace with
debug enabled since the child inode cache should not disappear
between the build_inode_pass1 and remove_unlinked_inode.

Bye
Estelle
