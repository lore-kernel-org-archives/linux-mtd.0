Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDY30-00025D-8m
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 06:09:37 +0000
Subject: Re: [PATCH] [MTD-UTILS] Incorrect loop condition
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jehan Bing <jehan@orb.com>
In-Reply-To: <4A29CA51.1070906@orb.com>
References: <h077d2$ra9$1@ger.gmane.org>
	<1244204148.5847.54.camel@localhost.localdomain>
	<4A29CA51.1070906@orb.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 08 Jun 2009 09:09:18 +0300
Message-Id: <1244441358.5847.335.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-06-05 at 18:45 -0700, Jehan Bing wrote:
> Small patch to fix an obvious typo.
> 
> If the file contains only a few bytes in the last page and the --oob option is selected, the loop may exit early (readlen < meminfo.oobsize).
> Most of the time it will still work though because the code tries to read the whole OOB in one chunk.
> 
> Signed-off-by: Jehan Bing <jehan@orb.com>

Pushed, thanks.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
