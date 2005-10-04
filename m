Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EMknU-0006h3-SQ
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2005 07:17:38 -0400
Message-ID: <434264A0.5000708@yandex.ru>
Date: Tue, 04 Oct 2005 15:16:48 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter Grayson <pgrayson@realmsys.com>
References: <1128125846.6926.120.camel@localhost.localdomain>
In-Reply-To: <1128125846.6926.120.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2, symlink, and 2.6.13
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Grayson wrote:
> For those on earlier kernel versions, this change will yield compiler
> warnings. I am not sure what the policy is for maintaining compatibility
> with older kernel versions, so I did not include any changes to
> compatmac.h. Do we want to reproduce the struct inode_operations
> declaration in compatmac.h just so that latest mtd does not yield
> compiler warnings on older kernels?

The patch looks OK. Not sure how to support compatimility, I would just 
let gcc print warnings in older kernels. And it looks like it is 
harmless. Anyone, comments?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
