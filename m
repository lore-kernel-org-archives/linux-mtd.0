Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EJp2u-0005PO-96
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 05:14:44 -0400
Message-ID: <4337BBA7.8050304@mw-itcon.de>
Date: Mon, 26 Sep 2005 11:13:11 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <43344342.8030303@mw-itcon.de>
	<20050925131630.GC28978@wohnheim.fh-wedel.de>
In-Reply-To: <20050925131630.GC28978@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] fix for mtd partitions for erase_size != 2^X
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> Maybe this:
> #define TRUE_ALIGN(x,a) (((x)+(a)-1) - ((x)+(a)-1) % a)
> 
> The macro is still complicated, but we just have to get it right once.
> 
> Jörn
> 
Are you sure, this is not as complicated as my version ;) ?
But if you like it, no problem.

Shall I resubmit the patch?

Is there any known good way to submit a patch here? I have two mailer 
here, but the mailing list refuses both (as attachment and inline 
attachment).

Best regards
Peter

-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
