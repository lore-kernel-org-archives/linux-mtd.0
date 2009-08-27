Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MgXZ1-0004Ha-Pb
	for linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 05:30:28 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n7R5TqXX002202
	for <linux-mtd@lists.infradead.org>; Thu, 27 Aug 2009 08:30:12 +0300
Message-ID: <4A9619B9.4020308@gmail.com>
Date: Thu, 27 Aug 2009 08:29:29 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Adrian Hunter <Adrian.Hunter@nokia.com>
Subject: Re: [PATCH] UBIFS: fix commentaries
References: <1251214024-2777-1-git-send-email-dedekind@infradead.org>
In-Reply-To: <1251214024-2777-1-git-send-email-dedekind@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/25/2009 06:27 PM, Artem Bityutskiy wrote:
> From: Artem Bityutskiy<Artem.Bityutskiy@nokia.com>
>
> Change "write-back does take inode @i_mutex" to "write-back does not
> take inode @i_mutex" type. IOW, this patch just adds "not" word, the
> rest of the changes are just re-formatting to fit the 80 characters
> line limit.
>
> Signed-off-by: Artem Bityutskiy<Artem.Bityutskiy@nokia.com>

Please, do not look at this patch. I'll create a different one at
some point.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
