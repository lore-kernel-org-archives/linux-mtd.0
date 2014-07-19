Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X8Qs3-0006hO-5f
 for linux-mtd@lists.infradead.org; Sat, 19 Jul 2014 09:23:59 +0000
Message-ID: <1405761815.28207.15.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 5/5] fs/ubifs/{sb,super}.c: drop negativity check on
 unsigned value
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Sat, 19 Jul 2014 12:23:35 +0300
In-Reply-To: <1405697725-23866-1-git-send-email-andrey.krieger.utkin@gmail.com>
References: <1405697725-23866-1-git-send-email-andrey.krieger.utkin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dcb314@hotmail.com, adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-07-18 at 18:35 +0300, Andrey Utkin wrote:
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80581
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>

Hi, thanks, but I already have a patch which does the same in the
linux-ubifs.git tree:

commit b793a8c8885d87d9867fb2dbfdc1ef7b5877d71b
Author: hujianyang <hujianyang@huawei.com>
Date:   Wed Jun 11 10:42:52 2014 +0800

    UBIFS: remove useless statements
    
    This patch removes useless and duplicate statements.
    
    Signed-off-by: hujianyang <hujianyang@huawei.com>
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

-- 
Best Regards,
Artem Bityutskiy
