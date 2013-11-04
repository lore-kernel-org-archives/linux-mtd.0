Date: Mon, 4 Nov 2013 09:41:38 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v2 11/27] mtd: nand: pxa3xx: Disable OOB on arbitrary
 length commands
Message-ID: <20131104124137.GF2516@localhost>
References: <1382137374-21251-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1382137374-21251-12-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131103225903.GE5896@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131103225903.GE5896@gmail.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Daniel Mack <zonque@gmail.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 03, 2013 at 05:59:05PM -0500, Huang Shijie wrote:
> On Fri, Oct 18, 2013 at 08:02:38PM -0300, Ezequiel Garcia wrote:
> > READID, STATUS and PARAM (aka ONFI read paramater page) don't read
> > the OOB area. Set the oob_size to zero and prevent it.
> The ERASE, RESET also donot need to read the OOB,
>    why not zero the oob_size for these commands?
> 

Because this only matters for commands that will use the oob_size field
when doing some I/O operation. Both ERASE and RESET commands have no data
cycle, so it makes no sense to haev a non-zero oob_size field.

On the other side, this patch is rather stupid, as oob_size is already
cleared at the beggining of a command sequence. So, I'll either rework
this or drop it entirely.

Thanks,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
