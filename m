Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQE8S-0001tl-IR
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 14:40:07 +0000
Date: Wed, 28 Jun 2017 16:39:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
 James Morris <jmorris@namei.org>, linux-fsdevel@vger.kernel.org,
 linux-ima-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 09/10] ubifs: define integrity_read method
Message-ID: <20170628143943.GH2359@lst.de>
References: <1498069110-10009-1-git-send-email-zohar@linux.vnet.ibm.com>
 <1498069110-10009-10-git-send-email-zohar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1498069110-10009-10-git-send-email-zohar@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 21, 2017 at 02:18:29PM -0400, Mimi Zohar wrote:
> Define an ->integrity_read file operation method to read data for
> integrity hash collection.

should be folded into patch 2.
