Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cB3do-0003D2-Ak
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 17:53:29 +0000
Date: Sun, 27 Nov 2016 12:52:41 -0500
From: Theodore Ts'o <tytso@mit.edu>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, jaegeuk@kernel.org, david@sigma-star.at,
 wd@denx.de, sbabic@denx.de, dengler@linutronix.de,
 ebiggers@google.com, mhalcrow@google.com, hch@infradead.org
Subject: Re: [PATCH 00/29] UBIFS File Encryption v1
Message-ID: <20161127175241.ojvqnla4zn5mkg63@thunk.org>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
 <20161114030548.eils5al7ugfhlqwg@thunk.org>
 <34885683-a40f-eaff-b99d-b11fc68803f7@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34885683-a40f-eaff-b99d-b11fc68803f7@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 25, 2016 at 09:18:12AM +0100, Richard Weinberger wrote:
> 
> Do you want us to address Eric's review comments on top of the fscrypt
> branch or shall we rebase?
> I'd suggest the former.

Yes, let's address them on top of the existing fscrypt branch.  I
don't consider any of his comments super-serious --- they were mostly
documentation or comments level changes unless I missed something.

	      	 	  		       - Ted
