Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2Lnf-0008Sl-GB
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 13:09:31 +0000
Date: Mon, 4 Feb 2013 10:09:27 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 37/62] mtd: convert to idr_alloc()
Message-ID: <20130204130926.GA16825@localhost>
References: <1359854463-2538-1-git-send-email-tj@kernel.org>
 <1359854463-2538-38-git-send-email-tj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1359854463-2538-38-git-send-email-tj@kernel.org>
Cc: axboe@kernel.dk, skinsbursky@parallels.com, rusty@rustcorp.com.au,
 jmorris@namei.org, linux-kernel@vger.kernel.org, bfields@fieldses.org,
 linux-mtd@lists.infradead.org, ebiederm@xmission.com,
 akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 02, 2013 at 05:20:38PM -0800, Tejun Heo wrote:
> Convert to the much saner new idr interface.
> 
> Only compile tested.
> 

Tested-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
