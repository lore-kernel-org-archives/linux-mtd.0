From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Victor <andrew@sanpeople.com>
In-Reply-To: <1107248402.22631.53.camel@fuzzie.sanpeople.com>
References: <1107248402.22631.53.camel@fuzzie.sanpeople.com>
Content-Type: text/plain
Date: Wed, 02 Feb 2005 13:43:48 +0000
Message-Id: <1107351828.18239.26.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2-on-DataFlash : 2 - DataFlash support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-02-01 at 11:00 +0200, Andrew Victor wrote:
> +   bool 'JFFS2 support for DataFlash' CONFIG_JFFS2_FS_DATAFLASH

Heckling on IRC has convinced me that it's time we reduced the mess of
config options. We don't want separate options for all of the random
flash types. 

We could _perhaps_ still have an option to omit wbuf.c entirely and
support only NOR flash, but having an option for each of the other types
is overkill and it's getting ugly. Can we merge the NAND and ECC_NOR and
DATAFLASH options into one? And can we make it use the wbuf on blkmtd
while we're at it?

-- 
dwmw2
