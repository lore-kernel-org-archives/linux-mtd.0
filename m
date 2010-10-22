Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P9Igp-0004LI-0o
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 14:33:51 +0000
Date: Fri, 22 Oct 2010 16:34:16 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Nicolas Kaiser <nikai@nikai.net>
Subject: Re: [PATCH] block2mtd: dubious assignment
Message-ID: <20101022143416.GA12737@logfs.org>
References: <20101022124724.59eba464@absol.kitzblitz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20101022124724.59eba464@absol.kitzblitz>
Cc: linux-mtd@lists.infradead.org, Joern Engel <joern@lazybastard.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 22 October 2010 12:47:24 +0200, Nicolas Kaiser wrote:
> 
> When block2mtd_erase fails, a duplicated assignment instantly
> changes instr->state from MTD_ERASE_FAILED to MTD_ERASE_DONE.
> 
> It looks to me like this might not be intended, or is it?

Definitely not.  Just proves how well block device errors are tested.

> Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
Acked-By: Joern Engel <joern@logfs.org>

Artem, can I leave this patch to you as well?

Jörn

-- 
Eighty percent of success is showing up.
-- Woody Allen
