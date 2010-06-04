Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OKPHj-0000d3-0Q
	for linux-mtd@lists.infradead.org; Fri, 04 Jun 2010 05:17:35 +0000
Subject: Re: UBIFS and mkfs.ubifs Security Extended attribute support patch
	available?
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: ext akshay st <akshayts@yahoo.co.in>
In-Reply-To: <934572.90077.qm@web94913.mail.in2.yahoo.com>
References: <934572.90077.qm@web94913.mail.in2.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 04 Jun 2010 08:15:00 +0300
Message-ID: <1275628500.25847.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-06-03 at 17:32 +0200, ext akshay st wrote:
> Hi Artem
>  I understand now that it is not completely supported,I also
>  wanted to know is there anything to be done in mkfs.ubifs
>  for security xattr. 

I do not know, you need to look at the sources and try.

> I feel I can just add
>  securityinitinode() while creating a new inode in Linux
>  kernel?

Probably, I do not have time to look at this now, but if you submit me
tested patches, I'll happily accept them.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
