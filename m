Date: Fri, 28 Jun 2013 14:54:08 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: [PATCH 1/2] UBIFS: prepare to fix a horrid bug
Message-ID: <20130628135408.GG4165@ZenIV.linux.org.uk>
References: <1372418115-16713-1-git-send-email-dedekind1@gmail.com>
 <OF2055C26B.290CB8FD-ONC1257B98.00446680-C1257B98.00447A62@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OF2055C26B.290CB8FD-ONC1257B98.00446680-C1257B98.00447A62@transmode.se>
Sender: Al Viro <viro@ftp.linux.org.uk>
Cc: Linux FS Maling List <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 28, 2013 at 02:27:58PM +0200, Joakim Tjernlund wrote:
> > So here we introduce a local variable 'pos', read 'file->f_pose' once at 
> very
> > the beginning, and then stick to 'pos'. The result of this is that when
> > 'ubifs_dir_llseek()' changes 'file->f_pos' while we are in the middle of
> > 'ubifs_readdir()', the latter "wins".
> 
> Ouch, I hope JFFS2 doesn't have the same bug?

FWIW, this class of bugs (f_pos races, *not* kfree-under-us) is dealt with
by switch to saner API - see commits in linux-next marked [readdir] <something>
