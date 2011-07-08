Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qf28s-0001um-L0
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2011 03:54:17 +0000
Received: by vxd3 with SMTP id 3so1440429vxd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jul 2011 20:54:10 -0700 (PDT)
Subject: Re: [PATCH v3] UBIFS: fix master node recovery
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
Date: Fri, 08 Jul 2011 06:55:13 +0300
In-Reply-To: <1310034302-9201-1-git-send-email-agust@denx.de>
References: <1310032278-5102-1-git-send-email-agust@denx.de>
	<1310034302-9201-1-git-send-email-agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1310097319.32086.2.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-07-07 at 12:25 +0200, Anatolij Gustschin wrote:
> When the 1st LEB was unmapped and written but 2nd LEB not,
> the master node recovery doesn't succeed after power cut.
> We see following error when mounting UBIFS partition on NOR
> flash:
> 
> UBIFS error (pid 1137): ubifs_recover_master_node: failed to recover master node
> 
> Correct 2nd master node offset check is needed to fix the
> problem. If the 2nd master node is at the end in the 2nd LEB,
> first master node is used for recovery. When checking for this
> condition we should check whether the master node is exactly at
> the end of the LEB (without remaining empty space) or whether
> it is followed by an empty space less than the master node size.
> 
> Signed-off-by: Anatolij Gustschin <agust@denx.de>

Pushed, thanks for fixing this!

-- 
Best Regards,
Artem Bityutskiy
