Subject: Re: JFFS2 on NAND and when is file on media?
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF4B25913E.44D637F1-ONC12576CB.0044FF12-C12576CB.00450DD1@transmode.se>
References: <OF8328EA8B.384612F6-ONC12576C5.0061F0C9-C12576C5.00626376@LocalDomain>
	<OF4B25913E.44D637F1-ONC12576CB.0044FF12-C12576CB.00450DD1@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 May 2010 23:58:25 +0100
Message-ID: <1274223505.6930.8287.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-02-15 at 13:34 +0100, Joakim Tjernlund wrote:
> Ping? Pretty please :)
> 
> Joakim Tjernlund/Transmode wrote on 2010/02/09 18:54:39:
> > I have been using JFFS2 for many years on NOR flash but never on NAND.
> > I wonder if NAND has the same guaranties as NOR as to when one
> > can expect file contents to be safely on media so one can pull the power
> > without loss of data?
> > Is the the whole file safe once close(2) returns? If not, what do
> > I have to do flush all outstanding data to media?
> >
> >  Jocke 

POSIX answers this. You need to fsync() before you close, if you want to
be sure the data have all hit the medium.

You _ought_ to be doing that on NOR flash too. Although JFFS2 _today_
might not do any write-behind, there's no guarantee that it won't do so
tomorrow. Or that you won't switch to ubifs/logfs/etc. There's no excuse
for writing buggy applications just because you _happen_ to know that
the file system doesn't _currently_ take certain liberties that it's
permitted to take.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
