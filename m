Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Ba7nj-0001tZ-8I
	for linux-mtd@lists.infradead.org; Tue, 15 Jun 2004 02:52:11 -0400
Message-ID: <34463.160.114.55.5.1087282322.squirrel@webmail.inf.u-szeged.hu>
In-Reply-To: <40CDACF2.5040502@yandex.ru>
References: <40CD76C2.1080007@inf.u-szeged.hu> <40CDACF2.5040502@yandex.ru>
Date: Tue, 15 Jun 2004 08:52:02 +0200 (CEST)
From: "Ferenc Havasi" <havasi@inf.u-szeged.hu>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: (NAND) JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

> Are your ideas about decreasing mount time secret? I'm also
> trying to optimize it a bit. Its interesting what way did you choose

No secret. (I hope your one is also no secret, so we may contiue this
conversation on this mailing list) I found some previos conversation about
it in the archives, too...

About our idea/plan: we would like to modify the mkfs and umount porcess
to store some extra information (inode_cache). At booting time it is
enough to read this information to serve the read requests, and the full
scan process can be done in the background. Write requestes should be
blocked until this background process finished. If I am right handeld
devices (but at least the Familiar distribution) uses RAM filesystem for
/tmp and /var, so the boot process hopefully does not require write
access.

Certainly, if this information cannot be found or not valid (there was no
umount) the original slow full scan method should be processed.

One possible idea to store this information can be to introduce new types
of node (with JFFS2_FEATURE_RWCOMPAT_DELETE bitmask). One type to store
the real information (inode_cache) and an other which is stored on the
first erase block and contains direct pointers to the previous kind of
nodes/its eraseblocks. (make it easy for the mount process to find them)

What are your ideas? Did you tried out them?

We did not tried this yet, but I hope it is feasable. (David?)

Regards,
Ferenc
