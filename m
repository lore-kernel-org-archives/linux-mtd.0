Subject: Re: [PATCH 00/20] [MTD] Namespace cleanup for MTD drivers
From: David Woodhouse <dwmw2@infradead.org>
To: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
In-Reply-To: <1227574511-23879-1-git-send-email-dmitri.vorobiev@movial.fi>
References: <1227574511-23879-1-git-send-email-dmitri.vorobiev@movial.fi>
Content-Type: text/plain
Date: Tue, 25 Nov 2008 10:00:29 +0000
Message-Id: <1227607229.2665.4.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-11-25 at 02:54 +0200, Dmitri Vorobiev wrote:
> 
> It has come to my attention that many MTD drivers needlessly define
> their module entry points as global symbols. The patch series that
> follows fixes all such places that I was able to identify. Please
> consider.

Many years ago, that was necessary. Now, it's not. Thank you for
cleaning it up.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
