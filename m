Received: from tiger.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ujSG-0006yl-00
	for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2002 01:58:04 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: Benjamin Tze-Kit Lee <btlee@sfu.ca>,
	linux-mtd@lists.infradead.org
Subject: Re: lisencing issues on JFFS2/MTD
Date: Fri, 27 Sep 2002 12:54:03 +1200
References: <200209251917.MAA24221@fraser.sfu.ca>
In-Reply-To: <200209251917.MAA24221@fraser.sfu.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020927005754.066B640A2@tiger.actrix.co.nz>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

How much this makes sense will depend largely on the OS you're targeting.

Basically the stuff is usable under GPL. THis means you can redeploy it under 
any OS you choose, so long as you comply with GPL.

I did this with YAFFS. YAFFS started off under Linux, but I ported it to 
WinCE too. The WinCE file-system glue code is to be released under GPL (since 
this is what is required to comply with the original GPL code-base).

-- Charles


On Thu, 26 Sep 2002 07:17, Benjamin Tze-Kit Lee wrote:
> Hi,
>
> What would the liscencing issues if I were to modify JFFS2/MTD and use it
> on a different OS in my embedded system application and sell it as a
> product?
>
> Where should I go to look for that answer?
>
> Thank you very much.
>
> Ben
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
