Received: from structure.biochem.nchu.edu.tw ([140.120.131.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18KF6s-00042u-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Dec 2002 09:49:27 +0000
Date: Fri, 6 Dec 2002 06:34:15 +0800 (CST)
From: shadow <saturn@structure.biochem.nchu.edu.tw>
To: Henrik Nordstrom <hno@marasystems.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Some problem with patchin.sh !
In-Reply-To: <Pine.LNX.4.44.0212061051210.3166-100000@filer.marasystems.com>
Message-ID: <Pine.LNX.4.44.0212060632140.9062-100000@structure.biochem.nchu.edu.tw>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Thank for your help. Now, it can work.

Brian
On Fri, 6 Dec 2002, Henrik Nordstrom wrote:

> You should be able to make the following change:
> 
> from:
>   grep -m X ...
> to:
> 
>   grep ... | head -X
> 
> where X is the number after -m
> 
> Regards
> Henrik
> 
