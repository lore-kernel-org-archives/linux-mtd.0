Received: from ldap.somanetworks.com ([216.126.67.42]
	helo=mail.somanetworks.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bpdzl-0005c1-1V
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2004 22:16:42 -0400
Received: from unknown (HELO [142.150.241.8]) (ben@[142.150.241.8])
	(envelope-sender <ben@somanetworks.com>)
	by gw-yyz.somanetworks.com (qmail-ldap-1.03) with RC4-MD5 encrypted
	SMTP for <linux-mtd@lists.infradead.org>; 28 Jul 2004 02:16:39 -0000
Message-ID: <41070C86.4060608@somanetworks.com>
Date: Tue, 27 Jul 2004 22:16:38 -0400
From: Ben Gamsa <ben@somanetworks.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: jffs2 deadlock on alloc_sem in jffs2_reserve_space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We're having very intermittent problems with lockups while deleting
files under JFFS2.  We're running the 20040603 CVS snapshot applied to
the 2.4.26-vrs1 arm-linux tree.  It's hard to reproduce, so we've not
been able to collect much debugging information.  In particular, it never
happens when we have debugging traces on.  We did manage to capture
one case where it locked up and we were able to get process stack
traces of all of the processes in the system.  From those traces it
appears that only the process doing the unlink was in JFFS2 at the
time, so it doesn't appear to be a simple deadlock.  The process that
was doing the unlink was stuck doing a down on alloc_sem in
jffs2_reserve_space.  Since no one else appeared to be holding the
semaphore (although perhaps it could be held across calls), it seemed
possible that perhaps the semaphore wasn't being released by some
previous caller, possibly on some error path.  The only obvious case
was at the end of jffs2_garbage_collect_pass:

	f = jffs2_gc_fetch_inode(c, inum, nlink);
	if (IS_ERR(f))
		return PTR_ERR(f);
	if (!f)
		return 0;

	ret = jffs2_garbage_collect_live(c, jeb, raw, f);

	jffs2_gc_release_inode(c, f);

  release_sem:
	up(&c->alloc_sem);

It seems that if there is an error in jffs2_gc_fetch_inode, the
function could return without releasing the semaphore.  Is this a
bug, or is there more to this error case than meets the eye?  And
is it at all likely that we could have hit this error case?

-- 
Ben Gamsa             ben@somanetworks.com
SOMA Networks, Inc.   312 Adelaide St. W. Suite 700 Toronto, Ontario, M5V1R2
