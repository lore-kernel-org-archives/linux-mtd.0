Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D7AHL-0008UI-CQ
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2005 05:43:33 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1D7AC8-0006nj-2S
	for linux-mtd@lists.infradead.org; Fri, 04 Mar 2005 11:38:08 +0100
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2005 11:38:08 +0100
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2005 11:38:08 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Fri, 04 Mar 2005 11:43:04 +0100
Message-ID: <d09dq6$lgu$1@sea.gmane.org>
References: <d01lkf$v0d$1@sea.gmane.org> <d04hdb$8k1$1@sea.gmane.org>
	<4225DCA2.AFBE689F@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <4225DCA2.AFBE689F@st.com>
Sender: news <news@sea.gmane.org>
Subject: Re: Cannot remove child "XXX", ino #13, because it doesn't exist
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>>>After removing a directory containing a lot of files, I get lots of the
>>>following messages on reboot (one for each of the files I removed):
>>>Cannot remove child "file10.txt", ino #13, because it doesn't exist
> This might happen when the deletion dirent for the directory
> is found, but the deletion dirent for the files are not found
> (which should not happen during ordinary operation).
> Exactly what command (or code) did you use to remove the file and
> directory ? 
I used busybox's "rm" like:

rm -rf directory

 > Did you umount correctly after that ?
I did a "sync"...

> Do you really get this message for each and every deleted file
> or only part of them ?
Scanning the list, I now see that this message comes "only" for 298 out 
of 999 files...

>>The problem arose after creating a directory in my JFFS2 NAND fs, and
>>creating some 1000 (small) files in it. After rebooting I removed the
>>entire directory, and at the next reboot I got the error.
> This message is a notice. It should not prevent JFFS2 from running.
> The directory and the files are considered as deleted.
The system _is_ running - I'm just a little worried about the messages...

> Just out of curiosity, do you get these messages
> "Eep. Child "fileXXXX" (ino #XXX) of dir ino #XX doesn't exist!"
 > previously to the "Cannot remove..." messages ?
Yes! I actually do - I just didn't notice due to the sever amount of 
messages (and the limited buffer of my terminal window)...

=== 8< 8< 8< ===
Eep. Child "file38.txt" (ino #41) of dir ino #3 doesn't exist!
Eep. Child "file39.txt" (ino #42) of dir ino #3 doesn't exist!
Inode #3 was a directory with children - removing those too...
=== 8< 8< 8< ===
Cannot remove child "file38.txt", ino #41, because it doesn't exist
Cannot remove child "file39.txt", ino #42, because it doesn't exist
Inode #5014 was a directory with children - removing those too...

> If you don't, it might be interesting to get a trace with
> debug enabled since the child inode cache should not disappear
> between the build_inode_pass1 and remove_unlinked_inode.
So now that I _do_ get those - should I worry? Can I do anything to make 
the message disappear...
I'm little worried that it says "removing those too...", but when I 
reboot, the messages are back again?!

BR,
  Martin
