Received: from mgw-ext12.nokia.com ([131.228.20.171])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GZkcA-0003E3-Gn
	for linux-mtd@lists.infradead.org; Tue, 17 Oct 2006 04:48:10 -0400
Subject: Re: [PATCH] UBI: Remove unneeded header includes
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <625fc13d0610161919l415a6e89m4b46115b60d7cf35@mail.gmail.com>
References: <625fc13d0610161919l415a6e89m4b46115b60d7cf35@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 17 Oct 2006 11:47:43 +0300
Message-Id: <1161074863.3260.48.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Josh,

On Mon, 2006-10-16 at 21:19 -0500, Josh Boyer wrote:
> Remove #includes that aren't needed in various files

thanks for review,

but I deliberately included those headers using a simple rule: if you
use some unit, include its header. It is easier to include everything
you use explicitly then remember all the possible places they may be
indirectly included.

-- 
Artem Bityutskiy <dedekind@infradead.org>
