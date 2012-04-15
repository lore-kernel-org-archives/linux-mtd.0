Received: from zeniv.linux.org.uk ([195.92.253.2])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SJRRF-0002wO-N1
 for linux-mtd@lists.infradead.org; Sun, 15 Apr 2012 15:32:30 +0000
Date: Sun, 15 Apr 2012 16:32:20 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
To: Joel Reardon <joel@clambassador.com>
Subject: Re: mtdchar kernel oops
Message-ID: <20120415153220.GR6589@ZenIV.linux.org.uk>
References: <alpine.DEB.2.00.1204151350450.13924@eristoteles.iwoars.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1204151350450.13924@eristoteles.iwoars.net>
Sender: Al Viro <viro@ftp.linux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 15, 2012 at 01:58:39PM +0200, Joel Reardon wrote:
> I think that this patch:
> "mtdchar: kill persistently held vfsmount"
> http://permalink.gmane.org/gmane.linux.kernel.commits.head/314175
> 
> has started causing kernel oops's when running ubiformat. The oops is
> occuring in fs/namespace.c's mnt_add_count() line:
>         this_cpu_add(mnt->mnt_pcp->mnt_count, n);
> 
> with the stack trace:
> mntget()
> simple_pin_fs()
> mtdchar_open()

Check if commit c65390f4dd49755863f6d772ec538ee4757c08d7
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Mon Apr 9 01:36:28 2012 -0400

    fix breakage in mtdchar_open(), sanitize failure exits

has fixed that.
