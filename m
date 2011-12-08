Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYlvU-0007G4-Az
 for linux-mtd@lists.infradead.org; Thu, 08 Dec 2011 21:54:48 +0000
Received: by laam7 with SMTP id m7so548833laa.36
 for <linux-mtd@lists.infradead.org>; Thu, 08 Dec 2011 13:54:46 -0800 (PST)
Subject: Re: [PATCH 4/6] jffs2: fix up error handling for insert_inode_locked
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Eric Sandeen <sandeen@sandeen.net>
Date: Thu, 08 Dec 2011 23:54:43 +0200
In-Reply-To: <4EDE9FDE.3040109@sandeen.net>
References: <4EDE9D54.1030506@redhat.com> <4EDE9FDE.3040109@sandeen.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323381285.2074.4.camel@koala>
Mime-Version: 1.0
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-12-06 at 17:06 -0600, Eric Sandeen wrote:
> after 250df6ed274d767da844a5d9f05720b804240197
> (fs: protect inode->i_state with inode->i_lock), insert_inode_locked()
> no longer returns the inode with I_NEW set on failure.  However,
> the error handler still calls unlock_new_inode() on failure,
> which does a WARN_ON if I_NEW is not set, so any failure spews
> a lot of warnings.
> 
> We can just drop the unlock_new_inode() if insert_inode_locked()
> fails here.
> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Pushed to l2-mtd-2.6.git tree, thanks!

Artem.
