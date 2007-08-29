Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IQKtT-0004aF-QG
	for linux-mtd@lists.infradead.org; Wed, 29 Aug 2007 06:35:30 -0400
Date: Wed, 29 Aug 2007 12:31:08 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: John Klonatos <megaklon@gmail.com>
Subject: Re: Direct Access to flash chips
Message-ID: <20070829103108.GD23020@lazybastard.org>
References: <637199e30708290130s2a533353s5dbcc481337bec4a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <637199e30708290130s2a533353s5dbcc481337bec4a@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 29 August 2007 11:30:46 +0300, John Klonatos wrote:
> 
>          I am new to flash technology. From what i understand so far
> in order to use the mtd layer, one must have direct access to the
> flash chip.
>          If this is correct in the first place, i would like to know
> how one can achieve this kind of direct connection. I have searched
> through the web and so far nothing. I know there are card flash
> readers (SmartMedia and Xd-Picture) but what the host system see is
> the usb interface.
>        So, is there a (free) platform available to make possible this
> type of direct connection. Or it is enough to use the usb
> interface/protocol.

Olympus MAUSB-10 and Fijufilm DPC-R1 allow raw access.  You can use this
driver:
http://logfs.org/~joern/patches/alauda_mtd.patch.26

David, any reason not to merge it?

Jörn

-- 
In America you can have either a flimsy box banged together out of two
by fours and drywall, or a McMansion -- a flimsy box banged together
out of two by fours and drywall, but larger, more dramatic-looking,
and full of expensive fittings.
-- Paul Graham
