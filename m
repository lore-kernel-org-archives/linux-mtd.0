Received: from mail-bw0-f159.google.com ([209.85.218.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LpLGz-0005dW-CB
	for linux-mtd@lists.infradead.org; Thu, 02 Apr 2009 11:39:59 +0000
Received: by bwz3 with SMTP id 3so501349bwz.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Apr 2009 04:39:51 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 2 Apr 2009 17:09:51 +0530
Message-ID: <ce9ab5790904020439j7a23e93eu3f73bd26cdc4f9d4@mail.gmail.com>
Subject: Problem in cloning mtd git
From: vimal singh <vimal.newwork@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I cloned Linus' official kernel tree. And then tried cloning mtd git
as mentioned at http://www.linux-mtd.infradead.org/source.html

I am see below error:

$ git clone --reference linux-2.6 git://git.infradead.org/mtd-2.6.git mtd-2.6
warning: templates not found /home_lbp/share/git-core/templates/
Initialized empty Git repository in /home2/vimal/mtd-2.6/.git/
fatal: Unable to look up git.infradead.org (port 9418) (Temporary
failure in name resolution)
fetch-pack from 'git://git.infradead.org/mtd-2.6.git' failed.

Any help regarding this is welcome...

-- 
---
\/ | |\/| /-\ |_

____  __o
------   -\<,
----- ( )/ ( )
