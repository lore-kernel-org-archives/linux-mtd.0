Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REf22-0002hF-FE
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 10:30:27 +0000
Received: by wwg9 with SMTP id 9so633277wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 03:30:23 -0700 (PDT)
Subject: Re: [PATCH] UBIFS FAQ: document reasons for loss of space efficiency
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Drake <dsd@laptop.org>
Date: Fri, 14 Oct 2011 13:29:54 +0300
In-Reply-To: <20111010120701.C525F9D401E@zog.reactivated.net>
References: <20111010120701.C525F9D401E@zog.reactivated.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318588201.12351.88.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-10-10 at 13:07 +0100, Daniel Drake wrote:
> OLPC is suffering a bit from the loss of space efficiency of UBIFS,
> document reasons for this based on an IRC discussion with Artem.
> 
> Also document the difference in default compression schemes between
> JFFS2 and UBIFS which bit us at first.
> 
> Signed-off-by: Daniel Drake <dsd@laptop.org>

Changed mb and GB to MiB and GiB and pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy
