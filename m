Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FbG4J-0006F8-Ra
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 08:03:10 -0400
Message-ID: <44589BCE.2060402@yandex.ru>
Date: Wed, 03 May 2006 16:02:22 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Dmitry Bazhenov <atrey@emcraft.com>
References: <200605031556.37660.atrey@emcraft.com>
In-Reply-To: <200605031556.37660.atrey@emcraft.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 node versioning problem?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dmitry Bazhenov wrote:
> Hello everybody!
> 
> I was just thinking about hypothetical situation with JFFS2 wich possibly 
> could be met in the reality. What happens when the highest node version of a 
> certain inode exceeds the maximum value?
> 
> I think this can be a point where the inode can be broken. If there are two 
> data nodes which have overlapped regions and more recent node has a lesser 
> value then the other node has, then, when the partition is dismounted and 
> mounted again the more recent inode is treated as an older one and could be 
> obsoleted. Even if it is not obsoleted, its data become superseeded by data 
> from the least recent node as the last one has a higher version number.
> 
Can it happen with a real-life flash device? If it can, we have to 
switch to 64-bit versions.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
