Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FbIWs-00087N-C8
	for linux-mtd@lists.infradead.org; Wed, 03 May 2006 10:40:45 -0400
Message-ID: <4458C0C4.9090601@yandex.ru>
Date: Wed, 03 May 2006 18:40:04 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Dmitry Bazhenov <atrey@emcraft.com>
References: <200605031556.37660.atrey@emcraft.com> <44589BCE.2060402@yandex.ru>
	<200605031828.51552.atrey@emcraft.com>
In-Reply-To: <200605031828.51552.atrey@emcraft.com>
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
> I think it can happen. I can imagine at least one scenario where such 
> situation can occur. Of course, in normal circumstances it is hardly possible 
> but in the case of a powerfail it can be.
> 	1. Assume, upon a call to jffs2_commit_write() function the
> 	f->highest_version has the maximum value.
> 	2. jffs2_commit_write() increments f->highest_version which becomes 0.
> 	3. jffs2_commit_write() invokes jffs2_write_dnode() with version=0.

I meant, whether it can happen with a real-life flash device taking into 
account it's limited lifetime. Bear in mind, each eraseblock has limited 
resource. I guess for huge flashes this may be the case, but JFFS2 is 
not usable on them anyway. I'm too lazy to look at digits.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
