Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OsuEl-0001VP-TI
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 09:13:09 +0000
Received: by fxm12 with SMTP id 12so3670931fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Sep 2010 02:13:06 -0700 (PDT)
Subject: NOTE! mkfs.ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1283848562-19564-1-git-send-email-dedekind1@gmail.com>
References: <1283848562-19564-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Sep 2010 12:11:38 +0300
Message-ID: <1283850698.2979.25.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Arno Steffen <arno.steffen@googlemail.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-07 at 11:36 +0300, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> When mkfs.ubifs is used with -r dir, it does not make the root UBIFS
> inode uid/gid/permissions to be equivalent to dir's permissions, but
> it makes root inode permissions to be equivalent to uid = git = 0
> (root) and permissions = u+rwx go+rx.
> 
> This patch changes the behavior and makes mkfs.ubifs use the
> permissions of the directory containing the original files on the host.
> I.e., it will be <dir>'s uid/git/permissions if case of mkfs.ubifs
> -r <dir>.
> 
> This patch is a bit dangerous because it changes the behavior and may
> have security implications if someone used the older version, relied
> on this bug, and upgrades to the newer version.
> 
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

All mkfs.ubifs users should take a look at this - should we apply this
patch? I'm still in doubt...

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
