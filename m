Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pd00C-0001qQ-Tb
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2011 12:40:37 +0000
Date: Wed, 12 Jan 2011 13:40:33 +0100
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 4/5] CRIS: stop checking for MTD_CONCAT
Message-ID: <20110112124033.GF7105@axis.com>
References: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
	<1294745619-7142-4-git-send-email-dbaryshkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1294745619-7142-4-git-send-email-dbaryshkov@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Stefan Roese <sr@denx.de>, David Woodhouse <dwmw2@infradead.org>,
	linux-cris-kernel <linux-cris-kernel@axis.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 11, 2011 at 12:33:38PM +0100, Dmitry Eremin-Solenikov wrote:
> As MTD_CONCAT support is becoming an integral part of MTD core,
> there is no need for it's special treatment. So stop checking for
> MTD_CONCAT availability.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Looks good, I'll pull this patch into the cris-tree.

Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>

Thanks!

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
