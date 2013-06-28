In-Reply-To: <1372418115-16713-1-git-send-email-dedekind1@gmail.com>
References: <1372418115-16713-1-git-send-email-dedekind1@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] UBIFS: prepare to fix a horrid bug
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Message-ID: <OF2055C26B.290CB8FD-ONC1257B98.00446680-C1257B98.00447A62@transmode.se>
Date: Fri, 28 Jun 2013 14:27:58 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: Linux FS Maling List <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Al Viro <viro@ZenIV.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"linux-mtd" <linux-mtd-bounces@lists.infradead.org> wrote on 2013/06/28 
13:15:14:
> 
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Al Viro pointed me to the fact that '->readdir()' and '->llseek()' have 
no
> mutual exclusion, which means the 'ubifs_dir_llseek()' can be run while 
we are
> in the middle of 'ubifs_readdir()'.
> 
> First of all, this means that 'file->private_data' can be freed while
> 'ubifs_readdir()' uses it.  But this particular patch does not fix the 
problem.
> This patch is only a preparation, and the fix will follow next.
> 
> In this patch we make 'ubifs_readdir()' stop using 'file->f_pos' 
directly,
> because 'file->f_pos' can be changed by '->llseek()' at any point. This 
may
> lead 'ubifs_readdir()' to returning inconsistent data: directory entry 
names
> may correspond to incorrect file positions.
> 
> So here we introduce a local variable 'pos', read 'file->f_pose' once at 
very
> the beginning, and then stick to 'pos'. The result of this is that when
> 'ubifs_dir_llseek()' changes 'file->f_pos' while we are in the middle of
> 'ubifs_readdir()', the latter "wins".

Ouch, I hope JFFS2 doesn't have the same bug?

 Jcoe
