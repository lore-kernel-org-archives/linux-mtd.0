Received: from alias5.ihug.co.nz ([203.96.222.15])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gqz7z-00082i-4f
	for linux-mtd@lists.infradead.org; Sun, 03 Dec 2006 16:44:06 -0500
From: "Gavin Lambert" <gavinl@compacsort.com>
To: <dedekind@infradead.org>
Subject: RE: MTD pointer alignment
Date: Mon, 4 Dec 2006 10:43:21 +1300
Message-ID: <030e01c71724$1c4a95a0$4800a8c0@gavinlpc>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1164961120.576.79.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoth Artem Bityutskiy [dedekind@infradead.org]:
> On Wed, 2006-11-29 at 13:09 +1300, Gavin Lambert wrote:
>> Given that mtdchar assumes that it can mess with the low 2 bits of
>> the MTD pointer it keeps around with impunity, add_mtd_device in
>> mtdcore.c should probably refuse to add any MTD device pointer that
>> doesn't fall on a 4-byte boundary.
> 
> Hmm, I personally I do not understand what is this about.

In mtdchar.c, when an MTD character device is opened (mtd_open), its
pointer value is assigned to file->private_data.  All subsequent
operations then use the TO_MTD macro, which is defined as:

#define TO_MTD(file) (struct mtd_info *)((long)((file)->private_data) &
~3L)

(ie. masking off the lower two bits).  There's even a comment above that
those bits have been hijacked for OTP modes, and it's expecting that
alignment of the pointer is at least 32 bits.

While this is true for a standalone kalloc'd MTD structure, if the MTD
structure is embedded within another structure then it is not
necessarily the case.  Since struct mtd_info starts with a byte-sized
field, the default padding rules say that the structure as a whole is
allowed to start on a byte boundary (although on many arches it'll get
16-bit aligned regardless).  Hence the 32-bit alignment is most
definitely *not* guaranteed.

If you're going to hijack the bits then you should at the very least
test your assertion in either mtd_open or add_mtd_device, by making it
reject MTD devices that aren't aligned as you'd expect.  Otherwise it
leads to a whole raft of weird bugs.

As I said before, though, I'm looking at the MTD sources as of kernel
2.6.15.  It's possible this has been sorted out since then.  If so, I
apologise.
