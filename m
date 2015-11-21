Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a03WZ-0000cS-Dx
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 08:27:59 +0000
Received: by pacdm15 with SMTP id dm15so139895963pac.3
 for <linux-mtd@lists.infradead.org>; Sat, 21 Nov 2015 00:27:38 -0800 (PST)
Date: Sat, 21 Nov 2015 00:27:27 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: enhance ONFI table reliability/stable
Message-ID: <20151121082727.GA3023@brian-ubuntu>
References: <A765B125120D1346A63912DDE6D8B6310BF37D1C@NTXXIAMBX02.xacn.micron.com>
 <20151118025010.GB140057@google.com>
 <A765B125120D1346A63912DDE6D8B6310BF51459@NTXXIAMBX02.xacn.micron.com>
 <20151120235927.GD64635@google.com>
 <20151121084604.23fff6f9@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151121084604.23fff6f9@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 21, 2015 at 08:46:04AM +0100, Boris Brezillon wrote:
> This being said, I don't know how you would change the ONFI spec and
> keep it compatible with the previous version. As I said, the current
> version of the spec does not reserve any area after the mandatory
> parameter pages...
> You'll probably have to add a NAND_CMD_ALT_PARAM to support this kind
> of thing.

I was interpreting Bean's comments to mean only a change in software,
not in the actual NAND flash (HW) implementation. If he is suggesting a
change in the flash spec, then that's a completely different discussion.

Brian
