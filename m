Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LpLOs-0008U9-AK
	for linux-mtd@lists.infradead.org; Thu, 02 Apr 2009 11:48:12 +0000
Subject: Re: Problem in cloning mtd git
From: Artem Bityutskiy <dedekind@infradead.org>
To: vimal singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5790904020439j7a23e93eu3f73bd26cdc4f9d4@mail.gmail.com>
References: <ce9ab5790904020439j7a23e93eu3f73bd26cdc4f9d4@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Apr 2009 14:47:39 +0300
Message-Id: <1238672859.20906.84.camel@localhost.localdomain>
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

On Thu, 2009-04-02 at 17:09 +0530, vimal singh wrote:
> I cloned Linus' official kernel tree. And then tried cloning mtd git
> as mentioned at http://www.linux-mtd.infradead.org/source.html
> 
> I am see below error:
> 
> $ git clone --reference linux-2.6 git://git.infradead.org/mtd-2.6.git mtd-2.6
> warning: templates not found /home_lbp/share/git-core/templates/
> Initialized empty Git repository in /home2/vimal/mtd-2.6/.git/
> fatal: Unable to look up git.infradead.org (port 9418) (Temporary
> failure in name resolution)
> fetch-pack from 'git://git.infradead.org/mtd-2.6.git' failed.
> 
> Any help regarding this is welcome...

Just checked - works fine for me.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
