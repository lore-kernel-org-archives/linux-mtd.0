Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FbIYs-0008JT-CH
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 10:43:36 -0400
Message-ID: <4458C13E.8080606@yandex.ru>
Date: Wed, 03 May 2006 18:42:06 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Dmitry Bazhenov <atrey@emcraft.com>
References: <200605031556.37660.atrey@emcraft.com>
	<44589BCE.2060402@yandex.ru>	<200605031828.51552.atrey@emcraft.com>
	<200605031835.34212.atrey@emcraft.com>
In-Reply-To: <200605031835.34212.atrey@emcraft.com>
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
> But it can't happen on unmount since in normal circumstance all previous nodes 
> are obsoleted after the new node has been written. Sorry, my mistake. So, no 
> need for 64-bit versions.

No, in case of version oveflow there will be nasty things, but the idea 
is that we expect that it never overflows because flash should die first.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
