Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR3u2-0006Tv-W1
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 18:10:47 +0000
Date: Fri, 21 Mar 2014 15:09:56 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] ubi-utils: Add ubiblock tool
Message-ID: <20140321180955.GB8890@arch>
References: <1394806381-25458-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1394807124-25916-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1394807124-25916-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 14, Ezequiel Garcia wrote:
> With the addition of block device access to UBI volumes, we now
> add a simple userspace tool to access the new ioctls.
> 
> Usage of this tool is as simple as it gets:
> 
>   $ ubiblock --create /dev/ubi0_0
> 
> will create a new block device /dev/ubiblock0_0, and
> 
>   $ ubiblock --remove /dev/ubi0_0
> 
> will remove the device.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---

Ping?

I'm wondering how's the release cycle for this. Is it possible
to make a release more or less soon, so this new ubiblock tool
is available?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
