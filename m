Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PsXfQ-000180-R3
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2011 09:39:25 +0000
Date: Thu, 24 Feb 2011 10:38:00 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Viresh Kumar <viresh.kumar@st.com>
Subject: Re: [PATCH] Newly erased page read workaround
Message-ID: <20110224093800.GA7880@parrot.com>
References: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
Cc: Vipin Kumar <vipin.kumar@st.com>,
	"Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"David.Woodhouse@intel.com" <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 24, 2011 at 06:10:16AM +0000, Viresh Kumar wrote:
> From: Vipin Kumar <vipin.kumar@st.com>
> 
> A newly erased page contains ff in data as well as spare area. While reading an
> erased page, the read out ecc from spare area does not match the ecc generated
> by fsmc ecc hardware accelarator. This is because ecc of data ff ff is not ff
> ff. This leads to errors when jffs2 fs erases and reads back the pages to
> ensure consistency.
> 
> This patch adds a software workaround to ensure that the ecc check is not
> performed for erased pages. An erased page is checked by checking data as ff ff.

Hello Vipin,

Just a suggestion: maybe you could mention in your comments the fact that you
cannot workaround the problem using a mask to get a valid ECC on erased pages,
because your controller does not allow it ?

If you plan to use your workaround on recent NAND devices with UBIFS, you may
still experience problems because of uncorrected bitflips on erased pages, and
get errors such as:

UBIFS error (pid 576): ubifs_scan: corrupt empty space at LEB 509:126586
UBIFS error (pid 576): ubifs_scanned_corruption: corruption at LEB 509:126586
UBIFS error (pid 576): ubifs_scan: LEB 509 scanning failed
UBIFS warning (pid 576): ubifs_ro_mode: switched to read-only mode, error -117

Regards,

Ivan
