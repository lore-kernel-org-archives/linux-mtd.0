Received: from tiger.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195Cqj-00078J-8J
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 23:54:53 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Thomas Cameron" <tom@ceisystems.com>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 15 Apr 2003 10:55:34 +1200
References: <6D31D5429FA6884CBE9ECAB6C9B5E6A9444D@intel-srvr.patcameron.ne.mediaone.net>
In-Reply-To: <6D31D5429FA6884CBE9ECAB6C9B5E6A9444D@intel-srvr.patcameron.ne.mediaone.net>
MIME-Version: 1.0
Message-Id: <20030414225454.A45C54340@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Which is simpler...
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 Apr 2003 01:05, Thomas Cameron wrote:
> Hello all,
>
> 	I have been working on a project recently, which uses a
> DiskOnChip for storage.  However, I have had a number of problems
> getting the DOC to work as I would like.  My question is this.  Would it
> be easier to simply use a CompactFlash?

If your board supports IDE, then you can hook up a CF in IDE mode. Even 
without an IDE bus, you can do this quite simply. The CF then looks like an 
IDE hard disk and needs no special drivers etc. There are application notes 
on the Sandisk www on how to do this.

However... this is not a particularly robust solution for a shipping product. 
For those I would suggest a journaling FS that is flash aware (ie. JFFS2 or 
YAFFS).

>
> 	My end goal is to use some sort of flash-based storage, and a
> jffs2 or yaffs root filesystem.  Is it possible to use these filesystems
> on a DiskOnChip at this point, or is support for this still forthcoming?
> Additionally, what would be the easiest way to implement one of these
> filesystems on a DiskOnChip.

You could use DOC for this, but straight NAND (Toshiba, Samsung) would be 
cheaper and likely get you going faster.

IMHO,

-- Charles
