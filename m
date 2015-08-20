Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSP3A-0004IG-Eb
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 12:34:32 +0000
Message-ID: <1440074048.31419.204.camel@gmail.com>
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Date: Thu, 20 Aug 2015 15:34:08 +0300
In-Reply-To: <55D5BC92.8050903@nod.at>
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com> <1440070300.31419.202.camel@gmail.com>
 <55D5BC92.8050903@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-08-20 at 13:40 +0200, Richard Weinberger wrote:
> > Basically, we need to see what is the "common practice" here, and
> > follow it. This requires a small research. What would be the most
> > popular Linux FS which does not support direct I/O? Can we check 
> > what
> > it does?
> 
> All popular filesystems seem to support direct IO.
> That's the problem, application do not expect O_DIRECT to fail.
> 
> My intention was to do it like exofs:

Fair enough, thanks!

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@intel.com>
