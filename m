Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrTlJ-0002k6-DB
 for linux-mtd@lists.infradead.org; Mon, 02 Jun 2014 15:02:57 +0000
Message-ID: <1401721306.11182.146.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v6] ubifs: respect MS_SILENT mount flag
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Date: Mon, 02 Jun 2014 18:01:46 +0300
In-Reply-To: <20140602135102.GA5850@earthship.local>
References: <1401695954.11182.112.camel@sauron.fi.intel.com>
 <20140602135102.GA5850@earthship.local>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 hujianyang@huawei.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-06-02 at 15:51 +0200, Daniel Golle wrote:
> When attempting to mount a non-ubifs formatted volume, lots of error
> messages (including a stack dump) are thrown to the kernel log even if
> the MS_SILENT mount flag is set.
> Fix this by introducing adding an additional state-variable in
> struct ubifs_info and suppress error messages in ubifs_read_node if
> MS_SILENT is set.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Pushed to linux-ubifs.git with a couple of minor amendments.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
