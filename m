Received: from mta6-svc.virgin.net ([62.253.164.46])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 165vBq-0000ho-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Nov 2001 20:38:50 +0000
Received: from virgin.net ([62.252.101.132]) by mta6-svc.virgin.net
          (InterMail vM.4.01.02.27 201-229-119-110) with ESMTP
          id <20011119204921.ERBT289.mta6-svc.virgin.net@virgin.net>
          for <linux-mtd@lists.infradead.org>;
          Mon, 19 Nov 2001 20:49:21 +0000
Message-ID: <3BF97017.B80B3DC1@virgin.net>
Date: Mon, 19 Nov 2001 20:48:23 +0000
From: dave <david.harris18@virgin.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Help
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Does the following error message mean anything to anyone?
(I don't belong to this mailing list as yet so please reply direct)

flashcard: erase failed, status 0xffff
and then I have to reboot

I have a DOC1000 with all the right patches to 2.4.9.
And the erase ioctl returns this.

I can read from it using dd.
But writes fail with similar results.
