Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
From: David Woodhouse <dwmw2@infradead.org>
To: Alex Dubov <oakad@yahoo.com>
In-Reply-To: <692775.60359.qm@web36705.mail.mud.yahoo.com>
References: <692775.60359.qm@web36705.mail.mud.yahoo.com>
Content-Type: text/plain
Date: Wed, 21 May 2008 16:22:09 +0100
Message-Id: <1211383329.21380.358.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: J?rn Engel <joern@logfs.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-05-21 at 08:20 -0700, Alex Dubov wrote:
> Thanks for the comments. At this point it's enough for me to see that you're ok
> with the idea.
> 
> I'll try to implement a working prototype of the proposal, supporting block
> device emulation over smartmedia and memorystick (these are the only mtd
> devices I have). Hopefully, it should take no more than couple of weeks. Then
> we will be able to play with the working prototype to see what features it must
> actually have.

Block device emulation is a separate thing to the core MTD device API.
We already have an implementation of SSFDC, don't we?
      
-- 
dwmw2
