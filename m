Received: from tac.ki.iif.hu ([2001:738:0:401:20c:6eff:fe71:b2db])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NuAyk-0000Ks-TD
	for linux-mtd@lists.infradead.org; Tue, 23 Mar 2010 20:45:35 +0000
From: Ferenc Wagner <wferi@niif.hu>
To: Phillip Lougher <phillip.lougher@gmail.com>
Subject: Re: RFC: direct MTD support for SquashFS
References: <87vdcwv139.fsf@tac.ki.iif.hu>
	<87ljdsibqe.fsf@macbook.be.48ers.dk> <87r5nhziss.fsf@tac.ki.iif.hu>
	<bffbecbb1003181440kc78f4dbvd25d4e2ea17b52e5@mail.gmail.com>
Date: Tue, 23 Mar 2010 21:45:19 +0100
In-Reply-To: Ferenc Wagner's message of "Tue\, 23 Mar 2010 12\:35\:02 +0100"
Message-ID: <874ok6py1s.fsf@tac.ki.iif.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Phillip Lougher <phillip@lougher.demon.co.uk>,
	linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Wagner <wferi@niif.hu> writes:

> I've got one more patch, which I forgot to export, to pull out the
> common logic from the backend init functions back into squashfs_read_data().
> With the bdev backend, that entails reading the first block twice in a
> row most of the time.  This again could be worked around by extending
> the backend interface, but I'm not sure if it's worth it.

Here it is.  I also corrected the name of SQUASHFS_METADATA_SIZE, so it
may as well compile now.
-- 
Regards,
Feri.
