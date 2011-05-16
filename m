Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QLxWT-0006B6-W0
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 13:07:46 +0000
Received: by ewy3 with SMTP id 3so1451244ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 May 2011 06:07:44 -0700 (PDT)
Subject: Re: [RFC PATCH 0/7] Removing CONFIG_MTD_PARTITIONS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
References: <1305206818-31752-1-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 May 2011 16:04:20 +0300
Message-ID: <1305551060.2630.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-12 at 14:26 +0100, Jamie Iles wrote:
> This patch series is an RFC for the removal of CONFIG_MTD_PARTITIONS.
> Partitioning is still supported, but is always compiled in if CONFIG_MTD is
> selected.  To transition, two new symbols are introduced -
> mtd_device_{,un}register() that replace add_mtd_device(), add_mtd_partitions()
> and their counterparts.  The series converts a number of drivers over to use
> these new interfaces and the final patch removes the old symbols.
> 
> Note that this patch does not transition all of the drivers so is incomplete
> (and not signed off!).  If this approach is suitable then I'll convert all of
> the other drivers over.

Jamie, looks very good at the first glance, thanks a lot!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
