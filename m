Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZhXA-0005Xv-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 01:40:13 +0100
Message-ID: <FA06AA2C99BCD511951200005A99441001E3ECC7@irvexch1.sextantifs.com>
From: "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
To: 'David Woodhouse' <dwmw2@infradead.org>, "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 30 Jul 2002 17:38:33 -0700
Subject: RE: jffs2_scan_eraseblock() - errors
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> you still have INOCACHE_HASHSIZE set to 1 in 
> include/linux/jffs2_fs_sb.h 
> then I can guess what's at the top of your profile. Increase 
> it to 14 or 
> 128 or something for an instant win.

THX, anything like that for JFFS? Unfortunately that is what we are shipping
now and it gets VERY slow, even with our GCD nice level modification.
